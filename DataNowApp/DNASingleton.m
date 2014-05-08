//
//  DNASingleton.m
//  DataNowApp
//
//  Created by Savitha Reddy on 5/6/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "DNASingleton.h"

@implementation DNASingleton

+(DNASingleton *) sharedSingleton //step 2 // defining it
{
    static dispatch_once_t singletonBlock; // this is a block // can be called only once // thread-safe
    static DNASingleton *singleton  = nil; // instance pointer to this object
    
    dispatch_once(&singletonBlock, ^{
        singleton = [[DNASingleton alloc] init];
    });
    return singleton;
}

-(NSDictionary *)sectionInfo // if u require static info for the dictionary 
{
    return @{@"section1": @[@"row1",@"row2"],
            @"section2": @[@"row1",@"row2",@"row3"]
             };
    
}

-(NSArray *)allSections
{
    return [self.sectionInfo allKeys];//on this file sectionInfo is the property and allKeys in the dictionary returni.e section1 section 2 ... also these are strings and hence are sectionNames
}

-(NSArray *)allRowsForSection:(NSString *)sectionName // sectionName is the string  and return the names for all rows of the section in the array
{
    
    return self.sectionInfo[sectionName];
}

@end
