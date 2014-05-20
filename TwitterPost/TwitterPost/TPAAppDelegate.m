//
//  TPAAppDelegate.m
//  TwitterPost
//
//  Created by Savitha Reddy on 5/20/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TPAAppDelegate.h"
#import "TPAViewController.h"

@implementation TPAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[TPAViewController alloc]init];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
