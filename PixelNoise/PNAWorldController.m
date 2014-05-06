//
//  PNAWorldController.m
//  PixelNoise
//
//  Created by Savitha Reddy on 5/5/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "PNAWorldController.h"
#import "PNAPixelSounds.h"

@interface PNAWorldController () <UICollisionBehaviorDelegate>

@property (nonatomic) AVAudioPlayer *player;
@property (nonatomic) NSMutableArray *blocks;
@property (nonatomic) NSMutableArray *smallBlocks;
@property (nonatomic) UICollisionBehavior *collision;
@property (nonatomic) UIDynamicAnimator *animator;
@property (nonatomic) UIGravityBehavior *gravity;
@property (nonatomic) UIPushBehavior *pusher;

@property (nonatomic) UIDynamicItemBehavior *blocksDynamicProperties;
@property (nonatomic) UIDynamicItemBehavior *smallBlocksDynamicProperties;

@end

@implementation PNAWorldController
{
    CGPoint point;
    UIView *block;
    PNAPixelSounds * sounds;
    UIView *smallBlock;
    //NSArray *vectorArrayx;
   // NSArray *vectorArrayy;
   
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.blocks =[@[]mutableCopy];
        self.smallBlocks = [@[]mutableCopy];
            }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.player = [[AVAudioPlayer alloc] init];
    
     sounds = [[PNAPixelSounds alloc] init];
    
//    [sounds playSoundWithName:@"some_sound"];
   
}
//-(void) playSoundWithName:(NSString *) soundName // after this method is creating next step call this method where collision happens
//{
//    NSString *file = [[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"];
//    NSURL *url = [[NSURL alloc] initFileURLWithPath:file]; //either data or url can be used // soundfile place in the browser has the corresponding URL // important to alloc init NSURL to play the sound
//    self.player  = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
//    [self.player play];
//}

-(void) blockCollision
{
   
    self.collision = [[UICollisionBehavior alloc] initWithItems:self.blocks];
    self.collision.collisionDelegate = self;
    int w= self.view.frame.size.width;
    int h = self.view.frame.size.height;
    //self.collision.translatesReferenceBoundsIntoBoundary = YES;
    [ self.collision addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(0,h) toPoint:CGPointMake(w, h)];
    [self. animator addBehavior:self.collision];
   self.blocksDynamicProperties =[self createPropertiesForItems:self.blocks];
    self.smallBlocksDynamicProperties = [self createPropertiesForItems:self.smallBlocks];
}

-(void) createBlocks
    {
        int  X = point.x;
        int Y = point.y;
        block = [[UIView alloc] initWithFrame:CGRectMake(X, Y, 40, 40)];
        block.backgroundColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"cat2.jpeg"]];
        [self.view addSubview:block];
        [self.blocks addObject:block];
      [self.collision addItem:block];
        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
        self.gravity =[[UIGravityBehavior alloc] initWithItems:self.blocks];
        CGVector vector = CGVectorMake(0.0,0.8);
        [self.gravity setGravityDirection:vector];
//         [sounds playSoundWithName:@"cat_angry"];
        [self.animator addBehavior:self.gravity];
        [self blockCollision];
        self.blocksDynamicProperties.elasticity = 0.1;
        self.blocksDynamicProperties.resistance = 0.0;
        self.blocksDynamicProperties.density = 10;
        self.smallBlocksDynamicProperties.friction = 1.0;
        self.smallBlocksDynamicProperties.angularResistance = 1.0;
        self.smallBlocksDynamicProperties.elasticity =1.0;
        
       
        
    }
-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    //[sounds playSoundWithName:@"cat_angry"];
    
        NSLog(@" block end pos x  %f", block.frame.origin.x);
    NSLog(@" block end pos y%f", block.frame.origin.y);
   //if (block.frame.origin.y >= 439) {
 if ([(NSString *) identifier isEqualToString:@"floor"] ){
     [self.collision removeItem:block];
    for (int i=0; i <5; i++) {
        NSLog(@"looped %d",i);
        smallBlock = [[UIView alloc] initWithFrame:CGRectMake(point.x, 439, 10, 10)];
        smallBlock.backgroundColor = [UIColor blueColor];
        [self.smallBlocks addObject:smallBlock];
        [self.view addSubview:smallBlock];
        self.pusher =[[UIPushBehavior alloc] initWithItems:self.smallBlocks mode:UIPushBehaviorModeContinuous];
        self.pusher.active = YES;
        if (i==0) {
                self.pusher.pushDirection = CGVectorMake(-0.01,-0.5 );
           self.pusher.angle = 10;
                 [self.animator addBehavior:self.pusher];
                }
             else if (i==1){
                self.pusher.pushDirection = CGVectorMake(-0.01,-0.01 );
                 self.pusher.angle = 45;
                [self.animator addBehavior:self.pusher];
                }
            else if (i==2){
                self.pusher.pushDirection = CGVectorMake(-0.0,-0.1);
             [self.animator addBehavior:self.pusher];
            }
            else if (i==3){
                self.pusher.pushDirection = CGVectorMake(0.01,-0.01 );
             [self.animator addBehavior:self.pusher];
            }
            else {
            self.pusher.pushDirection = CGVectorMake(0.01,-0.00 );
             [self.animator addBehavior:self.pusher];
            }
    }
    }
}

-(UIDynamicItemBehavior *) createPropertiesForItems :(NSArray *) items
{
    UIDynamicItemBehavior *properties = [[UIDynamicItemBehavior alloc]initWithItems:items];
    [self.animator addBehavior:properties];
    return properties;
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  
    UITouch *touch = [touches anyObject];
       point = [touch locationInView:self.view];
        NSLog(@"X location: %f", point.x);
        NSLog(@"Y Location: %f",point.y);
    [self createBlocks];
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
     UITouch *touch = [touches anyObject];
    point = [touch locationInView:self.view];
    NSLog(@"X location: %f", point.x);
    NSLog(@"Y Location: %f",point.y);
    [self createBlocks];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
