//
//  SDGstageVC.m
//  Squares
//
//  Created by Savitha Reddy on 4/11/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SDGStageVC.h"

@interface SDGStageVC ()

@end

@implementation SDGStageVC
{
    int gameSize;
    NSArray *playerColors;
    int playerTurn;
    NSMutableDictionary *tappedDots;
    NSMutableDictionary *allSquares;//create dictionary to group all  squares
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        tappedDots = [@{}mutableCopy];
        playerColors = @[BLUE_COLOR, ORANGE_COLOR];
        playerTurn = 0;
        allSquares = [@{}mutableCopy];//define
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    gameSize=7;
   float circleWidth = SCREEN_WIDTH/gameSize;
    float squareWidth = circleWidth/2;
    
    for(int sRow = 0; sRow < gameSize-1;sRow++)
    {
        for(int sCol = 0; sCol<gameSize-1; sCol++)
        {
            float squareX = ((circleWidth - squareWidth)*1.5) + (circleWidth * sCol);
            float squareY = ((circleWidth - squareWidth)*1.5) + (circleWidth * sRow) + ((SCREEN_HEIGHT - SCREEN_WIDTH)/2);
            SDGSquare *square = [[SDGSquare alloc] initWithFrame:CGRectMake(squareX, squareY, squareWidth, squareWidth)];
            square.backgroundColor = [UIColor lightGrayColor];
            NSString *key =[NSString stringWithFormat:@"c%dr%d",sCol,sRow];
            allSquares[key] = square;//assign

            [self.view addSubview:square];

        }
    }
    
    for(int row=0; row<gameSize; row++)
    {
        for(int col=0; col<gameSize; col++)
        {
            float circleX = circleWidth *col;
            float circleY = (circleWidth *row) + ((SCREEN_HEIGHT - SCREEN_WIDTH)/2);
            SDGCircle *circle = [[SDGCircle alloc] initWithFrame:CGRectMake(circleX, circleY, circleWidth, circleWidth)];
            //circle.backgroundColor = [UIColor yellowColor];
            circle.position = (CGPoint){col,row};// get an idea of where we r in position around rows and cols
            //circle.position = i;
            NSString *key =[NSString stringWithFormat:@"c%dr%d",col,row];//for eg. col 0 and row 1  key=c0r1
            tappedDots[key] = @2; // fillig the key with default value 2
            circle.delegate = self;//DELEGATE
            [self.view addSubview:circle];
        }
    }
//    for (float i=0.0; i< gameSize * gameSize; i++) {
//        //NSLog(@"i = %f",i);
//        float decimal = floor ((i/gameSize) *100)/100.0;
//        //NSLog(@"decimal:%f", decimal);
//        int row=floor(decimal);
//        int col=ceil((decimal-floorf(decimal)) * (gameSize-1));
//        //NSLog(@"i /gameSize = %f", i/gameSize);
//        //NSLog(@"i:%f --- row: %d --- col: %d",i,row, col);
//        float circleX = circleWidth *col;
//        float circleY = (circleWidth *row) + ((SCREEN_HEIGHT - SCREEN_WIDTH)/2);
//        SDGCircle *circle = [[SDGCircle alloc] initWithFrame:CGRectMake(circleX, circleY, circleWidth, circleWidth)];
//        //circle.backgroundColor = [UIColor yellowColor];
//        circle.position = (CGPoint){col,row};// get an idea of where we r in position around rows and cols
//        //circle.position = i;
//        NSString *key =[NSString stringWithFormat:@"c%dr%d",col,row];//for eg. col 0 and row 1  key=c0r1
//        tappedDots[key] = @2; // fillig the key with default value 2
//        circle.delegate = self;//DELEGATE
//        [self.view addSubview:circle];
//        }
   
}
-(void) checkForSquareAroundPosition : (CGPoint) position
{
    //tappedDots = @{@"r0c0:@0,@"r0c1":@1,@"r0c2":@2};
    //x = col and y =row
    int pX = position.x;
    int pY = position.y;
    
    BOOL above = (pY >0);
    BOOL below = (pY <gameSize -1);
    BOOL left = (pX >0);
    BOOL right = (pX <gameSize-1);

    
   if (above && left)//hipchat
   {
       for (UIColor * color in playerColors) //playercolors array loop get the color value
       {
           int player = [playerColors indexOfObject:color];// color has the value and assigned to player
           NSLog(@"player is %d",player);
           //from the position, check for reverse value ie top left is -1,-1, then right is 0,-1, left is -1,0 and current is 0,0
            NSString *topLeftDot = [NSString stringWithFormat:@"c%dr%d",pX-1,pY-1];// All dots are keys for dictionary
            NSString *topRightDot = [NSString stringWithFormat:@"c%dr%d",pX,pY-1];
            NSString *bottomLeftDot = [NSString stringWithFormat:@"c%dr%d",pX-1,pY];
            NSString *bottomRightDot = [NSString stringWithFormat:@"c%dr%d",pX,pY];
           
           BOOL topDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[topRightDot]]); //checks if top left and top right are the same
           BOOL bottomDotsSame = ([tappedDots[bottomLeftDot] isEqualToValue:tappedDots[bottomRightDot]]);//checks if bottom left and bottom right are the same
           BOOL leftDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[bottomLeftDot]]);//checks if top left and bottom left are the same
           //if top, left,botoms dots the same as player ... then they own square
           if(topDotsSame && bottomDotsSame && leftDotsSame && [tappedDots[topLeftDot] isEqualToValue:@(player)])
           {
               SDGSquare *currentSquare = allSquares[topLeftDot];//get the position of a single square from all squares
               //player owns the square
               NSLog(@"%@",topLeftDot);
               currentSquare.backgroundColor = color;
           }
       
       }
   }
    if (above && right)
   {
       
   }
    if (below && left)
   {
       
   }
    if (below && right)
    {
        
    }
}

-(UIColor *) circleTappedWithPosition:(CGPoint)position
{
    NSString *key =[NSString stringWithFormat:@"c%dr%d",(int)position.x,(int)position.y];//get tappedDots key from position
    tappedDots[key] =@(playerTurn);//set player num to value in tappeddots
    [self checkForSquareAroundPosition:position];//check for square
    UIColor *currentColor = playerColors[playerTurn];
    playerTurn = (playerTurn) ? 0:1;
    return currentColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
-(BOOL) prefersStatusBarHidden //added to hide the status bar from being seen
{
    return YES;
}
@end
