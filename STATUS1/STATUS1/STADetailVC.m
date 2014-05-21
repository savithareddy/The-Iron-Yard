//
//  STADetailVC.m
//  STATUS1
//
//  Created by Savitha Reddy on 5/19/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "STADetailVC.h"
#import "STAphone3.h"
#import "STASmileyGrid.h"
#import "STASingleton.h"
#import "STTwitter.h"
#import <CoreLocation/CoreLocation.h>

@interface STADetailVC () <CLLocationManagerDelegate>

@property (nonatomic) BOOL twitterOn;
@property (nonatomic) BOOL fbOn;

@end

@implementation STADetailVC
{
    STTwitterAPI *twitterApi;
    UIButton *twitter;
    UIButton *google;
    UIButton *facebook;
    UIImageView *fullFace;
    UIButton *done;
    UIView *frameView;
    UIButton *back;
    
    CLLocationManager *lManager;
    CLLocation *currentLocation;
    
    NSString *locationLat;
    NSString *locationLong;
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        lManager = [[CLLocationManager alloc] init];
        lManager.delegate = self;
        [lManager startUpdatingLocation];

        //on simulator says system cannot access twitter
        //run this from the device then it shows ythe username of your account in the debug area
        twitterApi = [STTwitterAPI twitterAPIOSWithFirstAccount];
        [twitterApi verifyCredentialsWithSuccessBlock:^(NSString *username) {
            NSLog(@"%@",username);
        } errorBlock:^(NSError *error) {
            NSLog(@"%@",error.userInfo);
        }];


        twitter = [[UIButton alloc] initWithFrame:CGRectMake(84, 82, 48, 48)];
        UIImage *imageY =[UIImage imageNamed:@"sm_twitter.png"];
        [twitter setImage:imageY forState:UIControlStateNormal];
        UIImage *imageX =[UIImage imageNamed:@"sm_twitter_g.png"];
        [twitter setImage:imageX forState:UIControlStateSelected];
        twitter.tag = 0;
//        twitter.adjustsImageWhenHighlighted =YES;
        [twitter addTarget:self action:@selector(showToggle:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:twitter];
        
        facebook = [[UIButton alloc] initWithFrame:CGRectMake(172, 82, 48, 48)];
        UIImage *image4 =[UIImage imageNamed:@"sm_facebook.png"];
        [facebook setImage:image4 forState:UIControlStateNormal];
        UIImage *image5 =[UIImage imageNamed:@"sm_facebook_g.png"];
        [facebook setImage:image5 forState:UIControlStateSelected];
        facebook.tag = 1;
        [facebook addTarget:self action:@selector(showToggle:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:facebook];
        
        NSArray *detailImages = @[[UIImage imageNamed:@"yellow_1.png"],
                                  [UIImage imageNamed:@"yellow_2.png"],
                                  [UIImage imageNamed:@"yellow_3.png"],
                                  [UIImage imageNamed:@"yellow_4.png"],
                                  [UIImage imageNamed:@"yellow_5.png"],
                                  [UIImage imageNamed:@"yellow_6.png"],
                                  [UIImage imageNamed:@"yellow_7.png"],
                                  [UIImage imageNamed:@"yellow_8.png"],
                                  [UIImage imageNamed:@"yellow_9.png"]
                                  ];
        NSArray *detailRedImages = @[[UIImage imageNamed:@"angry_1.png"],
                                  [UIImage imageNamed:@"angry_2.png"],
                                  [UIImage imageNamed:@"angry_3.png"],
                                  [UIImage imageNamed:@"angry_4.png"],
                                  [UIImage imageNamed:@"angry_5.png"],
                                  [UIImage imageNamed:@"angry_6.png"],
                                  [UIImage imageNamed:@"angry_7.png"],
                                  [UIImage imageNamed:@"angry_8.png"],
                                  [UIImage imageNamed:@"angry_9.png"]
                                  ];
        
        int tagValue = [STASingleton mainSingleton].detailColor;
        fullFace = [[UIImageView alloc] initWithFrame:CGRectMake(72, 200, 176, 184)];
        NSLog(@"singleton is %d",[STASingleton mainSingleton].detailColor);
        NSLog(@"tagValue is %d",tagValue);
        if (tagValue < 9) {
            [fullFace  initWithImage:detailImages[tagValue]];
        }else{
            [fullFace initWithImage:detailRedImages[tagValue-9]];
        }
        [self.view addSubview:fullFace];
        
        back = [[UIButton alloc] initWithFrame:CGRectMake(76, 426, 48, 56)];
        UIImage *image11 = [UIImage imageNamed:@"backArrow.png"];
        [back setImage:image11 forState:UIControlStateNormal];
        [back addTarget:self action:@selector(openPreviousVC) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:back];
        
        done = [[UIButton alloc] initWithFrame:CGRectMake(196, 416, 48, 56)];
        UIImage *image10 = [UIImage imageNamed:@"check.png"];
        [done setImage:image10 forState:UIControlStateNormal];
        [done addTarget:self action:@selector(openDetail) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:done];
}
    return self;
}

-(void) openPreviousVC
{
     [self.navigationController popViewControllerAnimated:YES];
}

-(void) showToggle:(UIButton *) sender
{
    [sender setSelected:!sender.selected];
    if (sender.tag == 0) {
        _twitterOn = !_twitterOn;
    }else{
        _fbOn= !_fbOn;
            }
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{

    currentLocation = [locations objectAtIndex:0];
    [lManager stopUpdatingLocation];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error)
     {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
             NSLog(@"\nCurrent Location Detected\n");
             NSLog(@"placemark %@",placemark);
             NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
             NSString *Address = [[NSString alloc]initWithString:locatedAt];
             NSString *Area = [[NSString alloc]initWithString:placemark.locality];
             NSString *Country = [[NSString alloc]initWithString:placemark.country];
             NSString *CountryArea = [NSString stringWithFormat:@"%@, %@", Area,Country];
             NSLog(@"%@",CountryArea);

        }];
    locationLat =[NSString stringWithFormat:@"%f",currentLocation.coordinate.latitude];
     locationLong =[NSString stringWithFormat:@"%f",currentLocation.coordinate.longitude];
    
}



