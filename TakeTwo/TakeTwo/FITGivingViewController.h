//
//  FITGivingViewController.h
//  Placeholder
//
//  Created by Anthony Urena on 5/17/14.
//  Copyright (c) 2014 Families In Transition. All rights reserved.
//

#import "FITGivingModel.h"
#import <UIKit/UIKit.h>

#define GIVE_PAGE_URL @"http://www.fitnh.org/donate/ways-to-give/"


@interface FITGivingViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *donationView;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) NSDictionary *givingData;
@property (nonatomic, strong) IBOutlet UIWebView *myWebView;
@property NSString *mTemporaryUrl;


@end
