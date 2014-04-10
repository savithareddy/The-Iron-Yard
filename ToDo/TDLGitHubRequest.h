//
//  TDLGitHubRequest.h
//  ToDo
//
//  Created by Savitha Reddy on 4/7/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDLGitHubRequest : NSObject

+ (NSDictionary *) getUserWithUserName: (NSString *)userName;

@end
