//
//  DLAStageScribble.h
//  DrawLinesApp
//
//  Created by Savitha Reddy on 4/15/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLAStageScribble : UIView // superclass of lines // do all changes in scribble and call them in lines but does not work viceversa

@property (nonatomic) float lineWidth; // properties declared here need not be declared in scribbles.h also
@property (nonatomic) UIColor * lineColor; //since it .h is included in the files
@property (nonatomic) NSMutableArray *lines;



-(void) clearStage; //methods
-(void) undo;

@end
