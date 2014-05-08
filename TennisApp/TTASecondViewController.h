//
//  TTASecondViewController.h
//  TennisApp
//
//  Created by Savitha Reddy on 5/7/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TTASecondViewControllerDelegate;

@interface TTASecondViewController : UIViewController

@property (nonatomic) id<TTASecondViewControllerDelegate> delegate;

@end

@protocol TTASecondViewControllerDelegate <NSObject>

-(void) addPoints:(BOOL) checkclick;

@end

