//
//  TWTTwitterRequest.m
//  AppTweet
//
//  Created by Savitha Reddy on 4/13/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TWTTwitterRequest.h"

@implementation TWTTwitterRequest

+ (NSDictionary *) getUserWithUserName: (NSString *)userName
{
    NSMutableDictionary *userInfo = [@{} mutableCopy];
    NSString *tweetText = userInfo[@"tweet"];
    NSMutableDictionary *userItem = userInfo[@"user"];
    NSString *name = userItem[@"name"];
    NSString *screenName = userItem[@"screenname"];
    NSString *twitter  = [NSString stringWithFormat:@"http://api.twitter.com/1.1/users/%@", userName];
    NSURL * url = [NSURL URLWithString:twitter];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSError *jsonError = nil;
    NSDictionary *twitterProfile = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
    NSLog(@"%@",twitterProfile);
    if (twitterProfile[@"name"] != nil ) [userInfo setObject:twitterProfile[@"name"] forKey:@"name"];
    if (twitterProfile[@"screen_name"] != nil ) [userInfo setObject:twitterProfile[@"screen_name"] forKey:@"username"];
    if (twitterProfile[@"profile_image_url"] != nil ) [userInfo setObject:twitterProfile[@"profile_image_url"] forKey:@"image"];
    if (twitterProfile[@"text"] != nil ) [userInfo setObject:twitterProfile[@"text"] forKey:@"tweet"];
    return userInfo;
    if (twitterProfile[@"html_url"] != nil ) [userInfo setObject:twitterProfile[@"html_url"] forKey:@"url"];
    return userInfo;

    
}
@end
