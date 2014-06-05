//
//  DAADataArchi.h
//  DataArchitecture
//
//  Created by Savitha Reddy on 5/29/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAADataArchi : NSObject

-(void) setupArchitecture;

-(void) createColors;

-(void) createFacesWithColor : (NSString *)color;
-(void) createFacesWithColorDictionary : (NSDictionary *)color;

@end
