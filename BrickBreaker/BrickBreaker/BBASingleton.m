//
//  BBASingleton.m
//  BrickBreaker
//
//  Created by Savitha Reddy on 5/6/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "BBASingleton.h"

@implementation BBASingleton

+(BBASingleton *) sharedSingleton //step 2 // defining it
{
    static dispatch_once_t singletonBlock; // this is a block // can be called only once // thread-safe
    static BBASingleton *singleton  = nil; // instance pointer to this object
    
    dispatch_once(&singletonBlock, ^{
        singleton = [[BBASingleton alloc] init];
    });
    return singleton;
}


@end
