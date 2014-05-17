//
//  FITDonationItemModel.h
//  TakeTwo
//
//  Created by Anthony Urena on 5/17/14.
//  Copyright (c) 2014 Families In Transition. All rights reserved.
//

#import "JSONModel.h"

@protocol DonationItem

@end

@interface FITDonationItemModel : JSONModel

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *description;


@end
