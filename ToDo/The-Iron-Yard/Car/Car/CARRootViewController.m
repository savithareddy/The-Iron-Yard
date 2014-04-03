//
//  CARRootViewController.m
//  Car
//
//  Created by Savitha Reddy on 4/1/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "CARRootViewController.h"
#import "CARAppDelegate.h"
#import "CARWheel.h"
#import "CARBumper.h"
#import "CARWindow.h"
#import "CARIgnition.h"
#import "CARGasPedal.h"
#import "CARBrake.h"



@interface CARRootViewController ()
    
    @end
    
    @implementation CARRootViewController
    
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
        
        CARWheel *wheel1 = [[ CARWheel alloc] init];
        wheel1.frame = CGRectMake(20, 40, 40, 40);
        wheel1.tirePresure=30;
        [self.view addSubview:wheel1];
        
        CARWheel *wheel2 = [[ CARWheel alloc] init];
        wheel2.frame = CGRectMake(80, 40, 40, 40);
        wheel2.tirePresure=30;
        [self.view addSubview:wheel2];
        
        CARWheel *wheel3 = [[ CARWheel alloc] init];
        wheel3.frame = CGRectMake(140, 40, 40, 40);
        
        [self.view addSubview:wheel3];
        
        
        CARWheel *wheel4 = [[ CARWheel alloc] init];
        wheel4.frame = CGRectMake(200, 40, 40, 40);
    
        [self.view addSubview:wheel4];
        
        
        CARIgnition *ignite = [[ CARIgnition alloc] init];
        ignite.frame = CGRectMake(150, 200, 40, 40);
        [ignite setTitle:@"Start" forState: UIControlStateNormal];
        [self.view addSubview:ignite];
        
        CARGasPedal *gasPedal = [[CARGasPedal alloc] init] ;
        gasPedal.frame = CGRectMake(220, 360, 80, 100);
        [gasPedal setTitle:@"Start" forState:UIControlStateNormal];
        [gasPedal addTarget:self action:@selector(pressGasPedal) forControlEvents:UIControlEventTouchUpInside];
         
        [self.view addSubview:gasPedal];
        
        CARBrake *brake = [[CARBrake alloc] init] ;
        brake.frame = CGRectMake(120, 360, 80, 100);
        [brake setTitle:@"Start" forState:UIControlStateNormal];
        [brake addTarget:self action:@selector(pressBrake) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:brake];

        
        CARWindow *windshield = [[CARWindow alloc] init];
        windshield.frame = CGRectMake(20, 160, 200, 200);
        windshield.backgroundColor = [UIColor blackColor];
        windshield.alpha=0.2;
        [self.view addSubview:windshield];
        
    }

-(void)pressGasPedal
{
    NSLog(@"pressed gas");

}

-(void) pressBrake
{
    NSLog(@"pressed brake");
    
}

    
    - (void)didReceiveMemoryWarning
    {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }
    
    
    @end
    
    
    
    



