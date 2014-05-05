//
//  BBALevelController.m
//  BrickBreaker
//
//  Created by Savitha Reddy on 4/17/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "BBALevelController.h"
#import <AVFoundation/AVFoundation.h> // for sounds

@interface BBALevelController () <UICollisionBehaviorDelegate,UIAlertViewDelegate> //added this < >//private interface // @property in .h file is global

@property (nonatomic) AVAudioPlayer *player; // creating an object // next step init the object // property is in .m so no @implemtation

@property (nonatomic) UIView *paddle;
@property (nonatomic) NSMutableArray *balls;
@property (nonatomic) NSMutableArray *bricks;

//animator object UIdynamic animator
@property (nonatomic) UIDynamicAnimator *animator;
//push behaviour // pushes the ball
@property (nonatomic) UIPushBehavior *pusher;
//handles collision
@property (nonatomic) UICollisionBehavior *collider;
//item behaviour properties
@property (nonatomic) UIDynamicItemBehavior *paddleDynamicProperties;
@property (nonatomic) UIDynamicItemBehavior *ballsDynamicProperties;
@property (nonatomic) UIDynamicItemBehavior *bricksDynamicProperties;
//item attachment
@property (nonatomic) UIAttachmentBehavior *attacher;


@end

@implementation BBALevelController
{
    float paddleWidth;
    UILabel *points;
    int  pointCount;
    UILabel *pointsLabel;
    int brickCols;
    int brickRows;
    int ballCount;
    int lives;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.bricks = [@[] mutableCopy]; // properties have to be called with self since they are declared as private
        self.balls = [@[] mutableCopy];
        paddleWidth = 80;
        pointCount =0;
        lives = 5;
        self.view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen:)];
        [self.view addGestureRecognizer:tap];
        self.player = [[AVAudioPlayer alloc] init]; //player only gives an error //_player is the option // but self.player is correct //next step crete a method playSoundWithName
                }
    return self;
}


-(void) playSoundWithName:(NSString *) soundName // after this method is creating next step call this method where collision happens
{
    NSString *file = [[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:file]; //either data or url can be used // soundfile place in the browser has the corresponding URL // important to alloc init NSURL to play the sound
    self.player  = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player play];
}

-(void) tapScreen: (UITapGestureRecognizer *) gr
{
    CGPoint location = [gr locationInView:self.view];
    self.attacher.anchorPoint  =CGPointMake(location.x, self.attacher.anchorPoint.y);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(void) resetLevel
{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    [self createPaddle];
    [self createBall];
    [self createBricks];
    self.collider = [[UICollisionBehavior alloc] initWithItems:[self allItems]];
    self.collider.collisionDelegate = self;
    self.collider.collisionMode = UICollisionBehaviorModeEverything;
    //self.collider.translatesReferenceBoundsIntoBoundary = YES;//connects to initWithReference // this is the action where it bounces of the walls // also we can set top left right etc ,....
    int w= self.view.frame.size.width;
    int h = self.view.frame.size.height; //check #define for height and width bounds
    [ self.collider addBoundaryWithIdentifier:@"ceiling" fromPoint:CGPointMake(0,0) toPoint:CGPointMake(w, 0)];
    [ self.collider addBoundaryWithIdentifier:@"leftWall" fromPoint:CGPointMake(0,0) toPoint:CGPointMake(0, h)];
    [ self.collider addBoundaryWithIdentifier:@"rightWall" fromPoint:CGPointMake(w,0) toPoint:CGPointMake(w, h)];
    [ self.collider addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(0,h+10) toPoint:CGPointMake(w, h+10)];
    [self. animator addBehavior:self.collider];
    
    self.ballsDynamicProperties =[self createPropertiesForItems:self.balls];
    self.bricksDynamicProperties =[self createPropertiesForItems:self.bricks];
    self.paddleDynamicProperties =[self createPropertiesForItems:@[self.paddle]]; //literal array
    self.paddleDynamicProperties.density = 50000; // to make the paddle and the brick heavy use density prop
    self.bricksDynamicProperties.density = 100000;
    self.ballsDynamicProperties.elasticity = 1.0;
    self.ballsDynamicProperties.resistance = 0.0;
    //self.ballsDynamicProperties.allowsRotation = YES; // if only balls rotation is required
}


-(void) collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    if ([(NSString *) identifier isEqualToString:@"floor"])
    {
        UIView * ball =(UIView *) item1;
       [ball removeFromSuperview];
        [self.collider removeItem:ball];
       --lives;
        if([self.delegate respondsToSelector:@selector(reduceLives:)]) [self.delegate reduceLives:lives];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@" Ball Missed " message:@" 1 life reduced " delegate:self cancelButtonTitle:@" ok " otherButtonTitles:nil];
        [alertView show];
        alertView.delegate = self;
//        [self.view addSubview:ball];
//        [self.animator addBehavior:self.collider];
        if (lives <= 0) {
            if ([self.delegate respondsToSelector:@selector(gameDone)]) [self.delegate gameDone];

        }
        
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(lives > 0) [self createBall];
}


