//
//  STADataArchitecture.m
//  STATUS1
//
//  Created by Savitha Reddy on 5/29/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "STADataArchitecture.h"

@implementation STADataArchitecture
{
    NSArray *colors;
    NSMutableDictionary *colorDictionary;
}

-(void) setupArchitecture
{
    colorDictionary = [@{
               @"yellow":
                   @{
                     @"image":@"colors0",
                     @"faces":[@[
                             @{
                                 @"emotion" : @"happy",
                                 @"image" : @"yellow0"
                                 },
                             @{
                                 @"emotion" : @"happy",
                                 @"image" : @"yellow1"
                                 },
                             ]mutableCopy]
                     },
               @"red":
                   @{
                       @"image":@"colors1",
                       @"faces":[@[
                               @{
                                   @"emotion" : @"happy",
                                   @"image" : @"yellow0"
                                   },
                               @{
                                   @"emotion" : @"happy",
                                   @"image" : @"yellow1"
                                   },
                               ]mutableCopy]
                       }
               }mutableCopy];


//            colors = @[
//                        @{@"color":@"yellow",
//                          @"image":@"colors0",
//                          @"faces":@[
//                                    @{
//                                      @"emotion" : @"happy",
//                                      @"image" : @"yellow0"
//                                      },
//                                    @{
//                                        @"emotion" : @"happy",
//                                        @"image" : @"yellow1"
//                                        },
//                                    ]
//                          }
//                        @{@"color":@"red"},
//                        @{@"color":@"blue"},
//                        @{@"color":@"orange"},
//                        @{@"color":@"yellow"},
//                        @{@"color":@"yellow"},
//                        @{@"color":@"yellow"},
//                        @{@"color":@"yellow"},
//                        @{@"color":@"yellow"}
//                        
//                        ];
}

-(void) createColors
{
    NSString *yellowKey = [colorDictionary allKeys][0];
    NSDictionary *yellowColor = colorDictionary[yellowKey];
    
    for (NSString *key in [colorDictionary allKeys])
        // all dictionary have inbuilt allKeys method and key
        //allkeys has the count of all rows plus the keys
    {
        NSDictionary *color = colorDictionary[key];
        NSLog(@"%@",color);
    }
    
    for (NSDictionary *color in colors)
    {
        NSString *imageFileName = color[@"image"];
        imageFileName  = [color objectForKey:@"image"];
        UIImage *colorImage = [UIImage imageNamed:imageFileName];
    }
}

-(void) createFacesWithDictionary : (NSDictionary *)color
{
    
}














@end
