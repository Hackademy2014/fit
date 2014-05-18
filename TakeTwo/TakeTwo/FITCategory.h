//
//  FITCategoryModel.h
//  Placeholder
//
//  Created by Anthony Urena on 5/17/14.
//  Copyright (c) 2014 Families In Transition. All rights reserved.
//

#import "FITDonationItemModel.h"

@protocol Category
@end

@interface FITCategory : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *donationItems;

@end