-(void) collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p
{
    
    if ([item1 isEqual:self.paddle] || [item2 isEqual:self.paddle]) {
        [self playSoundWithName:@"retro_click"];
        
    }
    UIView *tempBrick;
    for (UIView * brick in self.bricks) // NOTE:DONOT add or remove an item from a array within any loop
    {
        if ([item1 isEqual:brick] || [item2 isEqual : brick])
        {
            if(brick.alpha == 0.5)
            {
            tempBrick =brick;
                points= [[UILabel alloc] initWithFrame:CGRectMake(tempBrick.frame.origin.x, 10, 50, 30)];
                //points.text = @"+100 ";
                points.text = [NSString stringWithFormat:@"+%d",(int)brick.tag];
                points.backgroundColor = [UIColor clearColor];
                [self.view addSubview:points];
                //[UIView animateWithDuration:0.25 animations:^{points.alpha = 0.0;}]; // ^ BLOCKS of Code
                [UIView animateWithDuration:0.25 animations:^{points.alpha = 0.0;}completion :^(BOOL finished){
                 [points removeFromSuperview];
                    }];
                // from points alloc to animate can be written as a seperate method  -say pointLabelWithLabel etcc...see in NoteBook
                [brick removeFromSuperview];
                [self.collider removeItem:brick];
                
                //pointCount += 100;
                pointCount += brick.tag;
           
                //pointsLabel.text = [[NSString alloc] initWithFormat:@"Total points = %i",pointCount];
                
                if ([self.delegate respondsToSelector:@selector(addPoints:)]) {
                    [self.delegate addPoints:pointCount];
                }

                }
            brick.alpha = 0.5;
        }
        
    }
        if (tempBrick != nil) {
            [self playSoundWithName:@"electric_alert"]; // after creating the method use this
      [self.bricks removeObjectIdenticalTo:tempBrick];
            //if ([self.bricks count] == 0) {
        }
    
}

-(UIDynamicItemBehavior *) createPropertiesForItems :(NSArray *) items
{
    UIDynamicItemBehavior *properties = [[UIDynamicItemBehavior alloc]initWithItems:items];
    properties.allowsRotation = NO; // all properties no rotation// balls, bricks,paddle
    properties.friction = 0.0;
    [self.animator addBehavior:properties];
    return properties;
}

-(NSArray *)allItems
{
    NSMutableArray * items =  [@[self.paddle]mutableCopy];
    for (UIView *item in self.balls)[items addObject:item];
    for (UIView *item in self.bricks)[items addObject:item];
    return items;
}

-(void) createPaddle
{
self.paddle = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - paddleWidth)/2, SCREEN_HEIGHT-80, paddleWidth, 6)];
    self.paddle.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1.0]; // 1.0 complete transparency alpha
    self.paddle.layer.cornerRadius = 3;
    [self.view addSubview:self.paddle];
    self.attacher  =[[UIAttachmentBehavior alloc] initWithItem:self.paddle attachedToAnchor:CGPointMake(CGRectGetMidX(self.paddle.frame),CGRectGetMidY(self.paddle.frame))];
    [self.animator addBehavior:self.attacher];
    [UIView animateWithDuration:0.4 animations:^{points.alpha = 0.0;}];
}

-(void)createBricks
{
    brickCols = 3;
    brickRows = 3;
    float brickWidth = (SCREEN_WIDTH - (10 * (brickCols +1)))/brickCols ;
    float brickHeight = ((SCREEN_HEIGHT-200) - (10 * (brickRows +1)))/brickRows ;
    for (int i=0;i<brickCols; i++)
    {
        for (int j=0;j<brickRows; j++)
        {
        float brickX = ((brickWidth + 10)*i)+10;
        float brickY = ((brickHeight + 10)*j)+10;
        UIView *  brick = [[UIView alloc] initWithFrame:CGRectMake(brickX, brickY, brickWidth, brickHeight)];
        brick.layer.cornerRadius = 6;
        brick.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1.0];
        int random = arc4random_uniform(5)*50;
        brick.tag = random;
        [self.view addSubview:brick];
        [self.bricks addObject:brick];
        
        }
    }
}

-(void) createBall
{
    
    CGRect frame = self.paddle.frame; // creating the ball to sit on the top left corner(origin) of the paddle
    UIView *ball = [[UIView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y-10, 10, 10)];
    ball.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    ball.layer.cornerRadius = 5;
    [self.view addSubview:ball];
    //add balls to the balls array
    [self.balls addObject:ball];
    
    [self.collider addItem:ball];
    [self.ballsDynamicProperties addItem:ball];
    
    //start ball off with a push
    self.pusher =[[UIPushBehavior alloc] initWithItems:self.balls mode:UIPushBehaviorModeInstantaneous];
    self.pusher.pushDirection = CGVectorMake(0.01, 0.01); //nos says the direction amount is the speed // quadrant style
    self.pusher.active = YES; //because push is instantaneous, it wll only happen once
    [self.animator addBehavior:self.pusher];
    
}

@end
