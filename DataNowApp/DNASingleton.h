//
//  DNASingleton.h
//  DataNowApp
//
//  Created by Savitha Reddy on 5/6/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNASingleton : NSObject

+ (DNASingleton *) sharedSingleton; //setup // next implement .m file @implement // making it public here

@property (nonatomic) NSDictionary *sectionInfo;

-(NSArray *) allSections; // return NSArray for all Sections // implement thses in .m file
-(NSArray *) allRowsForSection:(NSString *) sectionName; // sectionName is a string 


@end
