//
//  TLAAppDelegate.m
//  TweetLike
//
//  Created by Savitha Reddy on 4/23/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TLAAppDelegate.h"
#import "TLATableViewController.h"
#import "TLANavController.h"

@implementation TLAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //self.window.rootViewController = [[TLATableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    TLANavController *nc = [[TLANavController alloc]init];
    self.window.rootViewController = nc;
    [nc addTableViewController:[[TLATableViewController alloc] initWithStyle:UITableViewStylePlain]];
    
   // TLATableViewController *tvc = [[TLATableViewController alloc] initWithStyle:UITableViewStylePlain];
    //self.window.rootViewController = [[TLANavController alloc] initWithRootViewController:tvc];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
