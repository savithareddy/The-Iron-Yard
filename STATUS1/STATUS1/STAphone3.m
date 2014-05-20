//
//  STAphone3.m
//  STATUS1
//
//  Created by Savitha Reddy on 5/19/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "STAphone3.h"
#import "STASmileyGrid.h"
#import "STASingleton.h"

@interface STAphone3 ()

@end

@implementation STAphone3
{
    UIButton *Button;
    UIView *frameView;
    UIImageView *square;
    UIButton *next;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        int frameX = 64;
//        int frameY = (BLOCKS *64);
       
        
        NSArray *colorsImage = @[[UIImage imageNamed:@"colors_1.png"],
                                [UIImage imageNamed:@"colors_2.png"],
                                 [UIImage imageNamed:@"colors_3.png"],
                                 [UIImage imageNamed:@"colors_4.png"],
                                 [UIImage imageNamed:@"colors_5.png"],
                                 [UIImage imageNamed:@"colors_6.png"],
                                 [UIImage imageNamed:@"colors_7.png"],
                                 [UIImage imageNamed:@"colors_8.png"],
                                 [UIImage imageNamed:@"colors_9.png"]
                                 ];
      
        
         for (int col=0; col<3; col++) {
                for (int row=0; row<3; row++) {
                   int valuex = (64 * col)+64+8;
                int valuey = (64 * row)+ (BLOCKS *64)+8;
                int tagValue = col*3 + row;
                Button = [[UIButton alloc] initWithFrame:CGRectMake(valuex, valuey, 48, 48)];
                [Button setImage:colorsImage[tagValue] forState:UIControlStateNormal];
                Button.tag = tagValue;
                [Button addTarget:self action:@selector(showSquare:) forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:Button];

            }
        }
        square = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"squares"]];
        square.frame = CGRectMake(-8, -8, 64, 64);
    
        next = [[UIButton alloc] initWithFrame:CGRectMake(136, 426, 48, 56)];
        UIImage *image10 = [UIImage imageNamed:@"arrow.png"];
       [next setImage:image10 forState:UIControlStateNormal];
        [next addTarget:self action:@selector(openNextVC) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:next];
}
    return self;
}

-(void) showSquare:(UIButton *) sender
{
     [STASingleton mainSingleton].color = (int)sender.tag;
    [sender insertSubview:square atIndex:0];
    
}



-(void)openNextVC
{
    STASmileyGrid *smiley = [[STASmileyGrid alloc] init];
    [self.navigationController pushViewController:smiley animated:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
//frameView = [[UIView alloc] initWithFrame:CGRectMake(60, 180, 200, 200)];
//[self.view addSubview:frameView];

//-(void) showSquare:(UIButton *) sender
//{
//    //    [square removeFromSuperview];
////    CGPoint location = CGPointMake(sender.frame.origin.x, sender.frame.origin.y);
////    square = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"squares"]];
////    square.frame = CGRectMake(location.x-8, location.y-8, 64, 64);
////    [self.view insertSubview:square atIndex:0];
//}


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
