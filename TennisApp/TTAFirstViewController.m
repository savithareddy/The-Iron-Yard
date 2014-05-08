//
//  TTAFirstViewController.m
//  TennisApp
//
//  Created by Savitha Reddy on 5/7/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TTAFirstViewController.h"
#import  "TTAData.h"
#import "TTASecondViewController.h"
#import "TTAThirdViewController.h"


@interface TTAFirstViewController () <TTASecondViewControllerDelegate,TTAThirdViewControllerDelegate>

@end

@implementation TTAFirstViewController
{
    UILabel *blueLabel;
    UILabel *redLabel;
    TTASecondViewController *secondVC;
    TTAThirdViewController *thirdVC;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        secondVC = [[TTASecondViewController alloc] initWithNibName:nil bundle:nil];
        secondVC.delegate = self;
       thirdVC = [[TTAThirdViewController alloc] initWithNibName:nil bundle:nil];
        thirdVC.delegate = self;
        }
    return self;
}

-(void)addPoints:(BOOL) checkclick
{
    if (checkclick == YES) {
        
        NSLog(@" RED ");
        [TTAData mainData].redScore ++;
        redLabel.text = [NSString stringWithFormat:@" Red Score = %d",[TTAData mainData].redScore];
        
    } else {
        NSLog(@" BLUE ");
        [TTAData mainData].blueScore++;
        blueLabel.text = [NSString stringWithFormat:@" Blue Score = %d",[TTAData mainData].blueScore];
    }
    [TTAData mainData].totalScore ++;
    NSLog(@" TOTAL ");
    [self CheckGameEnd];
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  //  NSLog(@" ALL ");
 //   NSLog(@" total Score is %d", [TTAData mainData].totalScore);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:secondVC.view];
    [self.view addSubview:thirdVC.view];
    blueLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 50)];
    blueLabel.text = @"Blue Score = 0";
    [self.view addSubview:blueLabel];
    redLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 230, 200, 50)];
    redLabel.text = @"Red Score = 0";
    [self.view addSubview:redLabel];

}

-(void) CheckGameEnd
{
    NSString *result ;
    if ([TTAData mainData].totalScore==10) {
        if ([TTAData mainData].redScore > [TTAData mainData].blueScore) {
            result = @"RED WINNER";
//            NSLog(@" Red Winner ");
        } else if ([TTAData mainData].redScore < [TTAData mainData].blueScore) {
            result = @"BLUE WINNER";
//            NSLog(@" Red Winner ");
        } else if ([TTAData mainData].redScore == [TTAData mainData].blueScore) {
//            NSLog(@" TIE ");
            result= @"TIE";
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over" message:result delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        blueLabel.text = @"Blue Score = 0";
        redLabel.text = @"Red Score = 0";
        [TTAData mainData].redScore = 0;
        [TTAData mainData].blueScore = 0;
        [TTAData mainData].totalScore = 0;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}
-(BOOL) prefersStatusBarHidden
{
    return YES;
}


@end
