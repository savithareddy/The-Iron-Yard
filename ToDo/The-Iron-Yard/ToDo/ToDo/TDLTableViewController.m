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


@implementation TDLTableViewController

{
    NSArray *listNames;
    //NSArray *listImages;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
       // NSDictionary * listExample = [[NSDictionary alloc] initWithObjects:@[@"Savitha Reddy"] forKeys:@[@"name"]];
                                      
        //NSDictionary * list = @{@"name":@"Savitha Reddy",@"image":[UIImage imageNamed:@"savithareddy"]};
        
        listNames = @[@{@"name" : @"Savitha",@"image" : [UIImage imageNamed : @"Savitha"],@"github": @"https://github.com/savithareddy"},
                      @{@"name" : @"JeffKing",@"image" : [UIImage imageNamed : @"JeffKing" ],@"github": @"https://github.com/rampis"},
                      //@{@"name" : @"ED",@"image" : [UIImage imageNamed : @"ED"]},
                      @{@"name" : @"Jon",@"image" : [UIImage imageNamed : @"Jon"],@"github": @"https://github.com/FoxJon"},
                      @{@"name" : @"Jisha",@"image" : [UIImage imageNamed : @"Jisha"],@"github": @"https://github.com/Jiobu"},
                      @{@"name" : @"Austen",@"image" : [UIImage imageNamed : @"Austen"],@"github": @"https://github.com/ajohnson21"},
                      @{@"name" : @"Heidi",@"image" : [UIImage imageNamed : @"Heidi"],@"github": @"https://github.com/justagirlcoding"},
                      @{@"name" : @"Teddy",@"image" : [UIImage imageNamed : @"Teddy"],@"github": @"https://github.com/talented76"},
                      //@{@"name" : @"Austin",@"image" : [UIImage imageNamed : @"Austin"]},
                      @{@"name" : @"TJ",@"image" : [UIImage imageNamed : @"TJ"],@"github": @"https://github.com/gwanunig14"},
                      @{@"name" : @"Derek",@"image" : [UIImage imageNamed : @"Derek"],@"github": @"https://github.com/dweber03"},
                      @{@"name" : @"John",@"image" : [UIImage imageNamed : @"John"],@"github": @"https://github.com/yamski"},
                      @{@"name" : @"Ashby",@"image" : [UIImage imageNamed : @"Ashby"],@"github": @"https://github.com/athornwell"},
                      @{@"name" : @"Jeffery",@"image" : [UIImage imageNamed : @"Jeffery"],@"github": @"https://github.com/jdmgithub"},
                      @{@"name" : @"Ali",@"image" : [UIImage imageNamed : @"Ali"],@"github": @"https://github.com/HoushmandA06"}
                      ];
    
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
        
        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
        
        self.tableView.rowHeight = 100;
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        header.backgroundColor = [UIColor darkGrayColor];
        
        self.tableView.tableHeaderView = header;
    
        UITextView * titleHeader = [[UITextView alloc] initWithFrame:CGRectMake(2, 5, 225, 30)];
                           titleHeader.text = @"IOS Class 2014 ";
                           titleHeader.textColor = [UIColor whiteColor];
        titleHeader.textAlignment = UITextAlignmentLeft;
        titleHeader.font = [UIFont fontWithName:@"Times New Roman" size:17];
                           [header addSubview:titleHeader];
        UIButton *button = [UIButton alloc] initWithFrame:CGRectMake(250, 5, 225, 30)
        button.
        
        
        UIView * footer = [[UIView alloc] initWithFrame:CGRectMake(0, 500, 200, 50)];
        footer.backgroundColor = [UIColor darkGrayColor];
        
        self.tableView.tableFooterView = footer;
        
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
    
    TDLExpand *expand= [[TDLExpand alloc] init] ;
    expand.frame = CGRectMake(275, 55, 22, 22);
    [expand setTitle:@"-" forState:UIControlStateNormal];
    [expand addTarget:self action:@selector(pressExpand) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:expand];
        // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    int index = indexPath.row;
 //   NSString * name = listNames [index];
    //cell.textLabel.text = name;
    /*NSString * image = listImages [index];
    cell.imageView.image = image;*/
   // cell.backgroundColor = [UIColor grayColor];
    
    NSDictionary * listName = listNames[index];
    cell.profile = listName; // setting profile to the cell
    //cell.textLabel.text = listName[ @"name"]; // cell.textlabel.text = listNames [index] [@"name"]; single line coding
    //cell.imageView.image = listName[ @"image"];
    
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
