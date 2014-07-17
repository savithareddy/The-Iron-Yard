//
//  NTBNumbersVC.m
//  NavToolBar
//
//  Created by Savitha Reddy on 5/18/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "NTBNumbersVC.h"

@interface NTBNumbersVC ()

@end

@implementation NTBNumbersVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor grayColor];
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}


@end
