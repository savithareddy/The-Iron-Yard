//
//  TDLAppDelegate.m
//  ToDo
//
//  Created by Savitha Reddy on 4/2/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TDLAppDelegate.h"
#import "TDLTableViewController.h"

@implementation TDLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
   
    self.window.rootViewController = [[TDLTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}



@end
