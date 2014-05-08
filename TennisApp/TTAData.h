//
//  TTAData.h
//  TennisApp
//
//  Created by Savitha Reddy on 5/7/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTAData : NSObject

+(TTAData *) mainData;

@property (nonatomic) NSInteger redScore;
@property (nonatomic) NSInteger blueScore;
@property (nonatomic) NSInteger totalScore;

@end