-(void) openDetail
{
    
//    CLLocationDegrees currentLatitude = currentLocation.coordinate.latitude;
//    CLLocationDegrees currentLongitude = currentLocation.coordinate.longitude;
//    NSLog(@"latitude is %f",currentLatitude);
//    NSLog(@"longitude is %f",currentLongitude);
    NSLog(@"Send To Social Media");
    NSLog(@"%u, %u", _twitterOn,_fbOn);
    
    if(_twitterOn)
    {
        NSLog(@"Twitter On");
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString * documentPath = paths[0];
        
        NSData * imageData = UIImagePNGRepresentation(fullFace.image);
        
        NSString* pngPath = [documentPath stringByAppendingPathComponent:@"big_smilie.png"];
        [imageData writeToFile:pngPath atomically:YES];
        NSURL * url = [NSURL fileURLWithPath:pngPath];
        
        [twitterApi postStatusUpdate:[NSString stringWithFormat:@"SMILEY FACE! %@, %@", locationLat, locationLong] inReplyToStatusID:nil mediaURL:url placeID:nil latitude:locationLat longitude:locationLong uploadProgressBlock:^(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytesExpectedToWrite) {NSLog(@"posted!");
        } successBlock:^(NSDictionary *status) {
            
            NSLog(@"%@", status);
            NSLog(@"MY LOCATION IS %@, %@", locationLong, locationLat);
            
        } errorBlock:^(NSError *error) {
            NSLog(@"%@", error.userInfo);
        }];
    }
    else {
        NSLog(@"Twitter Off");
    }
    
    if(_fbOn)
    {
        NSLog(@"FB On");
    }
    else {
        NSLog(@"FB Off");
    }
  }

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
//[twitter postStatusUpdate:tweetField.text inReplyToStatusID:nil latitude:nil longitude:nil placeID:nil displayCoordinates:nil trimUser:nil successBlock:^(NSDictionary *status) {
//    NSLog(@"%@",status);
//} errorBlock:^(NSError *error) {
//    NSLog(@"%@",error.userInfo);
//}];

//tweetfield.text is the NSString here , remaining all are nils

//        frameView = [[UIView alloc] initWithFrame:CGRectMake(60, 170, 200, 200)];
//        frameView.backgroundColor = [UIColor redColor];
//        frameView.tintColor = [UIColor clearColor];
//        [self.view addSubview:frameView];

//        google = [[UIButton alloc] initWithFrame:CGRectMake(128, 82, 48, 48)];
//        UIImage *image2 =[UIImage imageNamed:@"sm_google.png"];
//        [google setImage:image2 forState:UIControlStateNormal];
//        UIImage *image3 =[UIImage imageNamed:@"sm_google_g.png"];
//        [google setImage:image3 forState:UIControlStateSelected];
//        [google addTarget:self action:@selector(showToggle:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:google];

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
