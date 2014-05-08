//
//  TDLTableViewCell.m
//  ToDo
//
//  Created by Savitha Reddy on 4/3/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TDLTableViewCell.h"
#import "TDLTableViewController.h"
#import "TDLSingleton.h"


@implementation TDLTableViewCell
{
    UIImageView * profileImage;
    UILabel * profileName;
    UILabel * profileURL;
    
}

//@synthesize profile=_profile; // to overwrite one of the setter or getter then _profile can e used else synthesiszing is required



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
        //profileName.font = [UIFont systemFontOfSize:30];
        [self.contentView addSubview:profileName];
        
        profileURL =[[UILabel alloc] initWithFrame:CGRectMake(100, 40, 175, 60)];
        profileURL.font = [UIFont fontWithName:@"Times New Roman" size:10];
        [self.contentView addSubview:profileURL];
    }
    return self;
}

/*- (NSDictionary *) profile // Getter
{
    if (_profile == nil)
    {
        _profile = @{ @"name":@"Savitha", @"image" : [UIImage imageNamed:@"Savitha"]};//setting to return atleast NSDictionary @{}
        
    }
    return _profile;
}*/

-(void) setIndex:(NSInteger)index
{
    _index = index;
    NSDictionary *profileInfo = [[TDLSingleton sharedCollection] allListNames] [index];
    NSURL *imageUrl = [NSURL URLWithString:profileInfo[@"image"]];
    
    NSData * imageData = [NSData dataWithContentsOfURL:imageUrl];
    //UIImage *image = [UIImage imageWithData:imageData];
    
    //profileImage.image = profile[@"image"];
    profileURL.text = profileInfo[@"github"];
    profileName.text = profileInfo[@"name"];
    // if(profile !=nil)
    UIImage * image = [UIImage imageWithData:imageData];
    //UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
    //imageView.image = profile[@"image"];
    //profileImage.image = profile[@"image"];
    profileImage.image = image;
    //imageView.layer.cornerRadius=30;
    //imageView.layer.masksToBounds=YES;
    //[self.contentView addSubview:imageView];
    
    //UILabel * labelView = [[UILabel alloc] initWithFrame:CGRectMake(90, 20, 60, 60)];
    profileName.text = profileInfo[@"name"];
    //labelView.font = [UIFont fontWithName:@"Times New Roman" size:10];
    //[self.contentView addSubview:labelView];
    
    //UILabel * urlView = [[UILabel alloc] initWithFrame:CGRectMake(150, 20, 175, 60)];
    profileURL.text = profileInfo[@"github"];
    //urlView.font = [UIFont fontWithName:@"Times New Roman" size:10];
    //[self.contentView addSubview:urlView];
}

//-(void) setProfile:(NSDictionary *)profile // Setter
//{
//    _profile = profile;
//}


//- (void)awakeFromNib
//{
//    // Initialization code
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
