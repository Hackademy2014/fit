//
//  FITVolunteerViewController.h
//  Fit5
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import <UIKit/UIKit.h>

#define VOLUNTEER_PAGE_URL @"http://www.fitnh.org/volunteer/volunteer-opportunities/"

@interface FITVolunteerViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIWebView *myWebView;
@property NSString *mTemporaryUrl;

@end
