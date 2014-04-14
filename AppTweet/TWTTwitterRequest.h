//
//  TWTTwitterRequest.h
//  AppTweet
//
//  Created by Savitha Reddy on 4/13/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWTTwitterRequest : NSObject

+ (NSDictionary *) getUserWithUserName: (NSString *)userName;

@end
