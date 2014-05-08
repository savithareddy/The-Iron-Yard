//
//  TTAThirdViewController.h
//  TennisApp
//
//  Created by Savitha Reddy on 5/7/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TTAThirdViewControllerDelegate;

@interface TTAThirdViewController : UIViewController

@property (nonatomic) id<TTAThirdViewControllerDelegate> delegate;

@end

@protocol TTAThirdViewControllerDelegate <NSObject>

-(void) addPoints:(BOOL) checkclick;

@end
