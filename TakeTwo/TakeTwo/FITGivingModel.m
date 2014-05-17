//
//  FITGivingModel.m
//  Placeholder
//
//  Created by Anthony Urena on 5/17/14.
//  Copyright (c) 2014 Families In Transition. All rights reserved.
//

#import "FITGivingModel.h"

@implementation FITGivingModel

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell alloc];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categories.count;
}

@end
