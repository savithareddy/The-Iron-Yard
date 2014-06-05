//
//  GLACollectionViewController.m
//  GridLayout
//
//  Created by Savitha Reddy on 5/30/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "GLACollectionViewController.h"

@interface GLACollectionViewController () <UICollectionViewDelegateFlowLayout>

@end

@implementation GLACollectionViewController
{
    NSArray *movies;
}

-(id)initWithCollectionViewLayout:(UICollectionViewFlowLayout *)layout
{
    self = [super initWithCollectionViewLayout:layout];
    if(self)
    {
       [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        self.collectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        movies = @[
                   @"Congo",
                   @"Godzilla",
                   @"Weekend",
                   @"Big",
                   @"Batman",
                   @"Pi",
                   @"Congo",
                   @"Godzilla",
                   @"Weekend",
                   @"Big",
                   @"Batman",
                   @"Pi"];
    }
    return self;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH-50)/3.0, (SCREEN_HEIGHT-50)/4.0);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [movies count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, cell.frame.size.width-20, 30)];
    title.text = movies [indexPath.row];
    title.textColor = [UIColor darkGrayColor];
    [cell.contentView addSubview:title];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
