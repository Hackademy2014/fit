//
//  FITGivingViewController.m
//  Placeholder
//
//  Created by Anthony Urena on 5/17/14.
//  Copyright (c) 2014 Families In Transition. All rights reserved.
//

#import "FITGivingViewController.h"
#import "FITLocationModel.h"
#import "PlaceAnnotation.h"

@interface FITGivingViewController ()

@end

@implementation FITGivingViewController

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"CategoryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // TODO handle touch events
    //[self highlightLocationsByCategory: cell.textLabel.text];
}

- (void) highlightLocationsByCategory: (NSString *) category {
    NSArray *locations = [self.givingData objectForKey:@"locations"];
    NSMutableArray *actives = [NSMutableArray alloc];
    
    for (FITLocationModel *loc in locations) {
        for (FITCategory *cat in loc.categories) {
            if(cat.title == category) {
                [actives addObject:loc.place];
                break;
            }
        }
    }
    
    [actives objectAtIndex:0];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"CategoryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] init];
    }

    NSArray *categories = [self.givingData valueForKey: @"categories"];

    // use the provided indexpath to select the category
    FITCategory *theCategory = [categories objectAtIndex:indexPath.row];

    cell.textLabel.text = theCategory.title;

    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = [[self.givingData valueForKey:@"categories"] count];
    return count;
}

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
    
    //FITDonationItemModel *donitem1 = [[FITDonationItemModel alloc] init];
    
    //FITDonationItemModel *donitem2 = [[FITDonationItemModel alloc] init];
    //donitem1.title = @"";
    //donitem1.description = @"";
    //donitem2.title = @"";
    //donitem2.description = @"";
    

    FITCategory *cat1 = [[FITCategory alloc] init];
    FITCategory *cat2 = [[FITCategory alloc] init];
    FITCategory *cat3 = [[FITCategory alloc] init];
    cat1.title = @"Gently Used Items";
    cat2.title = @"In Kind Items";
    cat3.title = @"Food";

    //cat1.donationItems = [NSArray arrayWithObject:
    //                      donitem1];
    //cat2.donationItems = [NSArray arrayWithObject:
    //                      donitem2];
    //[cat1 donationItems:[NSArray arrayWithObject:donitem1]];
    
    NSArray *categories = [NSArray arrayWithObjects:
                           cat1, cat2, cat3, nil];
    
    NSString *loc1 = @"394 Second Street Manchester, NH 03102";
    NSString *loc2 = @"20 South Main Street Concord, NH 03301";
    
    FITLocationModel *locm1 = [FITLocationModel alloc];
    FITLocationModel *locm2 = [FITLocationModel alloc];
    
    locm1.natLangLocation = loc1;
    locm1.locationName = @"394 Second Street \n Manchester, NH 03102";
    locm2.natLangLocation = loc2;
    locm2.locationName = @"20 South Main Street Concord, NH 03301";

    NSArray *catStrings = [NSArray arrayWithObjects:@"Clothing", nil];
    
    locm1.categories = locm2.categories = catStrings;
    
    NSArray *locations = [NSArray arrayWithObjects:locm1, locm2, nil];
    
    NSDictionary *data = [NSDictionary dictionaryWithObjectsAndKeys:
                          categories, @"categories",
                          locations, @"locations",
                          nil];

    self.givingData = data;
    self.donationView.delegate = self;
    self.mapView.delegate = self;
    self.donationView.dataSource = self;
    [self showPlaces:locm1];
    [self showPlaces:locm2];
    [self.mapView setShowsUserLocation:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showPlaces:(FITLocationModel *)location
{
    // Clear existing pins
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    
    request.naturalLanguageQuery = location.natLangLocation;
    
    MKLocalSearchCompletionHandler completionHandler = ^(MKLocalSearchResponse *response, NSError *error)
    {
        if (error != nil)
        {
            NSString *errorStr = [[error userInfo] valueForKey:NSLocalizedDescriptionKey];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Could not find places"
                                                            message:errorStr
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        else
        {
            location.place = [[response mapItems] objectAtIndex:0];
            MKMapItem *item = location.place;
            //PlaceAnnotation *anno = [self makeAnnotationForMapItem:item
                                                          //location:location];
//            [self.mapView addAnnotation:anno];
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    };
    
    MKLocalSearch *localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    
    [localSearch startWithCompletionHandler:completionHandler];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

/*
- (PlaceAnnotation*) makeAnnotationForMapItem:(MKMapItem*)item locationTitle:(NSString*)title {
     *annotation = [[PlaceAnnotation alloc] init];
    annotation.coordinate = item.placemark.location.coordinate;
    annotation.title = title;
    annotation.url = item.url;
    
    return annotation;
}
*/


//_____________________________________________________________________

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self loadWebViewContent:GIVE_PAGE_URL];
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
    NSString *content = [self saveMainPage:@"give.html" FromContent:data]; //Define different .html pages later?
    
    /*NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
     NSString *documentsDirectory = [paths objectAtIndex:0];
     self.mTemporaryUrl = documentsDirectory;
     
     NSString *contentUrl = [NSString stringWithFormat:@"%@%@", self.mTemporaryUrl, @"/give.html"];
     NSString *content = [NSString stringWithContentsOfFile:contentUrl encoding:NSUTF8StringEncoding error:nil];*/
    
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
        /*UIAlertView *noMainContentAlert = [[UIAlertView alloc] initWithTitle:@"Uh oh."
                                                                     message:@"Something seems to have gone wrong."
                                                                    delegate:nil
                                                           cancelButtonTitle:@"OK"
                                                           otherButtonTitles:nil];
        [noMainContentAlert show];*/
        
        //For loading local html/css files...
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSURL *homeIndexUrl = [mainBundle URLForResource:@"give" withExtension:@"html"];
        
        NSURLRequest *urlReq = [NSURLRequest requestWithURL:homeIndexUrl];
        [self.myWebView loadRequest:urlReq];
    }
    else
    {
        NSString *tmpContent = [pageSource substringFromIndex:startContent.location];
        content = [NSString stringWithFormat:@"%@%@", @"<div class=\"", tmpContent];
        
        NSString *viewportHeader = @"<html><head><link rel=\"stylesheet\" href=\"style.css\" type=\"text/css\"><style>div {min-width:device-width;}</style></head><body>";
        content = [NSString stringWithFormat:@"%@%@", viewportHeader, content];
        
        NSString *footer = @"</body></html>";
        content = [NSString stringWithFormat:@"%@%@", content, footer];
        
        NSRange endContent = [content rangeOfString:endContentKeyword];
        
        if(endContent.location == NSNotFound)
        {
            //Oh my
            /*UIAlertView *undefinedEndAlert = [[UIAlertView alloc] initWithTitle:@"Uh oh."
                                                                        message:@"Something seems to have gone wrong."
                                                                       delegate:nil
                                                              cancelButtonTitle:@"OK"
                                                              otherButtonTitles:nil];
            [undefinedEndAlert show];*/
            
            //For loading local html/css files...
            NSBundle *mainBundle = [NSBundle mainBundle];
            NSURL *homeIndexUrl = [mainBundle URLForResource:@"give" withExtension:@"html"];
            
            NSURLRequest *urlReq = [NSURLRequest requestWithURL:homeIndexUrl];
            [self.myWebView loadRequest:urlReq];
        }
        else
        {
            content = [content substringToIndex:endContent.location];
            
            /*NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
             
             NSString *documentsDirectory = [paths objectAtIndex:0];
             self.mTemporaryUrl = documentsDirectory;
             
             NSString *path = [documentsDirectory stringByAppendingPathComponent:fileName];
             [content writeToFile:path atomically:YES];*/
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
