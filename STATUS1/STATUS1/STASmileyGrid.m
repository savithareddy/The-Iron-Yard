//
//  STASmileyGrid.m
//  STATUS1
//
//  Created by Savitha Reddy on 5/19/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "STASmileyGrid.h"
#import "STADetailVC.h"
#import "STASingleton.h"
#import "STAphone3.h"

@interface STASmileyGrid ()

@end

@implementation STASmileyGrid
{
    UIButton *Button1;
    UIView *frameView;
    UIImageView *square;
    UIButton *back;
    UIButton *next;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        NSArray *smilieImage = @[[UIImage imageNamed:@"smilies_1.png"],
                                 [UIImage imageNamed:@"smilies_2.png"],
                                 [UIImage imageNamed:@"smilies_3.png"],
                                 [UIImage imageNamed:@"smilies_4.png"],
                                 [UIImage imageNamed:@"smilies_5.png"],
                                 [UIImage imageNamed:@"smilies_6.png"],
                                 [UIImage imageNamed:@"smilies_7.png"],
                                 [UIImage imageNamed:@"smilies_8.png"],
                                 [UIImage imageNamed:@"smilies_9.png"]
                                 ];
        NSArray *angryImage = @[[UIImage imageNamed:@"angry_1.png"],
                                 [UIImage imageNamed:@"angry_2.png"],
                                 [UIImage imageNamed:@"angry_3.png"],
                                 [UIImage imageNamed:@"angry_4.png"],
                                 [UIImage imageNamed:@"angry_5.png"],
                                 [UIImage imageNamed:@"angry_6.png"],
                                 [UIImage imageNamed:@"angry_7.png"],
                                 [UIImage imageNamed:@"angry_8.png"],
                                 [UIImage imageNamed:@"angry_9.png"]
                                 ];
        
        
        
            for (int col=0; col<3; col++) {
                for (int row=0; row<3; row++) {
                    int valuex = (64 * col)+64+8;
                    int valuey = (64 * row)+ (BLOCKS *64)+8;
                int tagValue = col*3 + row;
                int tagValueRed = tagValue+9;;
//                NSLog(@"%d",[STASingleton mainSingleton].color);
                Button1 = [[UIButton alloc] initWithFrame:CGRectMake(valuex, valuey, 48, 48)];
                
                if ([STASingleton mainSingleton].color == 0)
                {
                    [Button1 setImage:smilieImage[tagValue] forState:UIControlStateNormal];
                    Button1.tag = tagValue;
                }
                else if ([STASingleton mainSingleton].color == 1)
               {
                [Button1 setImage:angryImage[tagValue] forState:UIControlStateNormal];
                   Button1.tag = tagValueRed;
               }
//                Button1.tag = tagValue;
                [Button1 addTarget:self action:@selector(showSquare:) forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:Button1];
            }
        }
        square = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"squares"]];
        square.frame = CGRectMake(-8, -8, 64, 64);
        
        back = [[UIButton alloc] initWithFrame:CGRectMake(76, 426, 48, 56)];
        UIImage *image11 = [UIImage imageNamed:@"backArrow.png"];
        [back setImage:image11 forState:UIControlStateNormal];
        [back addTarget:self action:@selector(openPreviousVC) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:back];
        
        next = [[UIButton alloc] initWithFrame:CGRectMake(196, 426, 48, 56)];
        UIImage *image10 = [UIImage imageNamed:@"arrow.png"];
        [next setImage:image10 forState:UIControlStateNormal];
        [next addTarget:self action:@selector(openNextVC) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:next];
    }
    return self;
}
-(void) openPreviousVC
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) showSquare:(UIButton *) sender
{
    [sender insertSubview:square atIndex:0];
    [STASingleton mainSingleton].detailColor = (int)sender.tag;
}

-(void)openNextVC
{
    STADetailVC *smileyDetail = [[STADetailVC alloc] init];
    [self.navigationController pushViewController:smileyDetail animated:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

//        frameView = [[UIView alloc] initWithFrame:CGRectMake(60, 180, 200, 200)];
//        [self.view addSubview:frameView];


//-(void) openDetail
//{
//    STADetailVC *detail = [[STADetailVC alloc] init];
//    [self.navigationController pushViewController:detail animated:YES];
//    UIImage *imageDetail = Button5.imageView.image;
//    detail.detailImage = imageDetail;
//    NSLog(@" passing image is %@",detail.detailImage);
////    UIImage *imageDetail2 = Button2.imageView.image;
////    detail.image = imageDetail2;
//
//}

//-(void) showSmiley:(UIButton *) sender
//{
//    [sender insertSubview:square atIndex:0];
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
