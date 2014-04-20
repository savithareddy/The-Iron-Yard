//
//  BBAViewController.m
//  BrickBreaker
//
//  Created by Savitha Reddy on 4/17/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "BBAViewController.h"
#import "BBALevelController.h"

@interface BBAViewController () <BBALevelDelegate> //add levelDelegate to call the delegate in the levelController.h

@end

@implementation BBAViewController
{
    BBALevelController *level;
    UIButton *startButton;
    UILabel *pointsLabel;
    UILabel *livesLabel;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            }
    return self;
}

-(void)pressStartButton
{
    level = [[BBALevelController alloc] initWithNibName:nil bundle:nil];
    level.delegate = self;
    
    level.view.frame = CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT-40);
    [self.view addSubview:level.view];
    
    [startButton removeFromSuperview];
    [level resetLevel];
}

-(void) addPoints:(int)points
{
   pointsLabel.text = [[NSString alloc] initWithFormat:@"Total points = %i",points];
}

-(void) reduceLives:(int) lives
{
    livesLabel.text = [[NSString alloc] initWithFormat:@"Lives = %i",lives];
    
}

-(void) gameDone
{
    [level.view removeFromSuperview];
    [self.view addSubview:startButton];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,40)];
    header.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:header];
    
    startButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-120)/2, (SCREEN_HEIGHT-120)/2, 120, 120)];
    startButton.layer.cornerRadius = 60;
    [startButton setTitle:@"START" forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(pressStartButton) forControlEvents:UIControlEventTouchUpInside];
    startButton.backgroundColor = [UIColor blackColor];
    [self.view addSubview:startButton];
    
    pointsLabel = [[UILabel alloc]initWithFrame:CGRectMake(340, 10, 100, 20)];
    pointsLabel.backgroundColor = [UIColor clearColor];
    pointsLabel.textColor =[UIColor blackColor];
    pointsLabel.text = @"Total points = 0";
    pointsLabel.font = [UIFont systemFontOfSize:10];
    [header addSubview:pointsLabel];
    
    livesLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 100, 20)];
    livesLabel.backgroundColor = [UIColor clearColor];
    livesLabel.textColor =[UIColor blackColor];
    livesLabel.text = @"Lives 0";
    livesLabel.font = [UIFont systemFontOfSize:10];
    [header addSubview:livesLabel];

    
}
-(BOOL) prefersStatusBarHidden
{
    return YES;
    
}

@end
