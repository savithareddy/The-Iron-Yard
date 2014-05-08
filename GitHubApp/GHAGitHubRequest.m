//
//  GHAGitHubRequest.m
//  GitHubApp
//
//  Created by Savitha Reddy on 5/6/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "GHAGitHubRequest.h"

@implementation GHAGitHubRequest : NSObject

+ (NSDictionary *) getUserWithUserName: (NSString *)userName
{
    NSMutableDictionary *userInfo = [@{} mutableCopy];
    NSString *github  = [NSString stringWithFormat:@"https://api.github.com/users/%@", userName];
    NSURL * url = [NSURL URLWithString:github];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSError *jsonError = nil;
    NSDictionary *githubProfile = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
    
    if (githubProfile[@"name"] != nil ) [userInfo setObject:githubProfile[@"name"] forKey:@"name"];
    if (githubProfile[@"avatar_url"] != nil ) [userInfo setObject:githubProfile[@"avatar_url"] forKey:@"image"];
    if (githubProfile[@"html_url"] != nil ) [userInfo setObject:githubProfile[@"html_url"] forKey:@"github"];

    return userInfo;
    
}


@end
