//
//  BBALevelController.h
//  BrickBreaker
//
//  Created by Savitha Reddy on 4/17/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BBALevelDelegate; // declared for gamedone and adding points


@interface BBALevelController : UIViewController

@property (nonatomic, assign) id<BBALevelDelegate> delegate;

-(void) resetLevel;

@end

@protocol BBALevelDelegate <NSObject>

@optional

-(void) addPoints:(int) points;
-(void) reduceLives : (int) lives;
-(void) gameDone;



@end
