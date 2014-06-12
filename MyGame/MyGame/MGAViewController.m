//
//  MGAViewController.m
//  MyGame
//
//  Created by Savitha Reddy on 6/10/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "MGAViewController.h"
#import <GameKit/GameKit.h>

@interface MGAViewController () <GKGameCenterControllerDelegate>

@end

@implementation MGAViewController
{
    GKLocalPlayer *player;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
// add viewcontroller and error names in the block
    player = [GKLocalPlayer localPlayer];
    if (!player.isAuthenticated){
        MGAViewController *selfCopy = self;
    [player setAuthenticateHandler:^(UIViewController *viewController, NSError *error) {
//        NSLog(@"%@",viewController);
        if (viewController)
        [selfCopy presentViewController:viewController animated:YES completion:nil];
        else [selfCopy playerReady];
    }];
    }
    
    
}

-(void) playerReady
{
//    [player loadDefaultLeaderboardIdentifierWithCompletionHandler:^(NSString *leaderboardIdentifier, NSError *error) {
//        
//        NSLog(@"%@",leaderboardIdentifier);
//        
//    }];
//    
    [GKLeaderboard loadLeaderboardsWithCompletionHandler:^(NSArray *leaderboards, NSError *error) {
        
        for (GKLeaderboard *leaderBoard in leaderboards) {
            NSLog(@"%@",leaderBoard.identifier);
        }
    }];
    GKScore *scoreReporter = [[GKScore alloc] initWithLeaderboardIdentifier:@"GameID"];
    scoreReporter.value = 20;
    scoreReporter.context = 0;
    [GKScore reportScores:@[scoreReporter] withCompletionHandler:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sender:(id)sender {
    // this is the sender() = showLeaderBoard () in class
    
    GKGameCenterViewController *gkVC = [[GKGameCenterViewController alloc] init];
    [gkVC setLeaderboardIdentifier:@"GameID"];
    [gkVC setGameCenterDelegate:self];
    [self presentViewController:gkVC animated:YES completion:nil];
    
}

-(void) gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


















@end
