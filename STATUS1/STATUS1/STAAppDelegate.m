//
//  STAAppDelegate.m
//  STATUS1
//
//  Created by Savitha Reddy on 5/19/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "STAAppDelegate.h"
#import "STAphone3.h"
#import "STAphone4.h"
//#import "STTwitter.h"

@implementation STAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    STAphone3 *phone1VC = [[STAphone3 alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:phone1VC];
    nc.navigationBarHidden = YES;
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = nc;
    
    //on simulator says system cannot access twitter
    //run this from the device then it shows ythe username of your account in the debug area
//    STTwitterAPI *twitter = [STTwitterAPI twitterAPIOSWithFirstAccount];
//    [twitter verifyCredentialsWithSuccessBlock:^(NSString *username) {
//        NSLog(@"%@",username);
//        
//    } errorBlock:^(NSError *error) {
//        NSLog(@"%@",error.userInfo);
//    }];

    
////       if (self.window.frame.size.height == 480) {
//           STAphone3 *phone1VC = [[STAphone3 alloc] init];
//           UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:phone1VC];
//           self.window.backgroundColor = [UIColor whiteColor];
//           self.window.rootViewController = nc;
////        }
////       else{
////           STAphone4 *phone2VC = [[STAphone4 alloc] init];
////           self.window.backgroundColor = [UIColor yellowColor];
////           self.window.rootViewController = phone2VC;
////       }
    [self.window makeKeyAndVisible];
    return YES;
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
