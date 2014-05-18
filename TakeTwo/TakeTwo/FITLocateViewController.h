//
//  FITLocateViewController.h
//  TakeTwo
//
//  Created by Hackademy on 5/18/14.
//  Copyright (c) 2014 Families In Transition. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface FITLocateViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}
@property (strong, nonatomic) IBOutlet MKMapView *myMapView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *HousingButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *FoodPantryButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *ThriftStoreButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *DonationButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *RecoveryServicesButton;
@property (strong, nonatomic) NSDictionary *locations;

@end
