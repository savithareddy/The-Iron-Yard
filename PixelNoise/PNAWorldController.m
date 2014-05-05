//
//  PNAWorldController.m
//  PixelNoise
//
//  Created by Savitha Reddy on 5/5/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "PNAWorldController.h"
#import  <AVFoundation/AVFoundation.h>

@interface PNAWorldController ()

@property (nonatomic) NSMutableArray *blocks;
@property (nonatomic) UICollisionBehavior *collision;
@property (nonatomic) UIDynamicAnimator *animator;
@property (nonatomic) UIGravityBehavior *gravity;

@property (nonatomic) UIDynamicBehavior *blocksDynamicProperties;

@end

@implementation PNAWorldController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
}

-(void) createBlocks
    {
        UIView *block = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 10, 10)];
        block.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
        [self.view addSubview:block];
        //add balls to the balls array
        [self.blocks addObject:block];
        
//        [self.collider addItem:ball];
//        [self.ballsDynamicProperties addItem:ball];
//        
//        //start ball off with a push
//        self.pusher =[[UIPushBehavior alloc] initWithItems:self.balls mode:UIPushBehaviorModeInstantaneous];
//        self.pusher.pushDirection = CGVectorMake(0.01, 0.01); //nos says the direction amount is the speed // quadrant style
//        self.pusher.active = YES; //because push is instantaneous, it wll only happen once
//        [self.animator addBehavior:self.pusher];
//        
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self createBlocks];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
