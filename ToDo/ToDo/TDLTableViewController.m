//
//  TDLTableViewController.m
//  ToDo
//
//  Created by Savitha Reddy on 4/2/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TDLTableViewController.h"
#import "TDLTableViewCell.h"
#import "TDLExpand.h"
#import "TDLNewUser.h"
#import "TDLGitHubRequest.h"




@implementation TDLTableViewController

{
    //NSArray *listNames;
    //NSArray *listImages;
    NSMutableArray * listNames;
    UITextField *nameField ;
    
    
}
//-(void)toggleEdit
//{
//    [self.tableView setEditing:!self.tableView.editing animated:YES];
//    //self.tableView.editing = !self.tableView.editing;
//    //[self.tableView reloadData];
//}
//
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
//        UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(toggleEdit)];
//        self.navigationItem.rightBarButtonItem = editButton;
//        
       // NSDictionary * listExample = [[NSDictionary alloc] initWithObjects:@[@"Savitha Reddy"] forKeys:@[@"name"]];
                                      
        //NSDictionary * list = @{@"name":@"Savitha Reddy",@"image":[UIImage imageNamed:@"savithareddy"]};

//        listNames = [//@[@{@"name" : @"Savitha",@"image" : [UIImage imageNamed : @"Savitha"],@"github": @"https://github.com/savithareddy"},
//                      @{@"name" : @"JeffKing",@"image" : [UIImage imageNamed : @"JeffKing" ],@"github": @"https://github.com/rampis"},
//                      //@{@"name" : @"ED",@"image" : [UIImage imageNamed : @"ED"]},
//                      @{@"name" : @"Jon",@"image" : [UIImage imageNamed : @"Jon"],@"github": @"https://github.com/FoxJon"},
//                      @{@"name" : @"Jisha",@"image" : [UIImage imageNamed : @"Jisha"],@"github": @"https://github.com/Jiobu"},
//                      @{@"name" : @"Austen",@"image" : [UIImage imageNamed : @"Austen"],@"github": @"https://github.com/ajohnson21"},
//                      @{@"name" : @"Heidi",@"image" : [UIImage imageNamed : @"Heidi"],@"github": @"https://github.com/justagirlcoding"},
//                      @{@"name" : @"Teddy",@"image" : [UIImage imageNamed : @"Teddy"],@"github": @"https://github.com/talented76"},
//                      //@{@"name" : @"Austin",@"image" : [UIImage imageNamed : @"Austin"]},
//                      @{@"name" : @"TJ",@"image" : [UIImage imageNamed : @"TJ"],@"github": @"https://github.com/gwanunig14"},
//                      @{@"name" : @"Derek",@"image" : [UIImage imageNamed : @"Derek"],@"github": @"https://github.com/dweber03"},
//                      @{@"name" : @"John",@"image" : [UIImage imageNamed : @"John"],@"github": @"https://github.com/yamski"},
//                      @{@"name" : @"Ashby",@"image" : [UIImage imageNamed : @"Ashby"],@"github": @"https://github.com/athornwell"},
//                      @{@"name" : @"Jeffery",@"image" : [UIImage imageNamed : @"Jeffery"],@"github": @"https://github.com/jdmgithub"},
//                      @{@"name" : @"Ali",@"image" : [UIImage imageNamed : @"Ali"],@"github": @"https://github.com/HoushmandA06"}
//                      ] mutableCopy];
//        
        
    
       //listItems = [[NSArray alloc] initWithObjects:@"Monday", @"Tuesday",@"Wednesday",nil]];
    
        /*listNames = @[@"Savitha",@"Heidi",@"JeffKing",@"John", @"Jisha",
//                      @"Austin",
                      @"Derek",
//                      @"ED",
                      @"Ashby",@"Austen", @"TJ",@"Jeffery",@"Teddy", @"Jon"];
        listImages = @[[UIImage imageNamed:@"Savitha"],
                       [UIImage imageNamed:@"Heidi"],
                       [UIImage imageNamed:@"JeffKing"],
                       [UIImage imageNamed:@"John"],
                       [UIImage imageNamed:@"Jisha"],
                       //[UIImage imageNamed:@"Austin"],
                       [UIImage imageNamed:@"Derek"],
                       //[UIImage imageNamed:@"ED"],
                       [UIImage imageNamed:@"Ashby"],
                       [UIImage imageNamed:@"Austen"],
                       [UIImage imageNamed:@"TJ"],
                       [UIImage imageNamed:@"Jeffery"],
                       [UIImage imageNamed:@"Teddy"],
                       [UIImage imageNamed:@"Jon"]]; */
        
