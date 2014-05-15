//
//  LPAViewController.m
//  LilPlayA
//
//  Created by Savitha Reddy on 5/13/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "LPAViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface LPAViewController ()
{
    AVAudioPlayer *avPlayer;
    UIView *progressBar;
    UIView *seekButton;
    NSTimer *timer;
    int increment;
    UISlider *slider;
    UIButton *playButton;
    UILabel *playerTime;
}

@end

@implementation LPAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    
//        [avPlayer play];
//        [avPlayer stop];
        
        int w = [UIScreen mainScreen].bounds.size.width;
        int h = [UIScreen mainScreen].bounds.size.height;
        
//        NSLog(@"Height os screen %d",h);
//        NSLog(@"Width os screen %d",w);
        
        playButton = [[UIButton alloc] initWithFrame:CGRectMake(10, (h-50)/2, 50, 50)];
        playButton.backgroundColor = [UIColor greenColor];
        playButton.layer.cornerRadius = 25;
        [playButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        [playButton setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateSelected];
       [self.view addSubview:playButton];
        
        UIButton *stopButton = [[UIButton alloc] initWithFrame:CGRectMake(w-60, (h-50)/2, 50, 50)];
        stopButton.backgroundColor = [UIColor redColor];
        stopButton.layer.cornerRadius = 25;
        [stopButton setImage:[UIImage imageNamed:@"stop"] forState:UIControlStateNormal];
        [self.view addSubview:stopButton];
        
        progressBar = [[UIView alloc] initWithFrame:CGRectMake(70, ((h-50)/2)+40, w-140, 2)];
        progressBar.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:progressBar];
    
        seekButton = [[UIView alloc] initWithFrame:CGRectMake(70,((h-50)/2)+35, 10, 10 )];
        seekButton.layer.cornerRadius = 5;
        seekButton.backgroundColor = [UIColor blueColor];
        [self.view addSubview:seekButton];

        slider = [[UISlider alloc] initWithFrame:CGRectMake(80, 300, 160, 10)];
        slider.minimumValue = 0.0;
        slider.maximumValue = 10.0;
        [slider addTarget:self action:@selector(control) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:slider];
        
        playerTime = [[UILabel alloc] initWithFrame:CGRectMake(210, 230, 80, 80)];
        [self.view addSubview:playerTime];
        

    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, (unsigned long)NULL), ^{
        NSURL *url = [NSURL URLWithString:@"https://api.soundcloud.com/tracks/147445565/download?client_id=2d87025c8392069f828c446b965862e3"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            avPlayer = [[AVAudioPlayer alloc] initWithData:data error:nil];
            [playButton addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
            [stopButton addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
            
            
            });
      });

    }
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"Seek Button Clicked");
    for (UITouch *touch in touches) {
        int h = [UIScreen mainScreen].bounds.size.height;
       // int w = [UIScreen mainScreen].bounds.size.width;
        CGPoint locationStart = [touch locationInView:progressBar];
        
        float locy = locationStart.y;
      //  NSLog(@"TouchStart %f %d", locationStart.x,h);
        if ( locy > -3 && locy <3 ) {
            seekButton.frame = CGRectMake(70+locationStart.x, (h-50)/2+35, 10, 10);
            [avPlayer pause];
            [timer invalidate];
        }
//
    }
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    for (UITouch *touch in touches) {
        int h = [UIScreen mainScreen].bounds.size.height;
        CGPoint location = [touch locationInView:progressBar];
        
        float locy = location.y;
        
        if ( locy > -3 && locy <3 ) {
            seekButton.frame = CGRectMake(70+location.x, (h-50)/2+35, 10, 10);
        
        }

        
       // [timer invalidate];
    }

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        int h = [UIScreen mainScreen].bounds.size.height;
        CGPoint location = [touch locationInView:progressBar];
        
        float locy = location.y;
        
        
        if ( locy > -3 && locy <3 )
        {
            seekButton.frame = CGRectMake(70+location.x, (h-50)/2+35, 10, 10);
            avPlayer.currentTime = location.x;
            [avPlayer play];
            
        }

//        seekButton.frame = CGRectMake(location.x, (h-50)/2+35, 10, 10);

    }
    
}
-(void) control
{
    avPlayer.volume = [slider value];
}


-(void) play: (UIButton *) sender
{
    if(sender.selected == NO)
    {
        (sender.selected = YES);
        [avPlayer play];
        timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
    }
    else
    {
        (sender.selected = NO);
        [avPlayer pause];
    }
}

-(void) stop
{
    [avPlayer stop];
    avPlayer.currentTime = 0;
    playButton.selected = NO;
}


-(void) updateProgress : (NSTimer *) timer
{
    
    int h = [UIScreen mainScreen].bounds.size.height;
    
    NSTimeInterval currentTime = [avPlayer currentTime];
    NSTimeInterval totalTime = [avPlayer duration];
    CGFloat progress = currentTime / totalTime;
    float xPosition = progressBar.frame.origin.x + progress * progressBar.frame.size.width;
    if ( h > -3 && h <3 ) {
        seekButton.frame = CGRectMake(xPosition, (h-50)/2+35, 10, 10);
        playerTime.text =[NSString stringWithFormat:@"%.02f",currentTime];
    }

//     seekButton.frame = CGRectMake(xPosition, (h-50)/2+35, 10, 10);
    
    
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
