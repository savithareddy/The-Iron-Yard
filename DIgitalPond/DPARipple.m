//
//  DPARipple.m
//  DIgitalPond
//
//  Created by Savitha Reddy on 5/14/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "DPARipple.h"

@implementation DPARipple

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
    }
    return self;
}

-(void)didMoveToWindow //system-defined method (SDM)
{
    for (int i =0; i<self.rippleCount; i++) {
        // int/int = int // therefore float use allplaces
        float delayAmount = (self.rippleLifeTime / self.rippleCount) *i;
        [self rippleLineWithDelay:delayAmount];
    }
    
}

-(void)rippleLineWithDelay :(float) delay //user-defined method (UDM)
{
    //create a view
    
    UIView *rippleLine= [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    rippleLine.layer.borderColor = self.tintColor.CGColor;
 rippleLine.backgroundColor = self.tintColor;
    [self addSubview:rippleLine];
    [UIView animateWithDuration:self.rippleLifeTime delay:delay options:UIViewAnimationOptionCurveEaseOut animations:^{
        rippleLine.frame = CGRectMake(-40, -40, 80, 80) ;
//         rippleLine.layer.cornerRadius = 40;
        rippleLine.layer.borderWidth = 3.0;
        rippleLine.alpha = 0;
    } completion:^(BOOL finished) {
        [rippleLine removeFromSuperview];
    }];
}

//[UIColor colorWithWhite:0.0 alpha:0.3];



















/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
