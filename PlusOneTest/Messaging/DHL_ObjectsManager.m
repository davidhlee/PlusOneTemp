//
//  DHL_ObjectsManager.m
//  PlusOneTest
//
//  Created by David Lee on 10/24/15.
//  Copyright © 2015 David Lee. All rights reserved.
//

#import "DHL_ObjectsManager.h"

@implementation DHL_ObjectsManager

- (id)init {
    self = [super init];
    if (self) {
        [self setInitialMessages];
    }
    return self;
}

- (void)setInitialMessages {
    self.objects = [[NSMutableArray alloc] initWithArray:@[
                                                           @{@"message": @"oh howdy", @"fromUser": @"me"},
                                                           @{@"message": @"fantasy basketball starts tonight! Paul george at the 4, gonna be big", @"fromUser": @"other"},
                                                           @{@"message": @"ty lawson: most affordable high-output pg", @"fromUser": @"me"},
                                                           @{@"message": @"lets goooooo", @"fromUser": @"other"}]];
}

@end
