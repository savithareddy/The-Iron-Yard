//
//  TWTAppDelegate.m
//  AppTweet
//
//  Created by Savitha Reddy on 4/13/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TWTAppDelegate.h"
#import "TWTTableViewController.h"

@implementation TWTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    TWTTableViewController *rootViewController = [ [TWTTableViewController alloc] initWithStyle:UITableViewStylePlain ];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    self.window.rootViewController = navController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
@end
