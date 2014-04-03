//
//  SRFAppDelegate.m
//  April1
//
//  Created by Savitha Reddy on 4/1/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SRFAppDelegate.h"
#import "SRFRootViewController.h"

@implementation SRFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[SRFRootViewController alloc] init];
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
