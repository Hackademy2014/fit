//
//  FITGivingModel.h
//  Placeholder
//
//  Created by Anthony Urena on 5/17/14.
//  Copyright (c) 2014 Families In Transition. All rights reserved.
//

#import "JSONModel.h"
#import "FITCategoryModel.h"

@interface FITGivingModel : JSONModel <UITableViewDataSource>

@property (nonatomic, strong) NSArray<CategoryModel> *categories;

@end
