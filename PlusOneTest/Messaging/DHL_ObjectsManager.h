//
//  DHL_ObjectsManager.h
//  PlusOneTest
//
//  Created by David Lee on 10/24/15.
//  Copyright © 2015 David Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHL_ObjectsManager : NSObject

// Objects:
@property (nonatomic, strong) NSMutableArray *objects;

// Methods:
- (void)setInitialMessages;

@end
