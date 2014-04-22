//
//  TIAViewController.m
//  TweetIt
//
//  Created by Savitha Reddy on 4/21/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TIAViewController.h"

@interface TIAViewController ()


//@property (weak, nonatomic) IBOutlet UILabel *sameLabel;


@end

@implementation TIAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.nameLabel.text = self.tweet[NAME_KEY];
    self.tweetLabel.text = self.tweet[@"text"];
    self.quoteLabel.text = self.tweet[@"quote"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
