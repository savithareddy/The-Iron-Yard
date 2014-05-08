//
//  BBAGameData.m
//  BrickBreaker
//
//  Created by Savitha Reddy on 5/7/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "BBAGameData.h"

@implementation BBAGameData

+(BBAGameData *) mainData
{
    static dispatch_once_t create;
    static BBAGameData * singleton = nil;
    
    dispatch_once(&create,^{
        singleton = [[BBAGameData alloc] init];
    });
    return singleton; 
}

-(void) setCurrentScore:(NSInteger)currentScore
{
    _currentScore = currentScore;
    if(currentScore > _topScore) _topScore = currentScore;
    NSLog(@" currentScore  %d", currentScore);
    
   NSLog(@" topScore  %d", _topScore);
    // self.topScore = 100;//self.topscore gives an error since this is only readonly // we r using _topScore which is not of this method but of setTopSCore method // allows updating the top score only by this line ... and topScore is readOnly
 }

-(NSArray *) gameScores
{
    return @[];
}

@end
