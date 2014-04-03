//
//  SRFTryView.m
//  April1
//
//  Created by Savitha Reddy on 4/1/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SRFTryView.h"

@implementation SRFTryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
+(NSNumber *)randomNumber
{
    NSNumber *num ;
    num=@5;
    return num;
    
}

-(NSString *)whatIsMyTitle
{
    return self.tryView;
    
}

-(void)changeTitleWithName:(NSString *)name andSomething:(NSString *)something
{
    self.coolTitle = [NSString stringWithFormat:@"%@ %@", name, something]
}

@end
