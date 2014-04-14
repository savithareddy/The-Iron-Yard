//
//  TWTTableViewController.m
//  AppTweet
//
//  Created by Savitha Reddy on 4/13/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TWTTableViewController.h"
#import "TWTTableViewCell.h"
#import "TWTTwitterRequest.h"

@interface TWTTableViewController ()

@end

@implementation TWTTableViewController
{
    NSMutableArray * listTweets;
    UITextField *nameField ;
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        listTweets = [@{} mutableCopy];
        [self loadListItems];
        
        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
        self.tableView.rowHeight = 100;
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        header.backgroundColor = [UIColor whiteColor];
        self.tableView.tableHeaderView = header;
        
        nameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, 200, 30)];
        nameField.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.05];
        nameField.layer.cornerRadius = 6;
        nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];
        nameField.leftViewMode = UITextFieldViewModeAlways;
        nameField.delegate = self;
        [header addSubview:nameField];
        
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(230, 20, 60, 30)];
        [button setTitle:@"New User" forState:(UIControlStateNormal)];
        [button addTarget:self action:@selector(pressNewTweeter) forControlEvents:UIControlEventTouchUpInside];
        button.font = [UIFont systemFontOfSize:10];
        button.layer.cornerRadius = 6;
        button.backgroundColor = [UIColor blackColor];
        [header addSubview:button];
        
        UILabel *titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(20, 45, 280, 30)];
        titleHeader.text = @"Twitter Users";
        titleHeader.textColor = [UIColor lightGrayColor];
        titleHeader.font = [UIFont systemFontOfSize:15];
        [header addSubview:titleHeader];
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(void) pressNewTweeter
{
    NSString *userName = nameField.text;
    nameField.text = @"";
    
    NSDictionary * userInfo = [TWTTwitterRequest getUserWithUserName: userName];
    
    if([[userInfo allKeys] count] == 4)
    {
        [listTweets addObject:userInfo];
    }
    else
    {
        NSLog(@" not enough data");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Bad Information" message:@"Unable to add user" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        [alertView show];
    }
    
    [nameField resignFirstResponder];
    [self.tableView reloadData];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self pressNewTweeter];
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listTweets count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TWTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell==nil)
    {
        cell = [[TWTTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
        cell.profile = [self getListItem: indexPath.row];
    
    return cell;
    [self saveData];
}

-(NSDictionary *)getListItem:(NSInteger)row
{
    NSArray *reverseArray = [[listTweets reverseObjectEnumerator] allObjects];
    return reverseArray[row];
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *listTweet = [self getListItem: indexPath.row];
    UIViewController * webController = [[UIViewController alloc]init];
    UIWebView * webView = [[UIWebView alloc] init];
    webController.view = webView;
    [self.navigationController pushViewController:webController animated:YES];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:listTweet[@"Twitter"]]]];
    [self saveData];
}

- (void)saveData
{
    NSString *path = [self listArchivePath];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:listTweets];
    [data writeToFile:path options:NSDataWritingAtomic error:nil];
}


- (NSString *)listArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask,YES);
    NSString *documentDirectory = documentDirectories[0];
    return [documentDirectory stringByAppendingPathComponent:@"listdata.data"];
    
}
- (void)loadListItems
{
    NSString *path = [self listArchivePath];
    if([[NSFileManager defaultManager]fileExistsAtPath:path] )
    {
        listTweets= [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
}

@end
