//
//  MKAnnotation.h
//  Maps
//
//  Created by Savitha Reddy on 5/21/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MAPAnnotation : NSObject <MKAnnotation>

@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;
//data got from the readonly and the CLLoa..2D from the docs

@property (nonatomic,readonly,copy) NSString *title;
// these 2 properties are buit in for mkannotaion so as they have described should be used case sensitive
@property (nonatomic,readonly,copy) NSString *subtitle;

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate; //UDM

-(void) setCoordinate:(CLLocationCoordinate2D)newCoordinate;

-(void) setTitle:(NSString *)title;

-(void) setSubtitle:(NSString *)subtitle;


@end
