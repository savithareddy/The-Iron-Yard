//
//  NTBTableViewController.m
//  NavToolBar
//
//  Created by Savitha Reddy on 5/17/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "NTBTableViewController.h"
#import "NTBColorsVC.h"
#import "NTBNumbersVC.h"

@interface NTBTableViewController ()

@end

@implementation NTBTableViewController
{
//    UILabel *colorsLabel;
//    UILabel *numbersLabel;
//    UIBarButtonItem *colorsButton;
//    UIBarButtonItem *numbersButton;
    NSMutableArray *colorsArray;
    NSMutableArray *numbersArray;
    NSDictionary *colorsDict;
    NSDictionary *numbersDict;
    UITableViewCell *cell;
    NSInteger givalue;
    NTBColorsVC *cVc;
    NTBNumbersVC *nVc;
    NTBTableViewController *tvc;
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
      self.view.backgroundColor = [UIColor clearColor];
                colorsArray = [@[
                        @{@"name": @"ORANGE",@"color":[UIColor orangeColor]},
                        @{@"name": @"BLUE", @"color":[UIColor blueColor]},
                        @{@"name":@"GREEN",@"color":[UIColor greenColor]}
                        ]mutableCopy];
        numbersArray = [@[
                        @{@"name": @"ONE",@"value":@"1 - ONE"},
                        @{@"name": @"THREE", @"value":@"3 - THREE"},
                        @{@"name":@"FIVE",@"value":@"5 - FIVE"},
                        @{@"name":@"SEVEN",@"value":@"7 - SEVEN"},
                        ]mutableCopy];
    }
    return self;
}

-(id) colorsNumbers:(NSInteger) value1
{
    NSLog(@"%d",value1);
    if (value1 == 1 ) {
        NSLog(@" Colors tag");
        givalue =2;
        [self.tableView reloadData];
    }else
    {  NSLog(@" Numbers tag");
        givalue = 1;
        [self.tableView reloadData];
    }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    colorsLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, 100, 20)];
//    colorsLabel.text = @"COLORS";
//    colorsLabel.textColor = [UIColor blueColor];
//
//    numbersLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, 100, 20)];
//    numbersLabel.text = @"NUMBERS";
//    numbersLabel.textColor = [UIColor blueColor];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(givalue ==2)
    {
    NSLog(@"colors count %d", [colorsArray count]);
    return [colorsArray count];
    }else
    { NSLog(@"numbers count %d", [numbersArray count]);
    return [numbersArray count];
    }
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    if (givalue == 2) {
         NSLog(@"rows method %d",givalue);
    colorsDict = (NSDictionary *) [colorsArray objectAtIndex:indexPath.row];
        NSLog(@"colors Dictionary has %@",colorsDict);
        cell.textLabel.text = colorsDict[@"name"];
        cell.backgroundColor = colorsDict[@"color"];
    }else
    { numbersDict = (NSDictionary *) [numbersArray objectAtIndex:indexPath.row];
       NSLog(@"numbers Dictionary has %@",numbersDict);
      cell.textLabel.text = numbersDict[@"name"];
        cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = numbersDict[@"value"];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@" Row selected");
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"BACK" style:UIBarButtonItemStyleDone target:self action:@selector(goBack)];
    self.navigationItem.leftBarButtonItem = backButton;
    if(givalue ==2){
    cVc = [[NTBColorsVC alloc]initWithNibName:nil bundle:nil];
        tvc.toolbarItems = [NSArray arrayWithObjects: nil];
        [self.view addSubview:cVc.view];
    }else{
        nVc = [[NTBNumbersVC alloc]initWithNibName:nil bundle:nil];
        
        [self.view addSubview:nVc.view];
    }
    
}

-(void) goBack
{
    NSLog(@" goBack  selected");
    if (givalue == 2) {
    [cVc.view removeFromSuperview];
    }else{
        [nVc.view removeFromSuperview];
    }
    

}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
