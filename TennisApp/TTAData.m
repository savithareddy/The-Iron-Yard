//
//  TTAData.m
//  TennisApp
//
//  Created by Savitha Reddy on 5/7/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TTAData.h"

@implementation TTAData

+(TTAData *) mainData
{
    static dispatch_once_t create;
    static TTAData * singleton = nil;
    dispatch_once(&create, ^{
        singleton = [[TTAData alloc] init];
    });
    return singleton;
}

//-(void)setRedScore:(NSInteger)redScore
//{
//    _redScore = redScore;
////    NSLog(@" red score = %d",_redScore);
//    
//}
//
//-(void)setBlueScore:(NSInteger)blueScore
//{
//    _blueScore = blueScore;
////     NSLog(@" blue score = %d",_blueScore);
//}
//
//-(void)setTotalScore:(NSInteger)totalScore
//{
//    _totalScore = totalScore;
//    _totalScore = _redScore + _blueScore;
////    NSLog(@" total score = %d", _totalScore);
//}



@end
