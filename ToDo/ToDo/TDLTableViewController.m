//
//  TDLTableViewController.m
//  ToDo
//
//  Created by Savitha Reddy on 4/2/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TDLTableViewController.h"
#import "TDLExpand.h"


@implementation TDLTableViewController

{
    NSArray *listNames;
    NSArray *listImages;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
       //listItems = [[NSArray alloc] initWithObjects:@"Monday", @"Tuesday",@"Wednesday",nil]];
    
        listNames = @[@"Savitha",@"Heidi",@"JeffKing",@"John", @"Jisha",
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
                       [UIImage imageNamed:@"Jon"]];
        
        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
        
        self.tableView.rowHeight = 35;
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        header.backgroundColor = [UIColor darkGrayColor];
        
        self.tableView.tableHeaderView = header;
    
        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(2, 5, 300, 30)];
                           titleHeader.text = @"  IOS Class 2014";
                           titleHeader.textColor = [UIColor whiteColor];
        titleHeader.textAlignment = UITextAlignmentLeft;
        titleHeader.font = [UIFont fontWithName:@"Times New Roman" size:17];
                           [header addSubview:titleHeader];
        
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
    
    TDLExpand *expand = [[TDLExpand alloc] init] ;
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    // Configure the cell...
    if (cell==nil) {
        cell = [[UITableViewCell alloc] init];
        
    }
    int index = [indexPath row];
    NSString * name = listNames [index];
    cell.textLabel.text = name;
    NSString * image = listImages [index];
    cell.imageView.image = image;
    cell.backgroundColor = [UIColor grayColor];
    
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
