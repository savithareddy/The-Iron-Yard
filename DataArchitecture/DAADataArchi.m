//
//  DAADataArchi.m
//  DataArchitecture
//
//  Created by Savitha Reddy on 5/29/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "DAADataArchi.h"

@implementation DAADataArchi

{
    NSArray *colors;
    NSMutableDictionary *colorDictionary;
    NSDictionary *faces;
    
    int chosenColorIndex;//index for colors
    int chosenFaceIndex; //index for faces
}

-(NSDictionary *) returnChosenFace
{
    return colors[chosenColorIndex] [@"faces"] [chosenFaceIndex];
}

-(void) addFace:(NSDictionary *)face withColor:(int) colorIndex
{
    [colors[colorIndex][@"faces"]addObject:face];
}


-(void) setupArchitecture
{
    //very simple way
    colorDictionary = [@{
               @"yellow":@"image1",
               @"red" : @"image2"
               }mutableCopy];
    faces = @{
              @"yellow": @[@"face1",@"face1"],
              @"red" : @[@"face1",@"face1"]
       };
    
    //best way to work on with apps
//    colorDictionary = [@{
//                         @"yellow":
//                             @{
//                                 @"image":@"colors0",
//                                 @"faces":[@[
//                                             @{
//                                                 @"emotion" : @"happyYellow0",
//                                                 @"image" : @"yellow0"
//                                                 },
//                                             @{
//                                                 @"emotion" : @"happyYellow1",
//                                                 @"image" : @"yellow1"
//                                                 },
//                                             ]mutableCopy]
//                                 },
//                         @"red":
//                             @{
//                                 @"image":@"colors1",
//                                 @"faces":[@[
//                                             @{
//                                                 @"emotion" : @"angryRed0",
//                                                 @"image" : @"red0"
//                                                 },
//                                             @{
//                                                 @"emotion" : @"angryRed1",
//                                                 @"image" : @"red1"
//                                                 },
//                                             ]mutableCopy]
//                                 }
//                         }mutableCopy];
//    
//    
//               colors = @[
//                            @{@"color":@"yellow",
//                              @"image":@"colors0",
//    //                          @"faces":@[
//    //                                    @{
//    //                                      @"emotion" : @"happy",
//    //                                      @"image" : @"yellow0"
//    //                                      },
//    //                                    @{
//    //                                        @"emotion" : @"happy",
//    //                                        @"image" : @"yellow1"
//    //                                        },
//    //                                    ]
//    //                          }
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
//    NSString *yellowKey = [colorDictionary allKeys][0];
//    NSDictionary *yellowColor = colorDictionary[yellowKey];
    
    for (NSString *key in [colorDictionary allKeys])
        // all dictionary have inbuilt allKeys method and key
        //allkeys has the count of all rows plus the keys
    {
        NSDictionary *color = colorDictionary[key];
//        NSString *imageFileName = color[@"image"];
        NSLog(@"%@",color);
        [self createFacesWithColor:key];
    }
    
    for (NSDictionary *color in colors)
    {
        NSString *imageFileName = color[@"image"];
//        imageFileName  = [color objectForKey:@"image"];
//        NSLog(@"image file: %@",imageFileName);
//        UIImage *colorImage = [UIImage imageNamed:imageFileName];
        [self createFacesWithColorDictionary:color];
    }
}

-(void) createFacesWithColor : (NSString*)color
{
    NSArray *faces = colorDictionary[color][@"faces"][0];
    for (NSDictionary *face in faces) {
        
        NSLog(@"%@",face);
    }
}

-(void) createFacesWithColorDictionary : (NSDictionary *)color
{
    NSArray *faces = color[@"faces"];
    for (NSDictionary *face in faces) {
        
    NSLog(@"%@",face);
    }
    
}
//1= colors[0]
//2=1[@"faces"]
//3=2[1]
//4=3[@"image"]

//NSMutableDictionary  *face = colors[0][@"faces"][1][@"image"];
//[face setObject:@"hello" forKey:[@"text"]];

@end
