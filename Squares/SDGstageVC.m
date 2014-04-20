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
    UIView *gameBoard;
    UIButton *startGame;
    UIButton *buttonFour;
    UIButton *buttonEight;
    UIButton *buttonTwelve;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
        {
        // Custom initialization
        tappedDots = [@{}mutableCopy];
        playerColors = @[BLUE_COLOR, ORANGE_COLOR];
        playerTurn = 0;
        allSquares = [@{}mutableCopy];//define
        //gameSize = @[@4,@6,@8];
        gameBoard.backgroundColor = [UIColor whiteColor];
        [self.view addSubview :gameBoard];

        startGame = [[UIButton alloc] initWithFrame:CGRectMake(120, 40, 70, 50)];
        [startGame setTitle:@" START" forState:(UIControlStateNormal)];
        [startGame addTarget:self action:@selector(pressStartGame) forControlEvents:UIControlEventTouchUpInside];
        startGame.titleLabel.font = [UIFont systemFontOfSize:15];
        startGame.layer.cornerRadius = 6;
        startGame.backgroundColor = [UIColor redColor];
        [self.view addSubview:startGame];
            
            
//        UIButton * resetGame = [[UIButton alloc] initWithFrame:CGRectMake(120, 450, 70, 50)];
//        [resetGame setTitle:@" RESET" forState:(UIControlStateNormal)];
//        [resetGame addTarget:self action:@selector(pressResetGame) forControlEvents:UIControlEventTouchUpInside];
//        resetGame.font = [UIFont systemFontOfSize:15];
//        resetGame.layer.cornerRadius = 6;
//        resetGame.backgroundColor = [UIColor blackColor];
//        [gameBoard addSubview:resetGame];
//        UIButton * changeColor = [[UIButton alloc] initWithFrame:CGRectMake(150, 0, 70, 50)];
//            [resetGame setTitle:@" RESET" forState:(UIControlStateNormal)];
//            [resetGame addTarget:self action:@selector(pressResetGame) forControlEvents:UIControlEventTouchUpInside];
//            resetGame.font = [UIFont systemFontOfSize:15];
//            resetGame.layer.cornerRadius = 6;
//            resetGame.backgroundColor = [UIColor blackColor];
//            [gameBoard addSubview:resetGame];
        }
    return self;
}

