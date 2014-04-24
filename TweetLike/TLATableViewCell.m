//
//  TLATableViewCell.m
//  TweetLike
//
//  Created by Savitha Reddy on 4/23/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TLATableViewCell.h"

@implementation TLATableViewCell
{
    UIImageView *image;
    UILabel *number;
    UITextView *tweet;
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 60, 30, 30)];
        [self.contentView addSubview:image];
        
        number = [[UILabel alloc] initWithFrame:CGRectMake(50, 60, 30, 30)];
        number.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:number];
        
        tweet = [[UITextView alloc] initWithFrame:CGRectMake(80, 60, 250, 50)];
        [self.contentView addSubview:tweet];
        
//        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
//        textLabel.text = @"checking if the cell inputs this default text than from dictionary";
//        textLabel.lineBreakMode = NSLineBreakByWordWrapping;
//        textLabel.numberOfLines = 0;
//        textLabel.font = [UIFont systemFontOfSize:12];
//        [self.contentView addSubview:textLabel];
        
        }
    return self;
}

-(void) setTweetInfo:(NSDictionary *)tweetInfo
{
    _tweetInfo = tweetInfo;
    UIImage *imagetweet = [UIImage imageNamed:@"heart"];
    image.image = imagetweet;
    //number.text = [tweet[@"likes"]stringValue]; // if declaring a value in dictionary @55 and not @"55"
    number.text = tweetInfo[@"number"]; //if @"55"
    tweet.text = tweetInfo[@"tweet"];
    
}
- (void)awakeFromNib
{
    }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

   
}

@end
