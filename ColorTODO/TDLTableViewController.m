//
//  TDLTableViewController.m
//  ColorTODO
//
//  Created by Savitha Reddy on 4/8/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TDLTableViewController.h"
#import "TDLTableViewCell.h"
#import "MOVE.h"


@implementation TDLTableViewController
{
    UITextField *nameField ;
    NSMutableArray *listTodos;
    NSArray *priorityColors;
    UIButton *buttonLow;
    UIButton *buttonMed;
    UIButton *buttonHigh;
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
       
        priorityColors = @[TAN_COLOR,YELLOW_COLOR,ORANGE_COLOR,RED_COLOR];
        
        listTodos = [@[@{@"name": @"Workshop App",@"priority" : @3,@"constant" :@3},
                      @{@"name": @"Go To Blogging Thing",@"priority" : @2, @"constant" :@2},
                      @{@"name": @"Objective-C", @"priority": @1,@"constant" :@1},
                      @{@"name": @"Finish GitHub App", @"priority": @0,@"constant" :@0}
                      //@{@"name": @"Get Good Sleep", @"priority": @0}
                       ]mutableCopy];
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
        
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.rowHeight = 50;
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        header.backgroundColor = [UIColor whiteColor];
        self.tableView.tableHeaderView = header;
        
        nameField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 180, 30)];
        //nameField.text = @" To Do Item ";
        nameField.textColor = [UIColor whiteColor];
        nameField.backgroundColor = [UIColor lightGrayColor];
        nameField.layer.cornerRadius = 6;
        nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];
        nameField.leftViewMode = UITextFieldViewModeAlways;
        //self.tableView.tableHeaderView addSubview:nameField;
        
        nameField.delegate = self;// TVC says that it is the delegate for namefield
        [header addSubview:nameField];
       
        buttonLow = [[UIButton alloc] initWithFrame:CGRectMake(200, 10, 30, 30)];
        buttonLow.tag = 1;
        buttonLow.layer.cornerRadius = 15;
        buttonLow.backgroundColor = YELLOW_COLOR;
        //buttonLow.backgroundColor = [UIColor greenColor];
        [buttonLow addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:buttonLow];
        buttonMed = [[UIButton alloc] initWithFrame:CGRectMake(240, 10, 30, 30)];
        buttonMed.tag=2;
        buttonMed.layer.cornerRadius = 15;
        buttonMed.backgroundColor = ORANGE_COLOR;
        //buttonMed.backgroundColor = [UIColor brownColor];
        [buttonMed addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:buttonMed];
        buttonHigh = [[UIButton alloc] initWithFrame:CGRectMake(280, 10, 30, 30)];
        buttonHigh.tag=3;
        buttonHigh.backgroundColor = RED_COLOR;
        buttonHigh.layer.cornerRadius = 15;
        buttonHigh.backgroundColor = [UIColor redColor];
        [buttonHigh addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:buttonHigh];
        
        }
    return self;
        
}

