//
//  SDGCircle.h
//  Squares
//
//  Created by Savitha Reddy on 4/11/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SDGCircleDelegate;
@interface SDGCircle : UIView
@property (nonatomic,assign) id<SDGCircleDelegate> delegate;
@property (nonatomic) CGPoint position;
@end

@protocol SDGCircleDelegate <NSObject>
-(UIColor *)circleTappedWithPosition : (CGPoint) position; //when circle is tapped it delegates this info  to the VC at what position it is being tapped and hence assign that color UIColor// change int to CGPoint for square implementing
@end
