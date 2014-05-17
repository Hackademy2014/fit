//
//  FITVolunteerViewController.m
//  Fit5
//
//  Created by Hackademy on 5/17/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import "FITVolunteerViewController.h"

@interface FITVolunteerViewController ()

@end

@implementation FITVolunteerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self loadWebViewContent:VOLUNTEER_PAGE_URL];
}

#pragma mark - Loading Views
- (void)loadWebViewContent:(NSString*)webPage
{
    //For loading local html/css files...
    /*NSBundle *mainBundle = [NSBundle mainBundle];
     NSURL *homeIndexUrl = [mainBundle URLForResource:@"aboutUs" withExtension:@"html"];
     
     NSURLRequest *urlReq = [NSURLRequest requestWithURL:homeIndexUrl];
     [self.myWebView loadRequest:urlReq];*/
    
    NSString *data = [self loadPageSource:(webPage)]; //This needs overloads or a variable for URL
    [self saveMainPage:@"volunteer.html" FromContent:data]; //Define different .html pages later?
    
    NSString *contentUrl = [NSString stringWithFormat:@"%@%@", self.mTemporaryUrl, @"/volunteer.html"];
    NSString *content = [NSString stringWithContentsOfFile:contentUrl encoding:NSUTF8StringEncoding error:nil];
    
    [self.myWebView loadHTMLString:content baseURL:nil];
}

- (NSString*) loadPageSource:(NSString*)webPageUrl
{
    NSString *urlString = webPageUrl;
    NSURL *url = [NSURL URLWithString:urlString];
    
    //This version doesn't play nicely with all of the web, so less formatting below...
    /*NSError *error;
     NSString *content = [NSString stringWithContentsOfURL:googleURL
     encoding:NSASCIIStringEncoding
     error:&error];*/
    NSString *content = [NSString stringWithContentsOfURL:url];
    
    return content;
}

- (NSString*) saveMainPage:(NSString*)fileName FromContent:(NSString*)pageSource
{
    NSString *content;
    
    NSString *startContentKeyword = @"maincontent";
    NSString *endContentKeyword = @"</div>";
    
    NSRange startContent = [pageSource rangeOfString:startContentKeyword];
    
    if(startContent.location == NSNotFound)
    {
        //Uh oh
        UIAlertView *noMainContentAlert = [[UIAlertView alloc] initWithTitle:@"Uh oh."
                                                                     message:@"Something seems to have gone wrong."
                                                                    delegate:nil
                                                           cancelButtonTitle:@"OK"
                                                           otherButtonTitles:nil];
        [noMainContentAlert show];
        
        //For loading local html/css files...
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSURL *homeIndexUrl = [mainBundle URLForResource:@"volunteer" withExtension:@"html"];
        
        NSURLRequest *urlReq = [NSURLRequest requestWithURL:homeIndexUrl];
        [self.myWebView loadRequest:urlReq];
    }
    else
    {
        NSString *tmpContent = [pageSource substringFromIndex:startContent.location];
        content = [NSString stringWithFormat:@"%@%@", @"<div class=\"", tmpContent];
        
        NSRange endContent = [content rangeOfString:endContentKeyword];
        
        if(endContent.location == NSNotFound)
        {
            //Oh my
            UIAlertView *undefinedEndAlert = [[UIAlertView alloc] initWithTitle:@"Uh oh."
                                                                        message:@"Something seems to have gone wrong."
                                                                       delegate:nil
                                                              cancelButtonTitle:@"OK"
                                                              otherButtonTitles:nil];
            [undefinedEndAlert show];
            
            //For loading local html/css files...
            NSBundle *mainBundle = [NSBundle mainBundle];
            NSURL *homeIndexUrl = [mainBundle URLForResource:@"volunteer" withExtension:@"html"];
            
            NSURLRequest *urlReq = [NSURLRequest requestWithURL:homeIndexUrl];
            [self.myWebView loadRequest:urlReq];
        }
        else
        {
            content = [content substringToIndex:endContent.location];
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            
            NSString *documentsDirectory = [paths objectAtIndex:0];
            self.mTemporaryUrl = documentsDirectory;
            
            NSString *path = [documentsDirectory stringByAppendingPathComponent:fileName];
            [content writeToFile:path atomically:YES];
        }
    }
    
    return content;
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
