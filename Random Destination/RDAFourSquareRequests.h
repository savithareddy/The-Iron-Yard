//
//  RDAFourSquareRequests.h
//  Random Destination
//
//  Created by Savitha Reddy on 6/5/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDAFourSquareRequests : NSObject

+(NSArray *)getVenuesWithLat:(double)latitude andLong:(double)longitude;

@end
