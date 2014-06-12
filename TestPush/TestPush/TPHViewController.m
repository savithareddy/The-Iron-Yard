//
//  TPHViewController.m
//  TestPush
//
//  Created by Savitha Reddy on 6/9/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TPHViewController.h"
#import <Parse/Parse.h>

@interface TPHViewController ()

@end

@implementation TPHViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // allows to subscribe to a channel
        PFInstallation *currentInstallation = [PFInstallation currentInstallation];
        [currentInstallation addUniqueObject:@"Braves" forKey:@"channels"]; // channels is the system key to use channels //cannot change.
//        currentInstallation.channels // gives all the channels within this
        [currentInstallation saveInBackground];
        
        //push to a channel
        PFPush *push = [[PFPush alloc]init];
        [push setChannel:@"Braves"];
        [push setMessage:@"Braves Win !"];
        [push sendPushInBackground];
        
        
        //push based on query
        PFQuery *query = [PFQuery queryWithClassName:@"User"];
        [query whereKey:@"age" greaterThan:@(20)];
        
        PFPush  *pushWithQuery = [[PFPush alloc] init];
        [pushWithQuery setQuery:query];
        [pushWithQuery setMessage:@"Beer is Awesome!"];
        [pushWithQuery sendPushInBackground];
                                  
                                  
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
