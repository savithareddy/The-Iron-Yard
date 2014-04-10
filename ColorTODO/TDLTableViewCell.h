//
//  TDLTableViewCell.h
//  ColorTODO
//
//  Created by Savitha Reddy on 4/8/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TDLTableViewCellDelegate;

@interface TDLTableViewCell : UITableViewCell

@property (nonatomic,assign) id<TDLTableViewCellDelegate> delegate;

@property (nonatomic) UILabel *nameLabel;
@property (nonatomic) UIView *bgView;
@property (nonatomic) UIView *strikeThrough;
@property (nonatomic) UIButton *circleButton;
@property (nonatomic) UIView *threeView;
@property (nonatomic) UIView *delView;

@property (nonatomic) BOOL swiped;
-(void) showCircleButtons;
-(void) hideCircleButtons;
-(void) showDeleteButton;
-(void) hideDeleteButton;
-(void) resetLayout;

@end
@protocol TDLTableViewCellDelegate <NSObject> //Place after the end  of interface

-(void) deleteItem: (TDLTableViewCell *) cell; //send the self// these 2 should be done not optional
-(void) setItemPriority: (int)priority withItem:(TDLTableViewCell *)cell;
@optional



@end
