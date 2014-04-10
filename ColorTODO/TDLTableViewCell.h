//
//  TDLTableViewCell.h
//  ColorTODO
//
//  Created by Savitha Reddy on 4/8/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDLTableViewCell : UITableViewCell

@property (nonatomic) UILabel *nameLabel;
@property (nonatomic) UIView *bgView;
@property (nonatomic) UIView *strikeThrough;
@property (nonatomic) UIButton *circleButton;
@property (nonatomic) UIView *threeView;
@property (nonatomic) UIView *delView;

-(void) showCircleButtons;
-(void) hideCircleButtons;
-(void) showDeleteButton;
-(void) hideDeleteButton;

@end
