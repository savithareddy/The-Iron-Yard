//
//  TDLTableViewCell.m
//  ColorTODO
//
//  Created by Savitha Reddy on 4/8/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TDLTableViewCell.h"
#import "MOVE.h"

@implementation TDLTableViewCell
UIButton *buttonLow;
UIButton *buttonMed;
UIButton *buttonHigh;
UIButton *buttonDelete;






- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.bgView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width -20,40)];
        //UILabel * listTodo = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 60, 30)];
        //listTodo.backgroundColor = [UIColor redColor];
        //listTodo.textColor = [UIColor whiteColor];
        [self.contentView addSubview: self.bgView];
        self.bgView.layer.cornerRadius = 6;
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, 200, 30)];
        self.nameLabel.textColor= [UIColor whiteColor];
        self.nameLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
        //[self.contentView addSubview:self.nameLabel];
        [self.bgView addSubview:self.nameLabel];
        
        self.strikeThrough = [[UIView alloc] initWithFrame:CGRectMake(5, 20, self.frame.size.width -30,2)];
        self.strikeThrough.backgroundColor = [UIColor whiteColor];
        self.strikeThrough.alpha = 0;
        [self.bgView addSubview:self.strikeThrough];
        
        self.circleButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 10, 15, 15)];
        //self.circleButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width-50, 10, 20, 20)];// format for ipad and iphone app universal
        self.circleButton.backgroundColor = [UIColor whiteColor];
        
        self.circleButton.layer.cornerRadius=7.5;
        //[self.contentView addSubview:self.circleButton];
        [self.bgView addSubview:self.circleButton];
        
        
        
        
        }
    return self;
}

-(void) showDeleteButton
{
    self.delView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width -20,40)];
    //UILabel * listTodo = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 60, 30)];
    //listTodo.backgroundColor = [UIColor redColor];
    //listTodo.textColor = [UIColor whiteColor];
    [self.contentView addSubview: self.delView];
    self.delView.layer.cornerRadius = 6;

    buttonDelete = [[UIButton alloc] initWithFrame:CGRectMake(280, 0, 30, 30)];
    [buttonDelete setTitle:@"-" forState:(UIControlStateNormal)];
    buttonDelete.alpha=0;
    //[buttonDelete addTarget:self action:@selector(pressDelete) forControlEvents:UIControlEventTouchUpInside];
    buttonDelete.layer.cornerRadius = 15;
    buttonDelete.backgroundColor = [UIColor redColor];
    buttonDelete.font = [UIFont fontWithName:@"HelveticaNeue" size:20];
    [self.delView addSubview:buttonDelete];
    [MOVE animateView:buttonDelete properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.1}];
}

-(void) hideDeleteButton
{
    [MOVE animateView:_delView properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@2.0,@"remove":@YES}];

    //[MOVE animateView:buttonDelete properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@2.0,@"remove":@YES}];
    
}


-(void) showCircleButtons
{
    self.threeView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width -20,40)];
    //UILabel * listTodo = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 60, 30)];
    //listTodo.backgroundColor = [UIColor redColor];
    //listTodo.textColor = [UIColor whiteColor];
    [self.contentView addSubview: self.threeView];
    self.threeView.layer.cornerRadius = 6;

    buttonLow = [[UIButton alloc] initWithFrame:CGRectMake(200, 0, 30, 30)];//y value to bgView value
    buttonLow.tag = 1;
    buttonLow.alpha = 0;
    buttonLow.layer.cornerRadius = 15;
    buttonLow.backgroundColor = YELLOW_COLOR;
    //buttonLow.backgroundColor = [UIColor greenColor];
    //[buttonLow addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
    [self.threeView addSubview:buttonLow];
    buttonMed = [[UIButton alloc] initWithFrame:CGRectMake(240, 0, 30, 30)];
    buttonMed.tag=2;
    buttonMed.alpha = 0;
    buttonMed.layer.cornerRadius = 15;
    buttonMed.backgroundColor = ORANGE_COLOR;
    //buttonMed.backgroundColor = [UIColor brownColor];
    //[buttonMed addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
    [self.threeView addSubview:buttonMed];
    buttonHigh = [[UIButton alloc] initWithFrame:CGRectMake(280, 0, 30, 30)];
    buttonHigh.tag=3;
    buttonHigh.alpha = 0;
    buttonHigh.backgroundColor = RED_COLOR;
    buttonHigh.layer.cornerRadius = 15;
   // buttonHigh.layer.cornerRadius = buttonHigh.frame.size.width/2.0;
    buttonHigh.backgroundColor = [UIColor redColor];
    //[buttonHigh addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
    [self.threeView addSubview:buttonHigh];
    [MOVE animateView:buttonLow properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.3}];
    [MOVE animateView:buttonMed properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.2}];
    [MOVE animateView:buttonHigh properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.1}];
}

-(void) hideCircleButtons
{
    [MOVE animateView:_threeView properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.0,@"remove":@YES}];

//    [MOVE animateView:buttonLow properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.0,@"remove":@YES}];
//    [MOVE animateView:buttonMed properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.1,@"remove":@YES}];
//    [MOVE animateView:buttonHigh properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.2,@"remove":@YES}];
//   
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
