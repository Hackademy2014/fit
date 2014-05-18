//
//  FITLocateViewController.m
//  TakeTwo
//
//  Created by Hackademy on 5/18/14.
//  Copyright (c) 2014 Families In Transition. All rights reserved.
//

#import "FITLocateViewController.h"
#import "FITAnnonation.h"
#import "PlaceAnnotation.h"

@interface FITLocateViewController ()

@end

@implementation FITLocateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Make this controller the delegate for the map view.
    self.myMapView.delegate = self;
    
    // Ensure that you can view your own location in the map view.
    [self.myMapView setShowsUserLocation:YES];
    
    //Instantiate a location object.
    locationManager = [[CLLocationManager alloc] init];
    
    //Make this controller the delegate for the location manager.
    [locationManager setDelegate:self];
    
    //Set some parameters for the location object.
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
}

#pragma mark - MKMapViewDelegate methods.
- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views {
    MKCoordinateRegion region;
    
    // this sets the map's view to the user's location
    //region = MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate,1000,1000);
    
    
    //[mv setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)toolBarButtonPress:(id)sender {
    UIBarButtonItem *button = (UIBarButtonItem *)sender;
    //NSString *buttonTitle = [button.title lowercaseString];
    
    //remove previously generated annotations
    for (id<MKAnnotation> annotation in self.myMapView.annotations) {
        if ([annotation isKindOfClass:[PlaceAnnotation class]]) {
            [self.myMapView removeAnnotation:annotation];
        }
    }

    // adding annotations based on a category
    if ([button.title isEqualToString:self.HousingButton.title]) {
        PlaceAnnotation *anno = [[PlaceAnnotation alloc] init];
        anno.coordinate = CLLocationCoordinate2DMake(42.9700433, -71.4557337);
        anno.title = @"Intensive Outpatient Program";
        anno.subTitle = @"161 S. Beech Street, Manchester, NH";
        [self.myMapView addAnnotation:anno];
    } else if ([button.title isEqualToString:self.ThriftStoreButton.title]) {
        PlaceAnnotation *anno = [[PlaceAnnotation alloc] init];
        anno.coordinate = CLLocationCoordinate2DMake(42.97728679999999, -71.473699000000001);
        anno.title = @"OutFITters Thrift Store";
        anno.subTitle = @"394 Second Street Manchester, NH 03102";
        [self.myMapView addAnnotation:anno];

        PlaceAnnotation *anno1 = [[PlaceAnnotation alloc] init];
        anno1.coordinate = CLLocationCoordinate2DMake(43.203451, -71.536134);
        anno1.title = @"OutFITters Boutique";
        anno1.subTitle = @"20 South Main Street Concord, NH 03301";
        [self.myMapView addAnnotation:anno1];
    }
    
    //Use this title text to build the URL query and get the data from Google. Change the radius value to increase the size of the search area in meters. The max is 50,000.
    //[self queryGooglePlaces:buttonTitle];
}

/*
- (void) addAnnotationsToMapFromCategory:(NSString*)category {
    NSArray *coords = [self.locations objectForKey:category];
    for (int i = 0; i < coords.count; i++) {
        //[self makeAnnotationForMapCoords:[coords objectAtIndex:i] locationTitle:@"Something"];
    }
}

- (PlaceAnnotation*) makeAnnotationForMapCoords:(CLLocationCoordinate2D)coords locationTitle:(NSString*)title {
    PlaceAnnotation *annotation = [[PlaceAnnotation alloc] init];
    annotation.coordinate = coords;
    annotation.title = title;
    
    return annotation;
}
*/

/*- (void)plotPositions:(NSArray *)data
{
    //Remove any existing custom annotations but not the user location blue dot.
    for (id<MKAnnotation> annotation in mapView.annotations)
    {
        if ([annotation isKindOfClass:[MapPoint class]])
        {
            [mapView removeAnnotation:annotation];
        }
    }
    
    
    //Loop through the array of places returned from the Google API.
    for (int i=0; i<[data count]; i++)
    {
        
        //Retrieve the NSDictionary object in each index of the array.
        NSDictionary* place = [data objectAtIndex:i];
        
        //There is a specific NSDictionary object that gives us location info.
        NSDictionary *geo = [place objectForKey:@"geometry"];
        
        
        //Get our name and address info for adding to a pin.
        NSString *name=[place objectForKey:@"name"];
        NSString *vicinity=[place objectForKey:@"vicinity"];
        
        //Get the lat and long for the location.
        NSDictionary *loc = [geo objectForKey:@"location"];
        
        //Create a special variable to hold this coordinate info.
        CLLocationCoordinate2D placeCoord;
        
        //Set the lat and long.
        placeCoord.latitude=[[loc objectForKey:@"lat"] doubleValue];
        placeCoord.longitude=[[loc objectForKey:@"lng"] doubleValue];
        
        //Create a new annotiation.
        MapPoint *placeObject = [[MapPoint alloc] initWithName:name address:vicinity coordinate:placeCoord];
        
        
        [mapView addAnnotation:placeObject];
    }
}*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//- (void) createAnnotations
//{
    //FITAnnotation *fa;
    //[myMayView ]
    //CLLocationCoordinate2D location = ["0.0", "0.0"];
//}

@end
