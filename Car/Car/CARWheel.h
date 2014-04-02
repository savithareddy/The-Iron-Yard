//
//  CARWheel.h
//  Car
//
//  Created by Savitha Reddy on 4/1/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CARWheel : UIView

@property (nonatomic) int tirePresure;
@property (nonatomic) BOOL flat;
@property (nonatomic) NSString *brand;

-(void) fillWithAir;


@end
