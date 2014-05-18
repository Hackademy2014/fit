//
//  FITAnnonation.m
//  TakeTwo
//
//  Created by Hackademy on 5/18/14.
//  Copyright (c) 2014 Families In Transition. All rights reserved.
//

#import "FITAnnonation.h"

@implementation FITAnnotation
@synthesize coordinate = _coordinate;
@synthesize title = _title;
@synthesize subtitle = _subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate {
    self = [super init];
    
    if (self != nil) {
        self.coordinate = coordinate;
    }
    
    return self;
}

- (NSString *)title {
    return _title;
}

- (NSString *)subtitle {
    return _subtitle;
}
@end