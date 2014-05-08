//
//  TTAThirdViewController.m
//  TennisApp
//
//  Created by Savitha Reddy on 5/7/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TTAThirdViewController.h"
#import "TTAData.h"

@interface TTAThirdViewController ()

@end

@implementation TTAThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.frame = CGRectMake(0, SCREEN_HEIGHT/2, SCREEN_WIDTH, SCREEN_HEIGHT/2);
        self.view.backgroundColor = [UIColor redColor];
        }
    return self;
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    NSLog(@" RED ");
//    [TTAData mainData].redScore ++;
//    [TTAData mainData].totalScore ++;
//    NSLog(@" total Score is %d", [TTAData mainData].totalScore);
    [self.delegate addPoints: NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}



@end
