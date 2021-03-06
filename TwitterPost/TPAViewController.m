//
//  TPAViewController.m
//  TwitterPost
//
//  Created by Savitha Reddy on 5/20/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TPAViewController.h"
#import <STTwitter.h/STTwit
// requires STTwitter framework to be added 

@interface TPAViewController ()

@end

@implementation TPAViewController
{
    STTwitterAPI *twitter;
    UITextView *tweetField;
    UIButton *tweetButton;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
         twitter= [STTwitterAPI twitterAPIOSWithFirstAccount];
        
    [twitter verifyCredentialsWithSuccessBlock:^(NSString *username) {
            
        NSLog(@"%@",username);
            
        } errorBlock:^(NSError *error) {
            NSLog(@"%@",error.userInfo);
        
        }];

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int w = [UIScreen mainScreen].bounds.size.width;
    int h = [UIScreen mainScreen].bounds.size.height;
    tweetField = [[UITextView alloc] initWithFrame:CGRectMake(20, 20, w-40, h-296)];//296 is for the KB
    [self.view addSubview:tweetField];
    tweetButton = [[UIButton alloc] initWithFrame:CGRectMake(0,h-276, w, 60)];
    tweetButton.backgroundColor =[UIColor colorWithRed:0.208f green:0.710f blue:0.843f alpha:1.0f];
    [tweetButton setTitle:@"TWEET" forState:UIControlStateNormal];
    [tweetButton addTarget:self action:@selector(postTweet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tweetButton];
   
}

-(void) postTweet
{
    [twitter postStatusUpdate:tweetField.text inReplyToStatusID:nil latitude:nil longitude:nil placeID:nil displayCoordinates:nil trimUser:nil successBlock:^(NSDictionary *status) {
        NSLog(@"%@",status);
    } errorBlock:^(NSError *error) {
        NSLog(@"%@",error.userInfo);
    }];
    
    //tweetfield.text is the NSString here , remaining all are nils
}

//- (BOOL)textFieldShouldReturn:(UITextView *)textField
//{
//    [textField resignFirstResponder];
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

-(BOOL) prefersStatusBarHidden
{
    return YES;
}

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
