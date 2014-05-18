//
//  FITAboutViewController.h
//  Fit5
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

// FOR THE ABOUT FIT TAB (cutsom ViewController)
#import <UIKit/UIKit.h>

#define ABOUT_PAGE_URL @"http://www.fitnh.org/about-us/mission"

@interface FITAboutViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIWebView *myWebView;
@property NSString *mTemporaryUrl;

@end