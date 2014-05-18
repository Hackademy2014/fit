//
//  FITEventsViewController.h
//  TakeTwo
//
//  Created by Anthony Urena on 5/17/14.
//  Copyright (c) 2014 Families In Transition. All rights reserved.
//

#import <UIKit/UIKit.h>

#define EVENTS_PAGE_URL @"http://www.fitnh.org/news-events/events/"

@interface FITEventsViewController  : UIViewController

@property (nonatomic, strong) IBOutlet UIWebView *myWebView;
@property NSString *mTemporaryUrl;

@end