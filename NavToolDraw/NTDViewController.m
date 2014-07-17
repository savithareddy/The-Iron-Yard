//
//  NTDViewController.m
//  NavToolDraw
//
//  Created by Savitha Reddy on 5/15/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//



#import "NTDViewController.h"
#import "NTDColorsTVC.h"
#import "NTDNumbersTVC.h"

@interface NTDViewController ()

@end

@implementation NTDViewController
{
    UINavigationController *nc;
    NTDColorsTVC *colorsTVC;
    NTDNumbersTVC *numbersTVC;
    UIButton *startButton;
    UIBarButtonItem *colorsButton;
    UIBarButtonItem *numbersButton;
    UILabel *colorsLabel;
    UILabel *numbersLabel;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.view.backgroundColor = [UIColor cyanColor];
        startButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-80)/2, (SCREEN_HEIGHT-80)/2, 80, 80)];
        startButton.layer.cornerRadius = 40;
        startButton.backgroundColor = [UIColor blackColor];
        [startButton setTitle:@"START" forState:UIControlStateNormal];
        [startButton addTarget:self action:@selector(openTVC) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:startButton];
        
        colorsLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, 100, 20)];
        colorsLabel.text = @"COLORS";
        colorsLabel.textColor = [UIColor blueColor];
        
        numbersLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, 100, 20)];
        numbersLabel.text = @"NUMBERS";
        numbersLabel.textColor = [UIColor blueColor];
    }
    return self;
}

-(void) openTVC
{
    NSLog(@"Launch");
    [startButton removeFromSuperview];
    nc = [[UINavigationController alloc] init];
    nc.navigationBarHidden = NO;
    nc.navigationBar.backgroundColor = [UIColor cyanColor];
    [nc setToolbarHidden:NO animated:NO];
    nc.toolbar.backgroundColor = [UIColor cyanColor];
    nc.navigationBar.topItem.title = @"COLORS";
    colorsButton = [[UIBarButtonItem alloc] initWithTitle:@"COLORS" style:UIBarButtonItemStylePlain target:nil action:@selector(pressColors)];
    numbersButton = [[UIBarButtonItem alloc] initWithTitle:@"NUMBERS" style:UIBarButtonItemStylePlain target:nil action:@selector(pressNumbers)];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [nc.toolbar setItems: @[flexible,colorsButton,flexible,numbersButton,flexible] animated:NO ];
    [self.view addSubview:nc.view];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void) pressColors
{
//    NSLog(@"Colors TVC");
    colorsTVC = [[NTDColorsTVC alloc] initWithStyle:UITableViewStylePlain];
    [self.view addSubview:colorsTVC.view];
    [self openTVC];
    [self.view addSubview:colorsLabel];
//        NSLog(@" View Control presented");

}

-(void) pressNumbers
{
//    NSLog(@" Numbers TVC");
    numbersTVC = [[NTDNumbersTVC alloc] initWithStyle:UITableViewStylePlain];
    [self.view addSubview:numbersTVC.view];
    [self openTVC];
    [self.view addSubview:numbersLabel];
//    NSLog(@" Numbers VC presented");
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}





















/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