//       listNames = [@[@{@"name" : @"Jo Albright",
//                         @"image": @"https://avatars.githubusercontent.com/u/1536630?",
//                         @"github":@"https://github.com/joalbright"},
//                        @{ @"name" : @"Savitha Reddy",
//                        @"image": @"https://avatars.githubusercontent.com/u/7116131?",
//                        @"github":@"https://github.com/savithareddy"}
//                       ] mutableCopy]; //adding an item to the table due to rate limiting problems.
        
        listNames = [@[] mutableCopy];
        [self loadListItems];
        
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        self.tableView.rowHeight = 100;
        //self.tableView.editing = YES;
        
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        header.backgroundColor = [UIColor whiteColor];
        
        self.tableView.tableHeaderView = header;
    
        //UITextView * titleHeader = [[UITextView alloc] initWithFrame:CGRectMake(2, 5, 225, 30)];
                           //titleHeader.text = @"IOS Class 2014 ";
                           //titleHeader.textColor = [UIColor whiteColor];
        //titleHeader.textAlignment = UITextAlignmentLeft;
        //titleHeader.font = [UIFont fontWithName:@"Times New Roman" size:17];
                           //[header addSubview:titleHeader];
                //[button setTitle:@"NewUser" forState:UIControlStateNormal];
        //[button addTarget:self action:@selector(pressNewUser) forControlEvents:UIControlEventTouchUpInside];
        
        
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
        
        UILabel *titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 280, 30)];
        titleHeader.text = @"GitHub Users";
        titleHeader.textColor = [UIColor lightGrayColor];
        titleHeader.font = [UIFont systemFontOfSize:15];
        [header addSubview:titleHeader];
        //button.backgroundColor = [UIColor whiteColor];
        //button.titleLabel.text = @"NewUser";

        
        
        
        UIView * footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
        footer.backgroundColor = [UIColor darkGrayColor];
        
//        self.tableView.tableFooterView = footer;
        
        UILabel * titleFooter = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300, 30)];
        titleFooter.text = @" Prepared by TIY-Student";
        titleFooter.textColor = [UIColor whiteColor];
        titleFooter.textAlignment = UITextAlignmentRight;
        titleFooter.font = [UIFont fontWithName:@"Times New Roman" size:10];
        [footer addSubview:titleFooter];

        
        
                           
        
        //NSLog(@"listNames : %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@", listNames, listNames[0], listNames, listNames, listNames, listNames, listNames, listNames, listNames, listNames,listNames, listNames, listNames, listNames,listNames);
        //for (NSString * day in ; listItems) {
        //    NSLog(@"listitems: %@", day);
        //}
        
    }
            
                           
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    TDLNewUser *button= [[TDLNewUser alloc] init] ;
//    button.frame = CGRectMake(275, 55, 22, 22);
//    [button setTitle:@"-" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(pressNewUser) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
//    
//    
//    TDLExpand *expand= [[TDLExpand alloc] init] ;
//    expand.frame = CGRectMake(275, 55, 22, 22);
//    [expand setTitle:@"-" forState:UIControlStateNormal];
//    [expand addTarget:self action:@selector(pressExpand) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:expand];

        // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)pressNewUser
{
    NSString *username = nameField.text;
    nameField.text = @"";
    
    //NSLog(@"%@",username);
//    [listNames addObject:@{
//                           @"name" : username,
//                           //@"image" : [UIImage imageNamed : @"new_user"],
//                           @"github": [NSString stringWithFormat:@"https://github.com/%@",username] }]; // adding a new item @{} to the existing one
    
    NSDictionary * userInfo = [TDLGitHubRequest getUserWithUserName: username];
    if([[userInfo allKeys] count] == 3)
    {
        [listNames addObject:userInfo];
    }
    else
    {
        NSLog(@" not enough data");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Bad Information" message:@"Unable to add user" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        [alertView show];
            }
    
 //   [listNames addObject:userInfo];
    
    [nameField resignFirstResponder];
    [self.tableView reloadData];
    //NSLog(@"listNames Count : %d", [listNames count]);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //NSLog (@"return key");
    [self pressNewUser];
    return YES;
}

