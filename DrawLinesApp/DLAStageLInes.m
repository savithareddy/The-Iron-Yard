//
//  DLAStage.m
//  DrawLinesApp
//
//  Created by Savitha Reddy on 4/15/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "DLAStageLines.h"

@implementation DLAStageLines
//{
//    NSMutableArray *self.lines; //for array [] ,for dict {} in initwithframe
//    
//}

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//        self.lines =[@[] mutableCopy];// mutable copy to add further values into the array
//        self.backgroundColor = [UIColor whiteColor];
//        }
//    return self;
//}

//-(void) clearStage
//{
//    [self.lines removeAllObjects];
//    [self setNeedsDisplay];
//}
//
//-(void) undo
//{
//    [self.lines removeLastObject];
//    [self setNeedsDisplay];
//}
//

//- (void)drawRect:(CGRect)rect
//{
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextClearRect(context, rect); //to clear before drawing
//    [[UIColor whiteColor]set];
//    //CGContextSetFillColorWithColor(context, self.Color.CGColor);
//    //CGContextSetLineWidth(context, 3.0);
//     CGContextSetLineWidth(context, self.lineWidth);//lines new proj //subclass being used ie. data obtaining from scribb.m
//    [self.lineColor set]; //self.lines new proj // same for color
//    CGContextSetLineCap(context, kCGLineCapRound); //to make points on the screen and then draw lines between any 2 points
//    NSLog(@"%@",self.lines);
//    
//    for (NSDictionary *line in self.lines) // for loop -fast enumeration is selected /for superclass changed from
//    {
//    
//        CGContextSetLineWidth(context, [line[@"width"] floatValue]);//for width
//        [(UIColor *)line[@"color"] set]; //for color
//        CGPoint start = [line[@"points"][0] CGPointValue]; //because CGPOint is struct and hence has to be asspined as point value // start and end points
//        CGPoint end = [line[@"points"] [1] CGPointValue]; //points being assigned as array 
//        CGContextMoveToPoint(context, start.x, start.y);
//        CGContextAddLineToPoint(context, end.x, end.y);
//        CGContextStrokePath(context); //required everytime we stop and create a new line
//    }
//    
//}

//-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    for( UITouch *touch in touches)
//    {
//        CGPoint location = [touch locationInView:self];
////        [self.lines addObject:[@[
////                            [NSValue valueWithCGPoint:location],
////                            [NSValue valueWithCGPoint:location]
////                            ]mutableCopy]];//2 locations where one stays at that point and other location moves
////        
//        [self.lines addObject:[@{
//                                @"color" : self.lineColor,
//                                @"width": @(self.lineWidth), // cause float to int value for linewidth
//                                @"points" : [@[[NSValue valueWithCGPoint:location],
//                                               [NSValue valueWithCGPoint:location]] mutableCopy]
//                                } mutableCopy]];
//
//        
////        UIBezierPath *path = [[UIBezierPath alloc] init];//to draw self.lines and other way is with core graphics
////        [path addLineToPoint:location];
//        
//        NSLog(@"Touch X %f Y %f", location.x,location.y);
//        
//    }
//   [ self setNeedsDisplay];
//}

//-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    
//    [self doTouch:touches];
////    for( UITouch *touch in touches)
////    {
////        CGPoint location = [touch locationInView:self];
////        [self.lines lastObject][@"points"][1] =[NSValue valueWithCGPoint:location];//selecting the second point in the array
////    
////        NSLog(@"Touch X %f Y %f", location.x,location.y);
////    }
//    //[ self setNeedsDisplay];
//}
//
//-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [self doTouch:touches];
////    for( UITouch *touch in touches)
////    {
////        CGPoint location = [touch locationInView:self];
////        [self.self.lines lastObject][@"points"][1] =[NSValue valueWithCGPoint:location];
////        NSLog(@"Touch X %f Y %f", location.x,location.y);
////    }
// // [ self setNeedsDisplay];
//}
-(void) doTouch:(NSSet *)touches
{
    UITouch *touch = [touches allObjects][0];
    CGPoint location = [touch locationInView:self];
    [self.lines lastObject][@"points"][1] = [NSValue valueWithCGPoint:location];
    [self setNeedsDisplay];
}
@end
