//
//  TDLSingleton.h
//  ToDo
//
//  Created by Savitha Reddy on 5/6/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDLSingleton : NSObject

+(TDLSingleton *) sharedCollection;

-(void) addListName : (NSDictionary *) listNames;
-(void) removeListName : (NSDictionary *) listNames;
-(void) removeListNameAtIndex :(NSInteger) index;

- (NSArray *) allListNames; // removing listNames from the array

@end
