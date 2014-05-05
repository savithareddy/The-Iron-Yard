//
//  PNAPixelSounds.m
//  PixelNoise
//
//  Created by Savitha Reddy on 5/5/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "PNAPixelSounds.h"

@implementation PNAPixelSounds

-(void)playSoundWithName:(NSString *)soundName
{
    NSString *file = [[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"]; // soundname in VC.m method
    
    NSData *fileData = [NSData dataWithContentsOfFile:file];
    
    self.player = [[AVAudioPlayer alloc] initWithData:fileData error:nil]; //AVAudioPlayer * changed to self.
    
    self.player.numberOfLoops = 0; // if 0 then it plays once // if -1 then infinite // use this for constant background sound like ambience music or so ...
    
    [self.player play];// changed to self. player from player after creating the property in PS.h
    
}

@end
