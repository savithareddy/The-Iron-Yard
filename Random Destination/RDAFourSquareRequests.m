//
//  RDAFourSquareRequests.m
//  Random Destination
//
//  Created by Savitha Reddy on 6/5/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "RDAFourSquareRequests.h"

@implementation RDAFourSquareRequests


+(NSArray *)getVenuesWithLat:(double)latitude andLong:(double)longitude
{
    NSArray *venues = @[];
    
    NSString *locationURL = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/explore?ll=%f,%f&oauth_token=FMJPXMBCP0CHUBZGJYM52NW3PX5T3MASQOESIEWVW3ECHBCZ&v=20140605",latitude,longitude];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:locationURL]];
    NSData *resonseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *fsInfo = [NSJSONSerialization JSONObjectWithData:resonseData options:0 error:nil];
    
    venues = fsInfo[@"response"][@"groups"][0][@"items"];
    return venues;
}
@end
