//
//  EDAViewController.m
//  EggDrop
//
//  Created by Savitha Reddy on 5/22/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "EDAViewController.h"
#import <CoreMotion/CoreMotion.h>


@interface EDAViewController ()

@property (nonatomic) CGRect originalEggFrame;
@property (nonatomic) CGRect originalSpoonFrame;

@end

@implementation EDAViewController
{
    CMMotionManager *mManager;
    BOOL eggIsFalling;
    UIButton *resetButton;
    UIButton *startButton;
    UILabel *timerLabel;
    NSTimer *timer;
    UILabel *lives;
    NSInteger timeInSeconds;
    NSDateFormatter* formatterMMss;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    formatterMMss = [[NSDateFormatter alloc] init];
    [formatterMMss setDateFormat:@"mm:ss"];
    
    self.originalEggFrame = self.egg.frame;
    self.originalSpoonFrame = self.spoon.frame;
    
//    startButton = [[UIButton alloc] initWithFrame:CGRectMake(240, 10, 100, 50)];
//    startButton.backgroundColor = [UIColor clearColor];
////    startButton.imageView.image = [UIImage imageNamed:@"egg"];
//    [startButton setTitle:@"START" forState:UIControlStateNormal];
//    [startButton addTarget:self action:@selector(startAgain) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:startButton];
    
    resetButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
    resetButton.backgroundColor = [UIColor clearColor];
//    resetButton.imageView.image = [UIImage imageNamed:@"egg"];
    [resetButton setTitle:@"RESTART" forState:UIControlStateNormal];
    [resetButton addTarget:self action:@selector(startAgain) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resetButton];
    
    timerLabel = [[UILabel alloc] initWithFrame:CGRectMake(240, 10, 80, 50)];
    timerLabel.textColor = [UIColor whiteColor];
    timerLabel.text = @"00:00";
    [self.view addSubview:timerLabel];
    [self timerMethod];
    
    lives = [[UILabel alloc] initWithFrame:CGRectMake(240, 70, 80, 50)];
    lives.textColor = [UIColor whiteColor];
    lives.text = @"3";
    [self.view addSubview:lives];
    
    

    
     	mManager = [[CMMotionManager alloc] init];
    //to do some motion for the egg
    [mManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
        
//       float x=motion.userAcceleration.x;
        
        float roll = motion.attitude.roll *20;
        if (!eggIsFalling) self.egg.frame = CGRectOffset(self.egg.frame, roll, 0);
        
        //to make the bool true or make th egg fall
        float eggMidX = CGRectGetMidX(self.egg.frame);
        float spoonMidX = CGRectGetMidX(self.spoon.frame);
        
        //fabs is float abosulte value to get positive values on both sides
        if (fabs(spoonMidX-eggMidX) > self.egg.frame.size.width/2.0 && !eggIsFalling)
        {
            eggIsFalling = YES;// bool variable //egg stops moving becuase of this YES
            
            [UIView animateWithDuration:0.3 animations:^{
               float  x = self.egg.frame.origin.x + self.egg.frame.size.width/4.0;
               float  y = self.egg.frame.origin.y + self.egg.frame.size.height/4.0;
               float w = self.egg.frame.size.width/2.0;
                float h = self.egg.frame.size.height/2.0;
                self.egg.frame = CGRectMake(x,y, w, h);
                
            } completion:^(BOOL finished) {
                
                self.egg.image = [UIImage imageNamed:@"twitter01.png"];
                [self playSoundWithName:@"cat_angry"];
                
                
            }];
        }
        
    }];
    
}

-(void)timerTick:(NSTimer *)timer {
    
    timeInSeconds++;
    NSDate* date = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInSeconds];
    timerLabel.text = [formatterMMss stringFromDate:date];
    
/*
    NSDate *now = [NSDate date];
    NSLog(@"%@",now);
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"mm:ss ";
    }
    timerLabel.text = [dateFormatter stringFromDate:now];
 */
}


-(void) startAgain
{
    timeInSeconds = 0;
    [timer invalidate];
    self.egg.image = [UIImage imageNamed:@"egg.png"];
    eggIsFalling = NO;
    self.egg.frame =self.originalEggFrame;
    self.spoon.frame = self.originalSpoonFrame;
    timerLabel.text = @"00:00";
    [self timerMethod];

 }

-(void) timerMethod
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTick:) userInfo:nil repeats:YES];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self moveMySpoon:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self moveMySpoon:touches];
}

- (void)moveMySpoon: (NSSet *)touches
{
    for (UITouch *touch in touches)
    {
        CGPoint location = [touch locationInView:self.view];
        self.spoon.frame = CGRectMake(location.x - (self.spoon.frame.size.width/2.0), self.spoon.frame.origin.y, self.spoon.frame.size.width, self.spoon.frame.size.height);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void) playSoundWithName:(NSString *) soundName
{
    NSString *file = [[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:file];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player play];
}


//}[UIView animateWithDuration:0.3 animations:^{
//    
//    //                self.egg.frame = CGRectOffset(self.egg.frame, self.egg.frame.size.width/4.0, self.egg.frame.size.height/4.0);
//    
//    float x = self.egg.frame.origin.x + self.egg.frame.size.width/4.0;
//    float y = self.egg.frame.origin.y + self.egg.frame.size.height/4.0;
//    float w = self.egg.frame.size.width/2.0;
//    float h = self.egg.frame.size.height/2.0;
//    self.egg.frame = CGRectMake(x,y, w, h);
//    
//    //                self.egg.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
//    self.egg.image = [UIImage imageNamed:@"twitter01.png"];
//} completion:^(BOOL finished) {
//    
//    [self playSoundWithName:@"chick"];
//
//


@end
