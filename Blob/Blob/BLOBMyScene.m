//
//  BLOBMyScene.m
//  Blob
//
//  Created by Savitha Reddy on 6/3/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "BLOBMyScene.h"

@implementation BLOBMyScene
{
    SKSpriteNode *hill1;
    SKSpriteNode *hill2;
    SKSpriteNode *hill3;
    SKSpriteNode *hill1copy;
    SKSpriteNode *hill2copy;
    SKSpriteNode *hill3copy;
    SKSpriteNode *blob;
    NSArray *rollingTextures;
    
}

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor blackColor];
        
        hill3 = [SKSpriteNode spriteNodeWithImageNamed:@"hill3"]; //easy way of representing the 3 lines below
        hill3.position = CGPointMake(1024, 325);
        [self addChild:hill3];
        
        hill3copy = [hill3 copy];
        hill3copy.position = CGPointMake(1024+2048, 325);
        [self addChild:hill3copy];
        

        hill2 = [SKSpriteNode node];
        hill2.texture = [SKTexture textureWithImage:[UIImage imageNamed:@"hill2"]];
        hill2.size = CGSizeMake(2048, 305);
        hill2.position = CGPointMake(1024, 152.5);
        [self addChild:hill2];
        
        hill2copy = [hill2 copy];
        hill2copy.position = CGPointMake(1024+2048, 152.5);
        [self addChild:hill2copy];

        
        
        hill1 = [SKSpriteNode node];
        hill1.texture = [SKTexture textureWithImage:[UIImage imageNamed:@"hill1"]];
        hill1.size = CGSizeMake(2048, 265);
        hill1.position = CGPointMake(1024, 132.5);
        [self addChild:hill1];

        hill1copy = [hill1 copy];
        hill1copy.position = CGPointMake(1024+2048, 132.5);
        [self addChild:hill1copy];
        
        rollingTextures = @[
                                     [SKTexture textureWithImageNamed:@"blob_roll1"],
                                     [SKTexture textureWithImageNamed:@"blob_roll2"],
                                     [SKTexture textureWithImageNamed:@"blob_roll3"],
                                     [SKTexture textureWithImageNamed:@"blob_roll4"],
                                     [SKTexture textureWithImageNamed:@"blob_roll6"],
                                     [SKTexture textureWithImageNamed:@"blob_roll7"]
                                     ];
        blob = [SKSpriteNode spriteNodeWithImageNamed:@"blob_roll1"];
        blob.position = CGPointMake(self.size.width/2.0, 100);
        SKAction *rolling = [SKAction animateWithTextures:rollingTextures timePerFrame:0.1];
        SKAction *infinteRolling = [SKAction repeatActionForever:rolling];
        [blob runAction: infinteRolling];
        
        blob.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:blob.size];
        blob.physicsBody.collisionBitMask = 1;
//        blob.physicsBody.affectedByGravity = NO;
        [self addChild:blob];
        
        SKSpriteNode *floor = [SKSpriteNode spriteNodeWithColor:[SKColor lightGrayColor] size:CGSizeMake(1024, 50)];
        floor.position = CGPointMake(1024/2.0, 25);
        floor.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:floor.size];
        floor.physicsBody.collisionBitMask = 1;
                            floor.physicsBody.affectedByGravity  =NO;
                            floor.physicsBody.dynamic = NO;
                            
        [self addChild:floor];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches)
    {
        CGPoint location =[touch locationInNode:self];
        float dx = (location.x <blob.position.x) ? -1.0 :1.0;
        [blob.physicsBody applyImpulse:CGVectorMake(50 *dx, 100.0)];
        
        NSArray *reverseRollingTextures = [[rollingTextures reverseObjectEnumerator] allObjects];
        
        SKAction *rollingBackwards = [SKAction animateWithTextures:reverseRollingTextures timePerFrame:0.1];
        
        SKAction *rollingTwice = [SKAction repeatAction:rollingBackwards  count:2];
        
        if (dx < 0) {
            [blob runAction:rollingTwice];
        }
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    hill1.position = CGPointMake(hill1.position.x-30, hill1.position.y);
    hill2.position = CGPointMake(hill2.position.x-20, hill2.position.y);
    hill3.position = CGPointMake(hill3.position.x-10, hill3.position.y);
    
    hill1copy.position = CGPointMake(hill1copy.position.x-30, hill1copy.position.y);
    hill2copy.position = CGPointMake(hill2copy.position.x-20, hill2copy.position.y);
    hill3copy.position = CGPointMake(hill3copy.position.x-10, hill3copy.position.y);
    
//    NSLog(@"%f",hill1.position.x);

    if (hill1.position.x < -1024) {
        hill1.position = CGPointMake(1024, hill1.position.y);
        hill1copy.position = CGPointMake(1024+2048, hill1copy.position.y);
    }
    if (hill2.position.x < -1024) {
        hill2.position = CGPointMake(1024, hill2.position.y);
        hill2copy.position = CGPointMake(1024+2048, hill2copy.position.y);
    }
    if (hill3.position.x < -1024) {
        hill3.position = CGPointMake(1024, hill3.position.y);
        hill3copy.position = CGPointMake(1024+2048, hill3copy.position.y);
    }


    
}











//        hill3 = [SKSpriteNode node];
//        hill3.texture = [SKTexture textureWithImage:[UIImage imageNamed:@"hill3"]];
//        hill3.size = CGSizeMake(2048, 650); //half of the image size // for retina


//SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
//        myLabel.text = @"Hello, World!";
//        myLabel.fontSize = 30;
//        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
//                                       CGRectGetMidY(self.frame));
//[self addChild:myLabel];

// CGPoint location = [touch locationInNode:self];
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        sprite.position = location;
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//        [sprite runAction:[SKAction repeatActionForever:action]];
//        [self addChild:sprite];


@end
