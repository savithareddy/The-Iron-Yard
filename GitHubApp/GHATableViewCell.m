//
//  GHATableViewCell.m
//  GitHubApp
//
//  Created by Savitha Reddy on 5/6/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "GHATableViewCell.h"
#import "GHASingleton.h"


@implementation GHATableViewCell
{
    UIImageView * profileImage;
    UILabel * profileName;
    UILabel * profileURL;
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        profileImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
        profileImage.layer.cornerRadius=30;
        profileImage.layer.masksToBounds=YES;
        [self.contentView addSubview:profileImage];
        
        profileName = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 60, 60)];
        profileName.font = [UIFont fontWithName:@"Times New Roman" size:10];
        [self.contentView addSubview:profileName];
        
        profileURL =[[UILabel alloc] initWithFrame:CGRectMake(100, 40, 175, 60)];
        profileURL.font = [UIFont fontWithName:@"Times New Roman" size:10];
        [self.contentView addSubview:profileURL];
    }
    return self;
}


-(void) setIndex:(NSInteger)index
{
    _index = index;
    NSDictionary *profileInfo = [[GHASingleton sharedCollection] allListNames] [index];
    NSURL *imageUrl = [NSURL URLWithString:profileInfo[@"image"]];
    NSData * imageData = [NSData dataWithContentsOfURL:imageUrl];
    profileURL.text = profileInfo[@"github"];
    profileName.text = profileInfo[@"name"];
    UIImage * image = [UIImage imageWithData:imageData];
    profileImage.image = image;
    profileName.text = profileInfo[@"name"];
   profileURL.text = profileInfo[@"github"];
   }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}

@end
