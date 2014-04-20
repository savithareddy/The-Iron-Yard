//
//  SDGCircle.m
//  Squares
//
//  Created by Savitha Reddy on 4/11/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SDGCircle.h"

@implementation SDGCircle
{
    UIColor *dotColor; //added
    float dotWidth;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        dotColor = [UIColor colorWithWhite:0.95 alpha:1.0]; //added to make the colors lighter shade
        dotWidth = frame.size.width/5 ;
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [dotColor set];
    //[[UIColor lightGrayColor] set];
    float dotXY = ((self.frame.size.width-dotWidth)/2);
    //NSLog(@"%f", dotXY);
    CGContextAddEllipseInRect(context, CGRectMake(dotXY, dotXY, dotWidth, dotWidth));
    CGContextFillPath(context);
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    dotColor = [self.delegate circleTappedWithPosition:self.position]; //asks for current color from VC while giving position of tapped circle
    [self setNeedsDisplay];//redraws layer calling the drawRect method above //
    //NSLog(@"my position is col %d, row %d",(int)self.position.x, (int)self.position.y);
}

@end
