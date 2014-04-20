//
//  BBAAppDelegate.m
//  BrickBreaker
//
//  Created by Savitha Reddy on 4/17/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "BBAAppDelegate.h"
#import "BBAViewController.h"

@implementation BBAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[BBAViewController alloc] initWithNibName:nil bundle:nil]; //added a rootviewcontroller
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
