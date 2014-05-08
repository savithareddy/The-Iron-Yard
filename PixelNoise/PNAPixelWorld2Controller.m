//
//  PNAPixelWorld2Controller.m
//  PixelNoise
//
//  Created by Savitha Reddy on 5/6/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "PNAPixelWorld2Controller.h"
#import "PNAPixelSounds.h"

@interface PNAPixelWorld2Controller () <UICollisionBehaviorDelegate>

@property (nonatomic) UICollisionBehavior *collision;
@property (nonatomic) UIDynamicAnimator *animator;
@property (nonatomic) UIGravityBehavior *gravity;
@property (nonatomic) UIDynamicItemBehavior *shardBehaviour;
@property (nonatomic) UICollisionBehavior *shardCollision;
@end

@implementation PNAPixelWorld2Controller
{
    PNAPixelSounds *sounds;
    NSArray *splatterDirections;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
       self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];//all these 3 have to be alloc init once only
        self.gravity =[[UIGravityBehavior alloc] init];
        [self.animator addBehavior:self.gravity];
        self.collision = [[UICollisionBehavior alloc ]init];
        self.collision.translatesReferenceBoundsIntoBoundary = YES;
        self.collision.collisionDelegate = self; // to say that colision has occured delegates required// next colision method is required
        [self.animator addBehavior:self.collision];
        sounds = [[PNAPixelSounds alloc] init];
        
        self.shardBehaviour = [[UIDynamicItemBehavior alloc] init];
        self.shardBehaviour.density = 10;
        [self.animator addBehavior:self.shardBehaviour];
        self.shardCollision = [[UICollisionBehavior alloc ]init];
        self.shardCollision.translatesReferenceBoundsIntoBoundary = YES;
        self.shardCollision.collisionDelegate = self; // to say that colision has occured delegates required// next colision method is required
        [self.animator addBehavior:self.shardCollision];
        
        
        splatterDirections = @[
                               [NSValue valueWithCGPoint:CGPointMake(-0.1, -0.1)],
                               [NSValue valueWithCGPoint:CGPointMake(-0.05, -0.1)],
                               [NSValue valueWithCGPoint:CGPointMake(0.0, -0.1)],
                               [NSValue valueWithCGPoint:CGPointMake(0.05, -0.1)],
                               [NSValue valueWithCGPoint:CGPointMake(0.1, -0.1)]
                               ];
    }
    return self;
}
-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    if ([behavior isEqual:self.collision])
    {
    [sounds playSoundWithName:@"melodic1_click"];
    //NSLog(@"%@",identifier); // this shows null at this step //without any lines down
    [self createShardsWithLocation:p]; // in the method collisionBehaviour the CGPoint is p therefore use p for CGPoint

    UIView *collidedBlock = (UIView *)item;
    NSLog(@"collidedBlock is %@", collidedBlock); // id above says can be anyitem
    [self.gravity removeItem:collidedBlock];
    [self.collision removeItem:collidedBlock];
    [collidedBlock removeFromSuperview]; // no removefromsubview for the collidedBlock
    }
    if ([behavior isEqual:self.shardCollision])
    {
        
        UIView *collidedShard = (UIView *)item;
        //NSLog(@"collidedBlock is %@", collidedShard); // id above says can be anyitem
        [self.gravity removeItem:collidedShard];
        [self.shardBehaviour removeItem:collidedShard];
        [self.shardCollision removeItem:collidedShard];
        [collidedShard removeFromSuperview];
    }
}

-(void) createShardsWithLocation : (CGPoint) location //created after the splatterarray
{
    for (NSValue *pointValue in splatterDirections) // pointvalue user defined name
    {
        CGPoint direction = [pointValue CGPointValue];
        UIView *shard = [[UIView alloc] initWithFrame:CGRectMake(location.x + (direction.x * 200), location.y-50, 5, 5)]; // used the direction value to spred the shards from colliding
        NSLog(@"block is %@", shard); // shows the memmory addredd same as the collidedblock in the colllision behaviour method
        shard.backgroundColor= [UIColor blueColor];
        [self.view addSubview:shard]; //add blck to subview first then add to gravity and collision
        [self.gravity addItem:shard];
      [self.shardCollision addItem:shard];
        [self.shardBehaviour addItem:shard];
        UIPushBehavior *pusher  =[[UIPushBehavior alloc] initWithItems:@[shard] mode:UIPushBehaviorModeInstantaneous];
        //[pusher addItem:shard]; // this is taken care by the initWithItems @[shard] requires an array so write as shard as an array
        [self.animator addBehavior:pusher];
        pusher.pushDirection = CGVectorMake(direction.x, direction.y);
        
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches)
        [self createBlockWithLocation:[touch locationInView:self.view]]; //2 lines to one
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches)
        [self createBlockWithLocation:[touch locationInView:self.view]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(void) createBlockWithLocation:(CGPoint ) location //CGPoint is C struct therefore no * required and also CGpoint array possible for this reason
{
//    if ([[self.view subviews] count] >3) return;
    
    UIView *block = [[UIView alloc] initWithFrame:CGRectMake(location.x, location.y, 10, 30)];
    block.layer.cornerRadius = 15;
    NSLog(@"block is %@", block); // shows the memmory addredd same as the collidedblock in the colllision behaviour method
    block.backgroundColor= [UIColor blueColor];
    [self.view addSubview:block]; //add blck to subview first then add to gravity and collision
    [self.gravity addItem:block];
    [self.collision addItem:block];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
