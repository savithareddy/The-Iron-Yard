//
//  TDLGitHubRequest.m
//  ToDo
//
//  Created by Savitha Reddy on 4/7/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TDLGitHubRequest.h"

@implementation TDLGitHubRequest : NSObject

+ (NSDictionary *) getUserWithUserName: (NSString *)userName
{
    NSMutableDictionary *userInfo = [@{} mutableCopy];
    NSString *github  = [NSString stringWithFormat:@"http://t.co/%@", userName];
    NSURL * url = [NSURL URLWithString:github];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
 //   NSOperationQueue *queue = [[NSOperationQueue alloc]init];
//    NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        if (connectionError =nil) {
//            <#statements#>
//        }
//        else{
//            NSLog(@"%@", connectionError);
//        }
//    }
//    
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSError *jsonError = nil;
    NSDictionary *githubProfile = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
//    for (NSString * key in [githubProfile allKeys]) {
//        
//    }
    NSLog(@"%@",githubProfile);
    //if (githubProfile[@"name"] !=nil) userInfo[@"name"]=githubProfile[@"name"];//literal way of writing the same code in the below line
    if (githubProfile[@"name"] != nil ) [userInfo setObject:githubProfile[@"name"] forKey:@"name"];
     if (githubProfile[@"avatar_url"] != nil ) [userInfo setObject:githubProfile[@"avatar_url"] forKey:@"image"];
     if (githubProfile[@"html_url"] != nil ) [userInfo setObject:githubProfile[@"html_url"] forKey:@"github"];
    
   // userInfo = @{@"name": githubProfile[@"name"], @"image":githubProfile[@"avatar_url"],@"github" : githubProfile [ @"html_url"]};
    return userInfo;
    
}


@end
