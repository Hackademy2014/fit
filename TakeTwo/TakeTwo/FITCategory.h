//
//  FITCategory.h
//  TakeTwo
//
//  Created by Anthony Urena on 5/17/14.
//  Copyright (c) 2014 Families In Transition. All rights reserved.
//

#import "JSONModel.h"

@protocol Category

@end

@interface FITCategory : JSONModel

@property (nonatomic, strong) NSString *title;

@end