-(void)pressExpand
{
    NSLog(@"expanded");
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    Return the number of sections.
  return 0;
}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return [listNames count];
    //return [listImages count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    // Configure the cell...
    if (cell==nil)
    {
        cell = [[TDLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
   // int index = [indexPath row];
    //int index = indexPath.row;
    
   // NSArray *reverseArray = [[listNames reverseObjectEnumerator] allObjects];
    
 //   NSString * name = listNames [index];
    //cell.textLabel.text = name;
    /*NSString * image = listImages [index];
    cell.imageView.image = image;*/
   // cell.backgroundColor = [UIColor grayColor];
   
    //NSDictionary * listName = reverseArray[index];
    
    //NSDictionary * listName = listNames[index];
     //NSDictionary *listName = [self getListItem: indexPath.row];
    //cell.profile = listName; // setting profile to the cell
    
    cell.profile = [self getListItem: indexPath.row];
    
    //cell.textLabel.text = listName[ @"name"]; // cell.textlabel.text = listNames [index] [@"name"]; single line coding
    //cell.imageView.image = listName[ @"image"];
    
    
    
    return cell;
    [self saveData];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//   int index = indexPath.row;
    //NSArray *reverseArray = [[listNames reverseObjectEnumerator] allObjects];
    //NSDictionary * listName = reverseArray[index];
    NSDictionary *listName = [self getListItem: indexPath.row];
    //NSLog(@"%@", listName);
    UIViewController * webController = [[UIViewController alloc]init];
    UIWebView * webView = [[UIWebView alloc] init];
    webController.view = webView;
//    UIWindow * window = [[UIApplication sharedApplication].windows firstObject];
//    UINavigationController * navController = (UINavigationController *)window.rootViewController;
    [self.navigationController pushViewController:webController animated:YES];
    //[navController pushViewController:webController animated:YES];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:listName[@"github"]]]];
    [self saveData];
    
    
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
//   [listNames removeObjectAtIndex:indexPath.row];
    NSDictionary * listName = [self getListItem:indexPath.row];
    [listNames removeObjectIdenticalTo:listName];
  //[self.tableView reloadData ];
    TDLTableViewCell *cell = (TDLTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.alpha = 0;
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    NSLog(@"%@", listNames);
    [self saveData];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    if (sourceIndexPath == destinationIndexPath) return; // same row picking and dropping problem solved
    //if (destinationIndexPath.row >= [listNames count]) return; // stops from crashing, and also picking and going down
    //switching array objects here
    NSDictionary *sourceItem = [self getListItem:sourceIndexPath.row];
    NSDictionary *toItem = [self getListItem:destinationIndexPath.row];
    [listNames removeObjectIdenticalTo:sourceItem];
    //[listNames removeObjectsAtIndex:[listNames indexOfObject:sourceItem]];
    [listNames insertObject:sourceItem atIndex:[listNames indexOfObject:toItem]];
    [self saveData];
    
    
}
-(NSDictionary *)getListItem:(NSInteger)row
{
    NSArray *reverseArray = [[listNames reverseObjectEnumerator] allObjects];
    return reverseArray[row];
}


- (void)saveData
{
    NSString *path = [self listArchivePath];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:listNames];
    [data writeToFile:path options:NSDataWritingAtomic error:nil];
}


- (NSString *)listArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask,YES);
    NSString *documentDirectory = documentDirectories[0];
    return [ documentDirectory stringByAppendingPathComponent:@"listdata.data"];
    
}
- (void)loadListItems
{
    NSString *path = [self listArchivePath];
    //NSLog(@"%@");
    if([[NSFileManager defaultManager]fileExistsAtPath:path] )
    {
        listNames = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
}

@end
