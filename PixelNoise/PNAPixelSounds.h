//
//  PNAPixelSounds.h
//  PixelNoise
//
//  Created by Savitha Reddy on 5/5/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h> // to play sounds // this class is for all sound management

@interface PNAPixelSounds : NSObject// <AVAudioPlayerDelegate>

//@property (nonatomic) NSMutableArray *players;

//+(void) playSound; class methods

@property (nonatomic) AVAudioPlayer *player; // to resolve sound not audible  (nonatomic strong is required but strong is the default value)
-(void) playSoundWithName : (NSString *) soundName; //create this method // instance method 

@end
