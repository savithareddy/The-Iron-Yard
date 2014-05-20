//
//  STADetailVC.m
//  STATUS1
//
//  Created by Savitha Reddy on 5/19/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "STADetailVC.h"
#import "STAphone3.h"
#import "STASmileyGrid.h"
#import "STASingleton.h"

@interface STADetailVC ()

@end

@implementation STADetailVC
{
    UIButton *twitter;
    UIButton *google;
    UIButton *facebook;
    UIButton *fullFace;
    UIButton *done;
    BOOL toggleIsOn;
    UIView *frameView;
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        frameView = [[UIView alloc] initWithFrame:CGRectMake(60, 170, 200, 200)];
//        frameView.backgroundColor = [UIColor redColor];
//        frameView.tintColor = [UIColor clearColor];
//        [self.view addSubview:frameView];

        twitter = [[UIButton alloc] initWithFrame:CGRectMake(64, 82, 48, 48)];
        UIImage *imageY =[UIImage imageNamed:@"sm_twitter.png"];
        [twitter setImage:imageY forState:UIControlStateNormal];
        UIImage *imageX =[UIImage imageNamed:@"sm_twitter_g.png"];
        [twitter setImage:imageX forState:UIControlStateSelected];
        [twitter addTarget:self action:@selector(showToggle:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:twitter];
        
        google = [[UIButton alloc] initWithFrame:CGRectMake(128, 82, 48, 48)];
        UIImage *image2 =[UIImage imageNamed:@"sm_google.png"];
        [google setImage:image2 forState:UIControlStateNormal];
        UIImage *image3 =[UIImage imageNamed:@"sm_google_g.png"];
        [google setImage:image3 forState:UIControlStateSelected];
        [google addTarget:self action:@selector(showToggle:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:google];
        
        facebook = [[UIButton alloc] initWithFrame:CGRectMake(192, 82, 48, 48)];
        UIImage *image4 =[UIImage imageNamed:@"sm_facebook.png"];
        [facebook setImage:image4 forState:UIControlStateNormal];
        UIImage *image5 =[UIImage imageNamed:@"sm_facebook_g.png"];
        [facebook setImage:image5 forState:UIControlStateSelected];
        [facebook addTarget:self action:@selector(showToggle:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:facebook];
        
        NSArray *detailImages = @[[UIImage imageNamed:@"yellow_1.png"],
                                  [UIImage imageNamed:@"yellow_2.png"],
                                  [UIImage imageNamed:@"yellow_3.png"],
                                  [UIImage imageNamed:@"yellow_4.png"],
                                  [UIImage imageNamed:@"yellow_5.png"],
                                  [UIImage imageNamed:@"yellow_6.png"],
                                  [UIImage imageNamed:@"yellow_7.png"],
                                  [UIImage imageNamed:@"yellow_8.png"],
                                  [UIImage imageNamed:@"yellow_9.png"]
                                  ];
        NSArray *detailRedImages = @[[UIImage imageNamed:@"angry_1.png"],
                                  [UIImage imageNamed:@"angry_2.png"],
                                  [UIImage imageNamed:@"angry_3.png"],
                                  [UIImage imageNamed:@"angry_4.png"],
                                  [UIImage imageNamed:@"angry_5.png"],
                                  [UIImage imageNamed:@"angry_6.png"],
                                  [UIImage imageNamed:@"angry_7.png"],
                                  [UIImage imageNamed:@"angry_8.png"],
                                  [UIImage imageNamed:@"angry_9.png"]
                                  ];
        
        int tagValue = [STASingleton mainSingleton].detailColor;
        fullFace = [[UIButton alloc] initWithFrame:CGRectMake(72, 200, 176, 184)];
        NSLog(@"singleton is %d",[STASingleton mainSingleton].detailColor);
        NSLog(@"tagValue is %d",tagValue);
        if (tagValue < 9) {
        [fullFace setImage:detailImages[tagValue] forState:UIControlStateNormal];
        }else{
        [fullFace setImage:detailRedImages[tagValue-9] forState:UIControlStateNormal];
        }
        [self.view addSubview:fullFace];
        
        done = [[UIButton alloc] initWithFrame:CGRectMake(136, 406, 48, 56)];
        UIImage *image10 = [UIImage imageNamed:@"check.png"];
        [done setImage:image10 forState:UIControlStateNormal];
        [done addTarget:self action:@selector(openDetail) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:done];
}
    return self;
}

-(void) showToggle:(UIButton *) sender
{
    [sender setSelected:!sender.selected];
}


-(void) openDetail
{
    STAphone3 *phone = [[STAphone3 alloc] init];
    [self.navigationController pushViewController:phone animated:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
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
