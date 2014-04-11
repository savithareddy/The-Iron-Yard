//
//  SDGstageVC.h
//  Squares
//
//  Created by Savitha Reddy on 4/11/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDGCircle.h" //added
#import "SDGSquare.h"//added

@interface SDGStageVC : UIViewController <SDGCircleDelegate> //class names each word should be in caps eg. SDGstageVC incorrect //add delagate for circle

@end
