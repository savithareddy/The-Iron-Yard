//
//  TIAViewController.h
//  TweetIt
//
//  Created by Savitha Reddy on 4/21/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>
#define NAME_KEY @"name"
//#define NAME_KEY tweet[@"name"]; to get value inside
//#define NUMBER_KEY 10*20;

@interface TIAViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;
@property (weak, nonatomic) IBOutlet UILabel *quoteLabel;

@property (weak, nonatomic) NSDictionary *tweet;

@end
