//
//  TTASecondViewController.m
//  TennisApp
//
//  Created by Savitha Reddy on 5/7/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TTASecondViewController.h"
#import "TTAData.h"

@interface TTASecondViewController ()

@end

@implementation TTASecondViewController
{
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/2);
        self.view.backgroundColor = [UIColor blueColor];
       
        }
    return self;
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)even
{
//    NSLog(@" BLUE ");
//    [TTAData mainData].blueScore++;
//    [TTAData mainData].totalScore ++;
//    NSLog(@" total Score is %d", [TTAData mainData].totalScore);

    [self.delegate addPoints:YES];

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
