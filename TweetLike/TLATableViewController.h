//
//  TLATableViewController.h
//  TweetLike
//
//  Created by Savitha Reddy on 4/23/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLATableViewController : UITableViewController

@property (nonatomic) NSMutableArray *tweetData;

//@property (nonatomic) BOOL tweetDataEmpty; // cool 1

@property (nonatomic, getter = isTweetDataEmpty, readonly) BOOL tweetDataEmpty; //getter 1

-(void) createNewTweet: (NSString *)tweet;


@end