-(void)deleteItem:(TDLTableViewCell *)cell
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    [listTodos removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
        //NSLog(@"Delete"); //linking to TDLTVC method pressDEletebutton
}
-(void)setItemPriority:(int)priority withItem:(TDLTableViewCell *)cell;
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSDictionary *listItem = listTodos[indexPath.row];
    NSDictionary *updateListItem = @{@"name":listItem[@"name"],@"priority" : @(priority), @"constant" : @(priority)};
    [listTodos removeObjectAtIndex:indexPath.row]; //remove old dictionary for cell
    [listTodos insertObject:updateListItem atIndex:indexPath.row];
    cell.bgView.backgroundColor = priorityColors[priority];
    [MOVE animateView:cell.bgView properties:@{@"x":@10,@"duration":@0.5}];
    [cell hideCircleButtons];
    cell.swiped = NO;
    NSLog(@"Priority :%d",priority);
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField //for delegate and protocol system declared in TVC.h
{
    NSLog(@"Returned");
    [textField resignFirstResponder];
    return YES;
    
}
- (void)addNewListItem:(id)sender
{
    //if ([sender isEqual:buttonHigh]) NSLog(@"buttonHigh");
    UIButton *button = (UIButton *)sender;
    NSString * name = nameField.text;
   // NSInteger priority = button.tag;
    
    if(![name isEqualToString:@""])
    {
        [listTodos insertObject:@{@"name": name,@"priority" : @(button.tag), @"constant" : @(button.tag)} atIndex:0];//literal
    }
        //NSLog(@"%@",sender);
    [self.tableView reloadData];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self addNewListItem:nil];
    
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

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"%d",[listTodos count]);
    // Return the number of rows in the section.
    return [listTodos count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TDLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil)
    {
        cell = [[TDLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone; // gray block on slection to be removed
    [cell resetLayout];
    cell.delegate = self; //setting each cell with self(RVC) as delegate 
    int index = indexPath.row;
    
    
    //NSLog(@"%d",index);
    cell.bgView.backgroundColor = priorityColors[[listTodos[index][@"priority"] intValue]];
    
//    if ([listTodos[index][@"priority"] intValue] == 0)
//    {
//        cell.strikeThrough.alpha = 1;
//        cell.circleButton.alpha = 0;
//       
//    } else
//    {
       cell.strikeThrough.alpha = 0;
       cell.circleButton.alpha = 1;
        
  // }
    
    cell.nameLabel.text=listTodos[index][@"name"];
    //cell.circleButton.enabled=YES;
    //cell.backgroundColor = priorityColors[[listTodos[index][@"priority"] intValue]];
//    cell.backgroundColor = listTodos[index][@"priority"];
    //cell.backgroundColor = listTodos[index][@"UIColor"];
    //cell.textLabel.text = listTodos[index][@"name"];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [cell addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [cell addGestureRecognizer:swipeRight];
    
    return cell;
    
}
-(void) swipeCell: (UISwipeGestureRecognizer *)gesture
{
    //NSLog(@"%@", gesture.direction);
    TDLTableViewCell *cell = (TDLTableViewCell *) gesture.view;
    NSInteger index = [self.tableView indexPathForCell:cell].row;
    NSDictionary *listTodo = listTodos[index];
//    gesture.direction == left:2;
//    gesture.direction == right:1;
//    gesture.direction == left && priority== 0:12
//    gesture.direction == right && priority == 0:11
    
//    if ([listTodo[ @"priority"] intValue]== 0)
//    {
//        completed = 1;
//    }else
//    {
//        completed = 0;
//    }
    
    int completed = ([listTodo[ @"priority"] intValue]== 0) ? 10:0;
    switch (gesture.direction +completed) {
        case 1://right
            [MOVE animateView:cell.bgView properties:@{@"x":@10, @"duration" :@0.5}];
            [cell hideCircleButtons];
            cell.swiped = NO;
            break;
        case 2://left
            [MOVE animateView:cell.bgView properties:@{@"x":@-140, @"duration" :@0.5}];
            [cell showCircleButtons];
            cell.swiped = YES;
            break;
        case 11://right
            [MOVE animateView:cell.bgView properties:@{@"x":@10, @"duration" :@0.5}];
            [cell hideDeleteButton];
            cell.swiped = NO;
            break;
        case 12://left
            [MOVE animateView:cell.bgView properties:@{@"x":@-40, @"duration" :@0.5}];
            [cell showDeleteButton];
            cell.swiped = YES;
            break;
        default:
            break;
    }
//
//     switch (gesture.direction) {
//        case 1:
//            NSLog(@"swiping Right");
//            [MOVE animateView:cell.bgView properties:@{@"x":@10, @"duration" :@0.5}];
//          if (cell.circleButton.alpha ==1)
//          {
//            [cell hideCircleButtons];
//           }
//         else
//         {
//            [cell hideDeleteButton];
//                //NSLog(@"Hide Right");
//                //NSLog(@"%@",cell.nameLabel.text);
//           }
//           
//            break;
//                  case 2:
//                  NSLog(@"swiping Left");
//            [MOVE animateView:cell.bgView properties:@{@"x": @-110, @"duration" : @0.5}];
//           
//            if (cell.strikeThrough.alpha == 1)
//                {
//                  [cell showDeleteButton];
//                   [MOVE animateView:cell.bgView properties:@{@"x":@-20, @"duration" :@0.5}];
//                }
//            else
//            {
//                [cell showCircleButtons ];
//                [MOVE animateView:cell.bgView properties:@{@"x":@-110, @"duration" :@0.5}];
//            }
//    
//                  break;
//        default:
//            break;
    
        //}
    //[self.tableView reloadData];
    
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath //ontouching or tapping a cell works
{
    
    TDLTableViewCell *cell = (TDLTableViewCell *)  [tableView cellForRowAtIndexPath:indexPath];//get cell from tableview at row
    
    NSLog(@" SElecting a row today ");
//    if(cell.bgView.frame.origin.x<0){
//        
//    }
    //cell.bgView.backgroundColor = priorityColors[0];//when list done use tan color,strikethrough,circlebutton disappear at array 0
    //cell.strikeThrough.alpha = 1;
    //cell.circleButton.alpha = 0;
//   NSDictionary *updateListItem = listTodos;
// if ([listTodos[@"priority"] intValue])
//    {
//    cell.bgView.backgroundColor = priorityColors[0];
//    cell.strikeThrough.alpha = 1;
//    cell.circleButton.alpha = 0;
//    updateListItem = @{@"name":listTodos[@"name"],@"priority" : @0, @"constant" : listTodos [@"constant"]};
//    }
//    else
//    {
//        cell.bgView.backgroundColor = priorityColors[[listTodos[@"constant"] intValue]];
//        cell.strikeThrough.alpha = 0;
//        cell.circleButton.alpha = 1;
//        updateListItem = @{@"name":listTodos [@"name"},@"priority":listTodos [indexPath.row][@"constant"}:  @"constant":listTodos [@"constant"]};
//    }
//[listTodos removeObjectAtIndex:indexPath.row]; //remove old dictionary for cell
//[listTodos insertObject:updateListItem atIndex:indexPath.row];
//                                                                                                    
    
//    }
    
                                                             
  if (cell.circleButton.alpha == 1)
       {
      cell.strikeThrough.alpha = 1;
     cell.circleButton.alpha = 0;
      cell.circleButton.backgroundColor = cell.bgView.backgroundColor;
      cell.bgView.backgroundColor = priorityColors[0];
      }
 else{
    cell.strikeThrough.alpha = 0;
    cell.bgView.backgroundColor=cell.circleButton.backgroundColor;
   cell.circleButton.backgroundColor = [UIColor whiteColor];
  cell.circleButton.alpha = 1;
  }

    NSDictionary *updateListItem = @{@"name" : listTodos[indexPath.row][@"name"],@"priority": @0 };
    [listTodos removeObjectAtIndex:indexPath.row]; //remove old dictionary for cell
    [listTodos insertObject:updateListItem atIndex:indexPath.row];

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
-(BOOL) prefersStatusBarHidden
{
    return YES;
}
@end
