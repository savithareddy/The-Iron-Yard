//
//  GHAGitHubRequest.h
//  GitHubApp
//
//  Created by Savitha Reddy on 5/6/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GHAGitHubRequest : NSObject

+ (NSDictionary *) getUserWithUserName: (NSString *)userName;

@end