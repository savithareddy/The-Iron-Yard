//
//  PNAViewController.m
//  PixelNoise
//
//  Created by Savitha Reddy on 5/5/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "PNAViewController.h"
#import "PNAPixelSounds.h"
#import "PNAWorldController.h"

@interface PNAViewController ()

@end

@implementation PNAViewController
{
    PNAPixelSounds *sounds;
    PNAWorldController *world;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        sounds = [[PNAPixelSounds alloc] init]; // being used only once // no frame is required to be created // therefore in used in init //using the instance method from PS.h
        
       // [PNAPixelSounds playSound]; //using the class method from PS.h
        
        world = [[PNAWorldController alloc] initWithNibName:nil bundle:nil];
        world.view.backgroundColor = [UIColor blackColor];
        [self.view addSubview:world.view];
        
        
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

-(BOOL) prefersStatusBarHidden
{
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event // no gesture recogniser required
{
    NSLog(@"Play Sound"); //logs this statement
    [sounds playSoundWithName:@"click_alert"]; // sounds is defined in @implementation and playSoundWithName is the method in PS.h
    
//    PNAPixelSounds *sounds_obj = [[PNAPixelSounds alloc] init]; //not correct way since finishes within this scope and will not be audible
//    [sounds_obj playSoundWithName:@"click_alert"];
}


@end
