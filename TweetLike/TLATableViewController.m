//
//  TLATableViewController.m
//  TweetLike
//
//  Created by Savitha Reddy on 4/23/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TLATableViewController.h"
#import "TLATableViewCell.h"


@interface TLATableViewController ()


@end

@implementation TLATableViewController
{
//    UIView *header;
//    UIButton *addnewButton;
   // NSArray *tweetData;
    UIImageView *logo;
    UITextView *newTweet;
    UIButton *submitButton1;
    UIButton *cancelButton1;
    UIView *firstView;

    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
//        header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
//        header.backgroundColor = [UIColor blueColor];
//        [self.view addSubview:header];
//        addnewButton = [[UIButton alloc]initWithFrame:CGRectMake(110, 10, 100, 20)];
//        addnewButton.backgroundColor = [UIColor whiteColor];
//        [addnewButton setTitle:@"Add New" forState:UIControlStateNormal];
//        [addnewButton addTarget:self action:@selector(pressAddnew) forControlEvents:UIControlEventTouchUpInside];
//        addnewButton.titleLabel.textColor = [UIColor blackColor];
//        addnewButton.layer.cornerRadius = 10;
//        addnewButton.clipsToBounds = YES;
//        [header addSubview:addnewButton];
        
        self.tweetData = [@[
//                       @{@"number" : @"32" ,@"tweet" : @"No more shall I go on, without first looking ahead"},
//                       @{@"number" : @"75" ,@"tweet" : @"I like to eat chocolates, while reading romance novels"},
//                       @{@"number" : @"55", @"tweet": @"Adding another dictionary item to the array"}
                       ]mutableCopy];
        }
    self.tableView.rowHeight = 100;
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tweetData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil)
    {
        cell = [[TLATableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    cell.tweetInfo = self.tweetData[indexPath.row];
    return cell;
}

-(void)createNewTweet:(NSString *)tweet
{
    if ([tweet isEqualToString:@""]) return; // required to refrain from submitting empty string
    
     [self.tweetData insertObject:@{@"number": @"0",
                                   @"tweet" : tweet
                                   } atIndex:0];
     [self.tableView reloadData];
    
}

-(BOOL) isTweetDataEmpty
{
    return ([self.tweetData count] == 0); //condition returning a yes/no value 
}

-(BOOL) prefersStatusBarHidden
{
    return YES;
}

@end
