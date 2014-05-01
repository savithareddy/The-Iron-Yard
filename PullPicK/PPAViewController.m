//
//  PPAViewController.m
//  PullPicK
//
//  Created by Savitha Reddy on 4/30/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "PPAViewController.h"
#import "PPAFilterController.h"


@interface PPAViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate,PPAFilterControllerDelegate>

@property (nonatomic) UIImage *originalImage; //required for many instances //local to this file 

@end

@implementation PPAViewController
{
    UIImageView *imageView;
    PPAFilterController *filterVC; //setting this global
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    
    UIView *navBar  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    navBar.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:navBar];
    
    UIButton *libraryButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    libraryButton.layer.cornerRadius = 15;
    [libraryButton setTitle:@"+"  forState:UIControlStateNormal];
    [libraryButton addTarget:self action:@selector(choosePhoto) forControlEvents:UIControlEventTouchUpInside];
    libraryButton.backgroundColor = [UIColor grayColor];
    [navBar addSubview:libraryButton];
    
//    UIView *suspenceView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-140, SCREEN_WIDTH, 40)];
//    suspenceView.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:suspenceView];
//    
    
    filterVC = [[PPAFilterController alloc] initWithNibName:nil bundle:nil];
    filterVC.delegate = self;
    filterVC.view.frame = CGRectMake(0, SCREEN_HEIGHT-100, SCREEN_WIDTH, 100);
    [self.view addSubview:filterVC.view];
    
    
}

-(void)updateCurrentImageWithFilteredImage:(UIImage *)image
{
    imageView.image = image;
}

-(void) setOriginalImage:(UIImage *)originalImage
{
    _originalImage=originalImage;
    filterVC.imageToFilter = originalImage;
    imageView.image=originalImage;
}

-(void) choosePhoto
{
    UIImagePickerController *imagePicker =[[UIImagePickerController alloc] init];
    
    imagePicker.delegate = self;
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    //imagePicker.allowsEditing = YES;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //NSLog(@"%@",info);
   // NSLog(@"%@", info[UIImagePickerControllerOriginalImage]);
    
    
    self.originalImage = info[UIImagePickerControllerOriginalImage];
    
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
//    UIImage *image = imageView.image;
//    CIContext *context = [CIContext contextWithOptions:nil];
//    CIImage *rawImageData = [CIImage imageWithCGImage:image.CGImage];
//    CIFilter *filter = [CIFilter filterWithName:@"CIPhotoEffectMono"];
//    [filter setValue:rawImageData forKey:kCIInputImageKey];
//    //[filter setValue:@(intensity) forKey:@"inputIntensity"];
//    CIImage *filteredImageData = [filter valueForKey:kCIOutputImageKey];
//    CGImageRef cgImgRef = [context createCGImage:filteredImageData fromRect:[filteredImageData extent]];
//    UIImage *newImage = [UIImage imageWithCGImage:cgImgRef];
//    CGImageRelease(cgImgRef);
//    imageView.image = newImage;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

-(BOOL) prefersStatusBarHidden
{
    return YES;
}


@end
