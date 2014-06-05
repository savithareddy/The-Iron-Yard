//
//  EDAViewController.h
//  EggDrop
//
//  Created by Savitha Reddy on 5/22/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface EDAViewController : UIViewController

@property (nonatomic) AVAudioPlayer *player;

@property (weak, nonatomic) IBOutlet UIImageView *spoon;

@property (weak, nonatomic) IBOutlet UIImageView *egg;

@end
