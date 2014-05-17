//
//  FITLocationModel.h
//  TakeTwo
//
//  Created by Anthony Urena on 5/17/14.
//  Copyright (c) 2014 Families In Transition. All rights reserved.
//

#import "JSONModel.h"

@protocol LocationModel

@end

@interface FITLocationModel : JSONModel

@property (nonatomic, strong) NSString *natLangLocation;

@end
