//
//  SRFTryView.h
//  April1
//
//  Created by Savitha Reddy on 4/1/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRFTryView : UIView
@property (nonatomic) NSString *tryView;
+ (NSNumber *)randomNumber;
- (NSString *)whatIsMyTitle;
- (void)changeTitleWithName:(NSString *)name andSomething: (NSString *)something;


@end
