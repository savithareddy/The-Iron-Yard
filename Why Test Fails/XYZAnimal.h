//
//  XYZAnimal.h
//  Why Test Fails
//
//  Created by Savitha Reddy on 6/17/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZAnimal : NSObject

@property (nonatomic) int amountOfLegs;
@property (nonatomic,getter = isCrawling) BOOL crawling;
@property (nonatomic,getter = isHairy) BOOL hairy;
@property (nonatomic) NSMutableArray *foodsItWillEat;

@end
