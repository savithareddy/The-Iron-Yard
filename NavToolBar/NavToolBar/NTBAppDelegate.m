//
//  NTBAppDelegate.m
//  NavToolBar
//
//  Created by Savitha Reddy on 5/17/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "NTBAppDelegate.h"
#import "NTBTableViewController.h"
#import "NTBColorsVC.h"

@implementation NTBAppDelegate
{
     UIButton *startButton;
    UIViewController *vc;
    UIBarButtonItem *colorsButton;
    UIBarButtonItem *numbersButton;
    NTBTableViewController *tvc;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    vc = [[UIViewController alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = vc;
    startButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-80)/2, (SCREEN_HEIGHT-80)/2, 80, 80)];
    startButton.layer.cornerRadius = 40;
    startButton.backgroundColor = [UIColor blackColor];
    [startButton setTitle:@"START" forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(openTVC) forControlEvents:UIControlEventTouchUpInside];
    [vc.view addSubview:startButton];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)openTVC
{
    [startButton removeFromSuperview];
   tvc = [[NTBTableViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:tvc];
//  nc.view.backgroundColor = [UIColor redColor];
    [self.window addSubview:nc.view];
   //    self.window.rootViewController = nc;
        nc.navigationBarHidden = NO;
    [nc setToolbarHidden:NO animated:NO];
    colorsButton = [[UIBarButtonItem alloc] initWithTitle:@"COLORS" style:UIBarButtonItemStylePlain target:nil
                                                   action:@selector(pressColors)];
    numbersButton = [[UIBarButtonItem alloc] initWithTitle:@"NUMBERS" style:UIBarButtonItemStylePlain target:nil action:@selector(pressNumbers)];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    tvc.toolbarItems= [NSArray  arrayWithObjects:flexible,colorsButton,flexible,numbersButton,flexible,nil];

}

-(void) pressColors
{
    NSLog(@" Colors Clicked");
    tvc.navigationItem.title = @"COLORS";
    colorsButton.tintColor = [UIColor blueColor];
    numbersButton.tintColor = [UIColor darkGrayColor];
    [tvc colorsNumbers:1];
    tvc.givalue = 1;
}

-(void) pressNumbers
{
    NSLog(@" Numbers Clicked");
     tvc.navigationItem.title = @"NUMBERS";
    numbersButton.tintColor = [UIColor blueColor];
    colorsButton.tintColor = [UIColor darkGrayColor];
    [tvc colorsNumbers:2];
    tvc.givalue=2;
}





















- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
