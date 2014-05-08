//
//  TDLNavController.m
//  ToDo
//
//  Created by Savitha Reddy on 5/6/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TDLNavController.h"
#import "TDLGitHubRequest.h"
#import "TDLSingleton.h"

@interface TDLNavController ()

@end

@implementation TDLNavController
{
    UITextField *nameField;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    nameField = [[UITextField alloc] initWithFrame:CGRectMake(10, 20, 180, 30)];
    nameField.backgroundColor = [UIColor blueColor];
    nameField.placeholder = @"GitHub User";
    [self.view addSubview:nameField];
    
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 20, 10, 10)];
    addButton.layer.cornerRadius=15;
    addButton.titleLabel.textColor = [UIColor blueColor];
    [addButton setTitle:@"+"  forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addNewUser) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
}

-(void) addNewUser
{
    NSString *username = nameField.text;
    nameField.text = @"";
    NSDictionary * userInfo = [TDLGitHubRequest getUserWithUserName: username];
    NSLog(@"%@",userInfo);
    if([[userInfo allKeys] count] == 3)
    {
        [[TDLSingleton sharedCollection] addListName:userInfo];
    }
    else
    {
        NSLog(@" not enough data");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Bad Information" message:@"Unable to add user" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        [alertView show];

    [nameField resignFirstResponder];
    //[self.view reloadData];
    }
}
//-(BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}



@end
