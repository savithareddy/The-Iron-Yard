//
//  GHATableViewController.m
//  GitHubApp
//
//  Created by Savitha Reddy on 5/6/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "GHATableViewController.h"
#import "GHATableViewCell.h"
#import "GHAGitHubRequest.h"
#import "GHASingleton.h"
#import "GHANavViewController.h"

@implementation GHATableViewController
{
    UITextField *nameField ;
    
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.rowHeight = 100;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
           [button addTarget:self action:@selector(pressNewUser) forControlEvents:UIControlEventTouchUpInside];
            button.font = [UIFont systemFontOfSize:10];
            button.layer.cornerRadius = 6;
            button.backgroundColor = [UIColor blackColor];
            [header addSubview:button];
}

-(void)pressNewUser
{
    NSString *username = nameField.text;
    nameField.text = @"";
    NSDictionary * userInfo = [GHAGitHubRequest getUserWithUserName: username];
    if([[userInfo allKeys] count] == 3)
    {
        [[GHASingleton sharedCollection] addListName:userInfo];
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
    [self pressNewUser];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return  [[[GHASingleton sharedCollection] allListNames] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GHATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    if (cell==nil)
    {
        cell = [[GHATableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.index = indexPath.row;
        return cell;
   
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *listName = [[GHASingleton sharedCollection] allListNames] [indexPath.row];
    UIViewController * webController = [[UIViewController alloc]init];
    UIWebView * webView = [[UIWebView alloc] init];
    webController.view = webView;
    [self.navigationController pushViewController:webController animated:YES];
   
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:listName[@"github"]]]];
    
    
    
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
        [[GHASingleton sharedCollection] removeListNameAtIndex:indexPath.row];
        GHATableViewCell *cell = (GHATableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
  
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
   
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}



@end
