//
//  DLAViewController.m
//  DrawLinesApp
//
//  Created by Savitha Reddy on 4/15/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "DLAViewController.h"
#import "DLAStageLines.h"
#import "DLAStageScribble.h"

@interface DLAViewController ()

@end

@implementation DLAViewController
{
    
    DLAStageScribble *scribbleView;
    UIView *colorsDrawers;
    float globalWidth;
    UIColor * globalColor;

    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
        //self.view = [[DLAStageLines alloc] initWithFrame:self.view.frame];//stage.m has initwithframe
       //self.view = [[DLAStageScribble alloc] initWithFrame:self.view.frame]; //scribble as view no
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    globalColor = [UIColor purpleColor]; //default value set
    globalWidth = 5.0;
    //scribbleView = [[DLAStageScribble alloc] initWithFrame: self.view.frame];
    //scribbleView = [[DLAStageLines alloc] initWithFrame: self.view.frame];
    [self toggleStage];
    //scribbleView.lineColor = [UIColor blueColor];
    [self.view addSubview: scribbleView];
    UISlider * slider = [[UISlider alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT-43, 280, 23)];//default height is 23
    slider.maximumValue = 20.0;
    slider.minimumValue = 2.0;
    slider.value = globalWidth;
    [slider addTarget:self action:@selector(changeSize:) forControlEvents:UIControlEventAllEvents];
    [self.view addSubview:slider];
    colorsDrawers = [[UIView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, 40)];
    [self.view addSubview:colorsDrawers];

    NSArray * colors = @[
                         [UIColor colorWithRed:0.251f green:0.251f blue:0.251f alpha:1.0f],
                         [UIColor colorWithRed:0.008f green:0.353f blue:0.431f alpha:1.0f],
                         [UIColor colorWithRed:0.016f green:0.604f blue:0.671f alpha:1.0f],
                         [UIColor colorWithRed:1.000f green:0.988f blue:0.910f alpha:1.0f],
                        [UIColor colorWithRed:1.000f green:0.298f blue:0.153f alpha:1.0f]
                        ];
    float buttonWidth = SCREEN_WIDTH/[colors count];
    for( UIColor * color in colors)
    {
        int index = [colors indexOfObject:color];
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(buttonWidth * index, 0, buttonWidth, 40)];
        button.backgroundColor = color;
        [button addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
        //[colorsDrawers addSubview:button];
        [self.view addSubview:button];

        }
    
    //[self.view addSubview:colorsDrawers];
    UISwitch *toggleButton = [[UISwitch alloc] initWithFrame:CGRectMake(10, 60, 50, 50)];
    //[toggleButton setTitle:@" Toggle " forState:(UIControlStateNormal)];
   // toggleButton.font= [UIFont systemFontOfSize:10];
    toggleButton.backgroundColor = [UIColor blackColor];
    [toggleButton addTarget:self action:@selector(toggleStage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:toggleButton];
    
    UIButton *undoButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-120, 50, 50, 50)];
    [undoButton setTitle:@" Undo " forState:(UIControlStateNormal)];
    undoButton.font= [UIFont systemFontOfSize:10];
    undoButton.backgroundColor = [UIColor lightGrayColor];
    [undoButton addTarget:self action:@selector(undo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:undoButton];
    
    UIButton *clearButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, 50, 50, 50)];
    [clearButton setTitle:@" Delete " forState:(UIControlStateNormal)];
    clearButton.font= [UIFont systemFontOfSize:10];
    clearButton.backgroundColor = [UIColor redColor];
    [clearButton addTarget:self action:@selector(clearStage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearButton];
}
-(void) undo
{
    [scribbleView undo];
}
-(void) clearStage
{
    [scribbleView clearStage];
}
-(void) toggleStage
{
    NSMutableArray * lines = scribbleView.lines;
    [scribbleView removeFromSuperview]; // remove from view
    if ([scribbleView isMemberOfClass:[DLAStageScribble class]])
    {
    scribbleView = [[DLAStageLines alloc] initWithFrame:self.view.frame];
    }else
    {
       scribbleView = [[DLAStageScribble alloc] initWithFrame:self.view.frame];
    }
    scribbleView.lineWidth = globalWidth; // setting to the global value
    scribbleView.lineColor = globalColor;
    if (lines != nil) scribbleView.lines = lines; // to add back the lines
        
    
    [self.view insertSubview:scribbleView atIndex:0];
}

-(void) changeSize: (UISlider *) sender
{
    
    globalWidth = sender.value; // changing the default
    scribbleView.lineWidth = globalWidth; // scribbleView.linewidth is the getter method ie getting the value of linewidth from scribbleView and then assigning it to UISlider
    //scribbleView.linewidth = sender.value;
    
}
-(void) changeColor : (UIButton *) sender
{
    globalColor = sender.backgroundColor;// changing the default
    scribbleView.lineColor = globalColor;
    
}

-(BOOL) prefersStatusBarHidden
{
    return YES;
}
//-(void) pressColor: (id) sender
//{
//    UIButton *lineColor = (UIButton *)sender;
//    Color= lineColor.tag;
//
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