-(void)pressStartGame
{
    buttonFour = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 30, 30)];
    buttonFour.tag = 4;
    buttonFour.layer.cornerRadius = 15;
    buttonFour.backgroundColor = BLUE_COLOR;
    [buttonFour setTitle:@" 4 " forState:(UIControlStateNormal)];
    [buttonFour addTarget:self action:@selector(pressGameSize:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonFour];
    buttonEight = [[UIButton alloc] initWithFrame:CGRectMake(140, 100, 30, 30)];
    buttonEight.tag=8;
    buttonEight.layer.cornerRadius = 15;
    buttonEight.backgroundColor = BLUE_COLOR;
    [buttonEight setTitle:@" 8 " forState:(UIControlStateNormal)];
    [buttonEight addTarget:self action:@selector(pressGameSize:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonEight];
    buttonTwelve = [[UIButton alloc] initWithFrame:CGRectMake(180, 100, 30, 30)];
    buttonTwelve.tag=12;
    buttonTwelve.backgroundColor = BLUE_COLOR;
    buttonTwelve.layer.cornerRadius = 15;
    [buttonTwelve setTitle:@" 12 " forState:(UIControlStateNormal)];
    [buttonTwelve addTarget:self action:@selector(pressGameSize:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonTwelve];
 
}
-(void)pressGameSize:(id)sender
{
    /// remove gamboard from self.view
    [gameBoard removeFromSuperview];
    
    // fresh gameboard
    gameBoard = [[UIView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT)];

    // add gameboard under start button to keep from blocking button actions
    [self.view insertSubview:gameBoard belowSubview:startGame];
    
    UIButton * button = (UIButton *)sender;
    gameSize = button.tag;
    float circleWidth = SCREEN_WIDTH/gameSize;
    float squareWidth = circleWidth/2;
    
    
    for(int sRow = 0; sRow < gameSize-1;sRow++)
    {
        for(int sCol = 0; sCol<gameSize-1; sCol++)
        {
            float squareX = ((circleWidth - squareWidth)*1.5) + (circleWidth * sCol);
            float squareY = ((circleWidth - squareWidth)*1.5) + (circleWidth * sRow) + ((SCREEN_HEIGHT - SCREEN_WIDTH)/2);
            SDGSquare *square = [[SDGSquare alloc] initWithFrame:CGRectMake(squareX, squareY, squareWidth, squareWidth)];
            square.backgroundColor = [UIColor clearColor];
            square.layer.cornerRadius = 6;
            NSString *key =[NSString stringWithFormat:@"c%dr%d",sCol,sRow];
            allSquares[key] = square;//assign
            
            //[self.view addSubview:square];
            [gameBoard addSubview:square];
            
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
            //[self.view addSubview:circle];
            [gameBoard addSubview:circle];
        }
    }
    //[(UIButton *)startGame setHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    gameSize=4;
//   float circleWidth = SCREEN_WIDTH/gameSize;
//    float squareWidth = circleWidth/2;
//    
//    
//    for(int sRow = 0; sRow < gameSize-1;sRow++)
//    {
//        for(int sCol = 0; sCol<gameSize-1; sCol++)
//        {
//            float squareX = ((circleWidth - squareWidth)*1.5) + (circleWidth * sCol);
//            float squareY = ((circleWidth - squareWidth)*1.5) + (circleWidth * sRow) + ((SCREEN_HEIGHT - SCREEN_WIDTH)/2);
//            SDGSquare *square = [[SDGSquare alloc] initWithFrame:CGRectMake(squareX, squareY, squareWidth, squareWidth)];
//            square.backgroundColor = [UIColor lightGrayColor];
//            square.layer.cornerRadius = 6;
//            NSString *key =[NSString stringWithFormat:@"c%dr%d",sCol,sRow];
//            allSquares[key] = square;//assign
//
//            //[self.view addSubview:square];
//            //[gameBoard addSubview:square];
//
//        }
//    }
//    
//    for(int row=0; row<gameSize; row++)
//    {
//        for(int col=0; col<gameSize; col++)
//        {
//            float circleX = circleWidth *col;
//            float circleY = (circleWidth *row) + ((SCREEN_HEIGHT - SCREEN_WIDTH)/2);
//            SDGCircle *circle = [[SDGCircle alloc] initWithFrame:CGRectMake(circleX, circleY, circleWidth, circleWidth)];
//            //circle.backgroundColor = [UIColor yellowColor];
//            circle.position = (CGPoint){col,row};// get an idea of where we r in position around rows and cols
//            //circle.position = i;
//            NSString *key =[NSString stringWithFormat:@"c%dr%d",col,row];//for eg. col 0 and row 1  key=c0r1
//            tappedDots[key] = @2; // fillig the key with default value 2
//            circle.delegate = self;//DELEGATE
//            //[self.view addSubview:circle];
//            //[gameBoard addSubview:circle];
//        }
//    }
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
           //NSLog(@"player is %d",player);
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
               //NSLog(@"%@",topLeftDot);
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
    NSLog(@"%d",playerTurn);
    [self checkForSquareAroundPosition:position];//check for square
    UIColor *currentColor = playerColors[playerTurn];
    NSLog(@"%@",currentColor);
    playerTurn = (playerTurn) ? 0:1;
    //NSLog(@"%d",playerTurn);
    return currentColor;
}

-(NSDictionary *)changeColor:(NSInteger)row
{
    NSArray *reverseArray = [[playerColors reverseObjectEnumerator] allObjects];
    return reverseArray[row];
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
