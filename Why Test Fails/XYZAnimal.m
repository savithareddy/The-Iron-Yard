//
//  XYZAnimal.m
//  Why Test Fails
//
//  Created by Savitha Reddy on 6/17/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "XYZAnimal.h"

@implementation XYZAnimal

-(void)setAmountOfLegs:(int)amountOfLegs
{
    _amountOfLegs = amountOfLegs;
//    if (amountOfLegs < 3) {
//        self.crawling = NO;
//        
//    }else {
//        self.crawling = YES;
//    }
    
    self.crawling = (amountOfLegs >2);
}

@end
