//
//  NTBColorsVC.m
//  NavToolBar
//
//  Created by Savitha Reddy on 5/18/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "NTBColorsVC.h"
#import "NTBTableViewController.h"
#import "NTBTabView.h"

@interface NTBColorsVC ()

@end

@implementation NTBColorsVC
{
    NTBTableViewController *tvc;
    NTBTabView *tabButton;
    UIView *colorsView;
    UIButton *squareButton;
    UIButton *circleButton;
    UIView *detailSquareView;
    UIView *detailCircleView;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor  = [UIColor whiteColor];
       
        colorsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, self.view.frame.size.height)];
        colorsView.backgroundColor = [UIColor redColor];
        [self.view addSubview:colorsView];
        
        tabButton = [[NTBTabView alloc] initWithFrame:CGRectMake(70, 40, 20, 40)];
        tabButton.tintColor = [UIColor blackColor];
        [tabButton addTarget:self action:@selector(openView) forControlEvents:UIControlEventTouchDragInside];
        [colorsView addSubview:tabButton];
        
        squareButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 30, 30)];
        squareButton.backgroundColor = [ UIColor blackColor];
        [squareButton addTarget:self action:@selector(showSquare) forControlEvents:UIControlEventTouchUpInside];
        [colorsView addSubview:squareButton];
        
        circleButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 260, 30, 30)];
        circleButton.layer.cornerRadius = 15;
        circleButton.backgroundColor = [ UIColor blueColor];
        [circleButton addTarget:self action:@selector(showCircle) forControlEvents:UIControlEventTouchUpInside];
        [colorsView addSubview:circleButton];

        detailSquareView = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, (SCREEN_HEIGHT-100)/2, 100, 100)];
        detailSquareView.backgroundColor = [UIColor blackColor];
        
        
        detailCircleView = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, (SCREEN_HEIGHT-100)/2, 100, 100)];
        detailCircleView.layer.cornerRadius = 50;
        detailCircleView.backgroundColor = [UIColor blueColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideView)];
        [self.view addGestureRecognizer:tap];
        
    }
    return self;
}

-(void) hideView
{
    [UIView animateWithDuration:0.1 animations:^{
        [colorsView removeFromSuperview];
        tabButton.frame = CGRectMake(0, 40, 20, 40);
    }];
}
-(void) showSquare
{
    NSLog(@" square button clicked");
    [self.view addSubview:detailSquareView];
}
-(void) showCircle
{
    NSLog(@" Circle Button Clicked");
    [self.view addSubview:detailCircleView];
}

-(void) openView
{
//    if (colorsView is) {
    [UIView animateWithDuration:0.1 animations:^{
        [self.view addSubview:colorsView];
        tabButton.frame = CGRectMake(70, 40, 20, 40);
    }];
//    }else{
//        [UIView animateWithDuration:0.1 animations:^{
//            [colorsView removeFromSuperview];
//            tabButton.frame = CGRectMake(0, 40, 20, 40);
//        }];
//    }
        
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}


@end
