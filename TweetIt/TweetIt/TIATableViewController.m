//
//  TIATableViewController.m
//  TweetIt
//
//  Created by Savitha Reddy on 4/21/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TIATableViewController.h"
#import "TIAViewController.h"

@interface TIATableViewController ()

@end

@implementation TIATableViewController
{
    NSArray *tweets;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder // initWithCoder is for storyBoards method 
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        // do not do anything if not returning self
        //NSLog(@"hello");
        tweets = @[
                   @{
                    @"text":@"Inspiring tweet",
                     @"name":@"Einstein",
                    @"type" : @"quote"
                     },
                   @{
                       @"text":@"Other tweet",
                       @"name":@" Savitha ",
                       @"type" : @"icebreaker"
                       },
                   @{
                       @"text":@"Misc. tweet",
                       @"name":@"Reddy",
                       @"type": @"look"
                       }
                    ];
        //self.tableView setValue:<#(id)#> forKey:<#(NSString *)#>
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //items inside tableview step1
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [tweets count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Configure the cell...
//    if(cell == nil) // use this if direct tableview coding and not using storyboards
//    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
//    }
   //tweet dictionary based on row
    NSDictionary * tweet = tweets[indexPath.row];//passsing 3 tweets 0 1 2 3  returning 0 1 2 3
    //array of types for switch
    // NSString *type = tweet[@"type"];
    //array of types for switch
    NSArray *types = @[@"quote",@"icebreaker",@"look"]; // to pass the string values as integer assign them again as an array here
    //cell identifier that will be changed in switch
    NSString * reuseID = @"cell";
    //creating a new variable
    UITableViewCellStyle style = UITableViewCellStyleDefault; // C parameter ENUM so no * before style
//    switch ([types indexOfObject:tweet[@"type"]]) // if storyboard method then comment Switch
//    {
//        case 0: //quote
//            reuseID = @"cell0";
//            style = UITableViewCellStyleValue1;
//            break;
//        case 1: //icebreaker
//            reuseID = @"cell1";
//            style = UITableViewCellStyleValue2;
//            break;
//        case 2: //look
//            reuseID = @"cell2";
//            style = UITableViewCellStyleSubtitle;
//            break;
//        default:
//            break;
//    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID ]; // take out indexpath here
       if(cell == nil) // use this if direct tableview coding and not using storyboards
       {
           
          cell = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:reuseID]; // use reuseID instead of cell
       }


    cell.textLabel.text = tweet[@"text"];
    cell.detailTextLabel.text = tweet[NAME_KEY];
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UITableViewCell *cell = sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSDictionary *tweet = tweets[indexPath.row];
    if([segue.identifier isEqualToString:@"tweetDetail"])
    {
        //tweetDEtail
        TIAViewController *tweetDetailVC = segue.destinationViewController;
        tweetDetailVC.tweet = tweet;
       // NSLog(@"%@",tweetDetailVC.nameLabel);
//        tweetDetailVC.nameLabel.text= tweet[@"name"];
//        tweetDetailVC.tweetLabel.text = tweet[@"Text"];
    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
