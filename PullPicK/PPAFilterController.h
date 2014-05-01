//
//  PPAFilterController.h
//  PullPicK
//
//  Created by Savitha Reddy on 5/1/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PPAFilterControllerDelegate;

@interface PPAFilterController : UIViewController

@property (nonatomic,assign) id<PPAFilterControllerDelegate> delegate;

@property (nonatomic) UIImage *imageToFilter;


@end

@protocol PPAFilterControllerDelegate <NSObject>

-(void) updateCurrentImageWithFilteredImage:(UIImage *)image;

@end