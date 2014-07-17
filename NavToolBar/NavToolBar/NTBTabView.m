//
//  NTBTabView.m
//  NavToolBar
//
//  Created by Savitha Reddy on 5/18/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "NTBTabView.h"

@implementation NTBTabView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}



- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextClearRect(context, rect);
    
    CGContextMoveToPoint(context, 1, 12);
    CGContextAddLineToPoint(context, 10, 12);
    
    CGContextMoveToPoint(context, 1, 20);
    CGContextAddLineToPoint(context, 10, 20);
    
    CGContextMoveToPoint(context, 1, 28);
    CGContextAddLineToPoint(context, 10, 28);

    
    CGContextMoveToPoint(context, 1, 1);
    CGContextAddLineToPoint(context, 19, 12);
    
    CGContextMoveToPoint(context, 19, 12);
    CGContextAddLineToPoint(context, 19, 28);
    
    CGContextMoveToPoint(context, 19, 28);
    CGContextAddLineToPoint(context, 1, 38);
    
    
    CGContextStrokePath(context);
}


@end
