//
//  CARWheel.m
//  Car
//
//  Created by Savitha Reddy on 4/1/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "CARWheel.h"

@implementation CARWheel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor= [UIColor darkGrayColor];
        self.layer.cornerRadius = 20;
    }
    return self;
}


@end
