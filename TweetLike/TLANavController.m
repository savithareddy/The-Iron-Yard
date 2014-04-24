//
//  TLANavController.m
//  TweetLike
//
//  Created by Savitha Reddy on 4/23/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TLANavController.h"
#import "TLATableViewController.h"
//#import "TLATableViewCell.h"


@interface TLANavController () <UITextViewDelegate>

@property (nonatomic) NSMutableArray *addTweets;
@end

@implementation TLANavController
{
    UIButton *addnewButton;
    UIView *blueBox;
    UIImageView *logo;
    UITextView *newTweet;
    UIButton *submitButton1;
    UIButton *cancelButton1;
    UIView *firstView;
    TLATableViewController *TVC; 
    
}
//delete this init since not being used 
//-(id)initWithRootViewController:(UIViewController *)rootViewController // can do without initiating but if some coding required to set the nav controller then this init is reuired
//{
//    self= [super initWithRootViewController:rootViewController];
//    if(self)
//    {
//        //self.navigationBar.backgroundColor = [UIColor redColor];
//        self.navigationBar.barTintColor = [UIColor blueColor];
//        self.navigationBar.translucent = NO; // for solid colors
//                //_addTweets = [@[]mutableCopy]; not required here // only on setter method use_ // no need to initiate empty array here
//        
//    }
//    return self;
//}

-(void) pressAddnew:(UIButton *) sender //changed id to UIButton
{
    [UIView animateWithDuration:0.4 animations:^{
        blueBox.frame = self.view.frame;
       // addnewButton.alpha = 0.0;
        sender.alpha = 0.0;
    [self.view addSubview:firstView];
     }];
   
}
-(void) pressCancel
{
    [firstView removeFromSuperview];
    firstView.frame = self.view.frame;
    [UIView animateWithDuration:0.4 animations:^{
        blueBox.frame = self.navigationBar.frame;
        addnewButton.alpha = 1.0;
//        [firstView removeFromSuperview];
//        [blueBox removeFromSuperview];
    }];
   // addnewButton.alpha =1.0;
}

-(void) saveTweet
{
    if ([newTweet.text isEqualToString:@""]) return;
//    [TVC.tweetData addObject:@{@"likes" : @5,
//                              @"tweet" : @"newtweet.text"
//                               }];
    //    [TVC.tweetData insertObject:@{@"number": @"0",
    //                                  @"tweet" : newTweet.text
    //                                  } atIndex:0];
//    [TVC.tableView reloadData];
    [TVC createNewTweet:newTweet.text];
    newTweet.text = @"";
        
    [self pressCancel];
    
}


-(void)addTableViewController:(TLATableViewController *)viewController
{
    TVC = viewController;
    [self pushViewController:viewController animated:NO];
    
    if ([TVC isTweetDataEmpty]) {
        //[self pressAddnew:nil];
        [self pressAddnew:addnewButton];
    }
        
}

-(BOOL) textViewShouldBeginEditing:(UITextView *)textView // to move the screen up to see submit and cancel button on KB start
{
    [UIView animateWithDuration:0.4 animations:^{
        firstView.frame = CGRectMake(0, -216, self.view.frame.size.width, self.view.frame.size.height);
    }];
    return YES;
}
//-(void) pressSubmit
//{
//    NSString *viewText = newTweet.text;
//   // TLATableViewController *newItem = UIViewController;
//  [_addTweets addObject:@{}];
//    _addTweets[@"tweet"]=newTweet.text;
////    [newItem.tableView reloadData];
//    
//}

//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    //NSLog (@"return key");
//    [self pressSubmit];
//    return YES;
//}

//-(void) setSendTweet : (NSDictionary *) sendTweet
//{
//    _sendTweet = sendTweet;
//    newTweet.text = sendTweet[@"tweet"];
//    [newTweet resignFirstResponder];
//    
//}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    blueBox = [[UIView alloc] initWithFrame:self.navigationBar.frame];
    blueBox.backgroundColor =[UIColor blueColor];
    //blueBox.backgroundColor = nil;
    [self.navigationBar addSubview:blueBox];
    
    addnewButton = [[UIButton alloc]initWithFrame:CGRectMake(110, (self.navigationBar.frame.size.height-30)/2, 100, 20)];
    addnewButton.backgroundColor = [UIColor whiteColor];
    [addnewButton setTitle:@"Add New" forState:UIControlStateNormal];
    [addnewButton addTarget:self action:@selector(pressAddnew:) forControlEvents:UIControlEventTouchUpInside];
    addnewButton.titleLabel.textColor = [UIColor blackColor];
    addnewButton.layer.cornerRadius = 10;
    //addnewButton.clipsToBounds = YES;
    [blueBox addSubview:addnewButton];
    
    firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    firstView.backgroundColor =[UIColor blueColor];
    
    logo = [[UIImageView alloc]initWithFrame:CGRectMake(110, 110, 120, 80)];
    logo.image = [UIImage imageNamed:@"logo"];
    [firstView addSubview:logo];
    
    newTweet = [[UITextView alloc] initWithFrame:CGRectMake(70, 200, 200, 100)];
    [firstView addSubview:newTweet];
    
    submitButton1 = [[UIButton alloc]initWithFrame:CGRectMake(80, 320, 80, 30)];
    submitButton1.backgroundColor = [UIColor greenColor];
    submitButton1.layer.cornerRadius = 15;
    [submitButton1 setTitle:@"SUBMIT" forState:UIControlStateNormal];
    [submitButton1 addTarget:self action:@selector(saveTweet) forControlEvents:UIControlEventTouchUpInside];
    [firstView addSubview:submitButton1];
    
    cancelButton1 = [[UIButton alloc]initWithFrame:CGRectMake(180, 320, 80, 30)];
    cancelButton1.layer.cornerRadius = 15;
    cancelButton1.backgroundColor = [UIColor redColor];
    [cancelButton1 setTitle:@"CANCEL" forState:UIControlStateNormal];
    [cancelButton1 addTarget:self action:@selector(pressCancel) forControlEvents:UIControlEventTouchUpInside];
    [firstView addSubview:cancelButton1];
    
    newTweet.delegate = self ;

   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  }

@end
