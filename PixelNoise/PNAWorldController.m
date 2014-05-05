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
@property (nonatomic) UICollisionBehavior *collision;
@property (nonatomic) UIDynamicAnimator *animator;
@property (nonatomic) UIGravityBehavior *gravity;

@property (nonatomic) UIDynamicItemBehavior *blocksDynamicProperties;

@end

@implementation PNAWorldController
{
    CGPoint point;
    UIView *block;
    PNAPixelSounds * sounds;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.blocks =[@[]mutableCopy];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.player = [[AVAudioPlayer alloc] init];
    
     sounds = [[PNAPixelSounds alloc] init];
    
    [sounds playSoundWithName:@"some_sound"];
   
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

}

-(void) createBlocks
    {
        int  X = point.x;
        int Y = point.y;
        block = [[UIView alloc] initWithFrame:CGRectMake(X, Y, 30, 30)];
        block.backgroundColor = [UIColor blueColor];
        [self.view addSubview:block];
        
        [self.blocks addObject:block];
      
    [self.collision addItem:block];
        
         self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
        
        self.gravity =[[UIGravityBehavior alloc] initWithItems:self.blocks];
        CGVector vector = CGVectorMake(0.0,0.8);
        [self.gravity setGravityDirection:vector];
        [self.animator addBehavior:self.gravity];
        [self blockCollision];
        self.blocksDynamicProperties.elasticity = 1.0;
        self.blocksDynamicProperties.resistance = 0.5;
        self.blocksDynamicProperties.density = 10000;
       
        
    }
-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
//    if ([(NSString *) identifier isEqualToString: @"floor"]){

    [sounds playSoundWithName:@"melodic1_click"];
    [self.collision removeItem:block];
//    }
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
