//
//  FITCategoryModel.h
//  Placeholder
//
//  Created by Anthony Urena on 5/17/14.
//  Copyright (c) 2014 Families In Transition. All rights reserved.
//

#import "JSONModel.h"
#import "FITCategory.h"

@protocol CategoryModel

@end

@interface FITCategoryModel : JSONModel

@property (nonatomic, strong) FITCategory *category;

@end
