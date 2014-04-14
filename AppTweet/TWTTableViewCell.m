//
//  TWTTableViewCell.m
//  AppTweet
//
//  Created by Savitha Reddy on 4/13/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TWTTableViewCell.h"


@implementation TWTTableViewCell
{
    UIImageView * profileImage;
    UILabel * profileName;
    UILabel * profileUserName;
    UILabel *profileTweet;
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        profileImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
        profileImage.layer.cornerRadius=30;
        profileImage.layer.masksToBounds=YES;
        [self.contentView addSubview:profileImage];
        
        profileName = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 60, 60)];
        profileName.font = [UIFont fontWithName:@"Times New Roman" size:10];
        [self.contentView addSubview:profileName];
        
        profileUserName =[[UILabel alloc] initWithFrame:CGRectMake(130, 20, 60, 60)];
        profileUserName.font = [UIFont fontWithName:@"Times New Roman" size:8];
        [self.contentView addSubview:profileUserName];
        
        profileTweet =[[UILabel alloc] initWithFrame:CGRectMake(20, 60, 300, 60)];
        profileTweet.font = [UIFont fontWithName:@"Times New Roman" size:10];
        [self.contentView addSubview:profileTweet];

    }
    return self;
}

-(void) setProfile:(NSDictionary *)profile
{
    NSURL *imageUrl = [NSURL URLWithString:profile[@"image"]];
    NSData * imageData = [NSData dataWithContentsOfURL:imageUrl];
    UIImage * image = [UIImage imageWithData:imageData];
    profileImage.image = image;
    profileName.text = profile[@"name"];
    profileUserName.text = profile[@"username"];
    profileTweet.text = profile[@"Tweet"];
    _profile = profile;
}


- (void)awakeFromNib
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    
}

@end
