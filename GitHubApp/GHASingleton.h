//
//  GHASingleton.h
//  GitHubApp
//
//  Created by Savitha Reddy on 5/6/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GHASingleton : NSObject

+(GHASingleton *) sharedCollection;

-(void) addListName : (NSDictionary *) listNames;
-(void) removeListName : (NSDictionary *) listNames;
-(void) removeListNameAtIndex :(NSInteger) index;

- (NSArray *) allListNames;

@end
