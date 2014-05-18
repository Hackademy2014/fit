//
//  FITLocationModel.h
//  TakeTwo
//
//  Created by Anthony Urena on 5/17/14.
//  Copyright (c) 2014 Families In Transition. All rights reserved.
//

#import <MapKit/MapKit.h>

@protocol LocationModel

@end

@interface FITLocationModel : NSObject

@property (nonatomic, strong) NSString *natLangLocation;
@property (nonatomic, strong) NSString *locationName;
@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, strong) MKMapItem *place;

@end
