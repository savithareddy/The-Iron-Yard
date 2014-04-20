//
//  DLAStageScribble.m
//  DrawLinesApp
//
//  Created by Savitha Reddy on 4/15/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "DLAStageScribble.h"

@implementation DLAStageScribble
//{
//    NSMutableArray *self.lines;//multi point array declared
//    
//}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
        {
        // Initialization code
        
            self.lineWidth = 2.0; //defaults
            self.lineColor = [UIColor colorWithWhite:0.3 alpha:1.0]; //defaults
            self.lines = [@[] mutableCopy]; // alloc init for self.lines as an array // mutilple array for scribbling
            
            self.backgroundColor = [UIColor blackColor]; // because CGContextClearRect had to be commented out 
        }
    return self;
}
-(void) clearStage
{
    [self.lines removeAllObjects];
    [self setNeedsDisplay];
}

-(void) undo
{
    [self.lines removeLastObject];
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect
{
    CGContextRef context= UIGraphicsGetCurrentContext(); //  first step to draw the line
    CGContextSetLineCap(context, kCGLineCapRound); // allows to have a dot and nice to see round dots
    //CGContextSetLineWidth(context, 5.0);
    //[[UIColor whiteColor]set];
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextMoveToPoint(context, 50, 50);
    CGContextAddCurveToPoint(context, 270, 50, 270, 400, 50, 400);
    CGContextAddRect(context,rect);
    CGContextAddEllipseInRect(context, rect);
    CGContextFillPath(context);
    
   CGContextSetLineWidth(context, self.lineWidth); //setting for the line width
//  CGContextClearRect(context, rect); // thses 2 lines are dynamic so move inside for loop
    [self.lineColor set]; // setting for the line Color
    
    for (NSDictionary *line in self.lines) //to draw lines in the multi-line array in self.lines
    {
        CGContextSetLineWidth(context, [line[@"width"] floatValue]);
        [(UIColor *)line[@"color"] set];
        NSArray * points = line[@"points"];
        CGPoint start = [points[0] CGPointValue];
        //CGPoint start = [scribble[0] CGPointValue]; // started with the point on the line of lines
        CGContextMoveToPoint(context, start.x, start.y);
        for (NSValue *value in points) // for a value in scribble draw by joinig of points
        {
            
            //int index = [scribble indexOfObject:value];
            CGPoint point  = [value CGPointValue];
            //if(index > 0 || [scribble count] <3)
                CGContextAddLineToPoint(context, point.x, point.y);// if point value is greater than 0, then add this point to the line
        }
        CGContextStrokePath(context);// sets to the last color specified
    }
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    for (UITouch *touch in touches) // to account for all the points
    {
        CGPoint location = [touch locationInView:self]; // to get the first location
//        [self.lines addObject:[@[
//                                [NSValue valueWithCGPoint:location]
//                                ]mutableCopy]]; //specifyig the first point location
        [self.lines addObject:[@{
                                @"color" : self.lineColor,
                                @"width": @(self.lineWidth), // cause float to int value for linewidth
                                @"points" : [@[[NSValue valueWithCGPoint:location]]mutableCopy]
                                } mutableCopy]];
         }
    [self setNeedsDisplay];
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouch:touches];
//    for (UITouch *touch in touches) // to account for all the points
//    {
//        CGPoint location = [touch locationInView:self]; // to get the first location
//        //[[self.lines lastObject] addObject:[NSValue valueWithCGPoint:location]]; // getting the next points
//        [[self.lines lastObject] [@"points"] addObject:[NSValue valueWithCGPoint:location]];
//        
//    }
//    [self setNeedsDisplay];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouch:touches];
//    for (UITouch *touch in touches) // to account for all the points
//    {
//        CGPoint location = [touch locationInView:self]; // to get the first location
//        //[[self.lines lastObject] addObject:[NSValue valueWithCGPoint:location]]; // last point in the single point
//        [[self.lines lastObject] [@"points"] addObject:[NSValue valueWithCGPoint:location]];
//    }
//    [self setNeedsDisplay];
}
-(void) doTouch:(NSSet *)touches
{
    UITouch *touch = [touches allObjects][0];
    CGPoint location = [touch locationInView:self];
    [[self.lines lastObject][@"points"] addObject:[NSValue valueWithCGPoint:location]];
    [self setNeedsDisplay];
}


-(void) setLineWidth : (float) aLineWidth // setter methods // setter always starts with set word followed by the property declared in the .H file 
{
    _lineWidth = aLineWidth; // overwriting the value and setting _lineWidth which is default to the actual linewidth 
    [self setNeedsDisplay];
}
-(void) setLineColor:(UIColor *)alineColor
{
    _lineColor = alineColor;
    [self setNeedsDisplay];
}
@end
