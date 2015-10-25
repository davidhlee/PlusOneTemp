//
//  DHL_TextViewContainer.m
//  PlusOneTest
//
//  Created by David Lee on 10/24/15.
//  Copyright © 2015 David Lee. All rights reserved.
//

#import "DHL_TextViewContainer.h"
#import "UIView+Features.h"

@implementation DHL_TextViewContainer

- (void)layoutSubviews {
    // UI Styling:
    [self prefix_addUpperBorder:UIRectEdgeTop color:[UIColor colorWithRed:200/255.0f green:200/255.0f blue:200/255.0f alpha:1.0f] thickness:1.0f];
    
    self.textView.layer.borderColor = [[UIColor colorWithRed:200/255.0f green:200/255.0f blue:200/255.0f alpha:1.0f] CGColor];
    self.textView.layer.borderWidth = 1.0f;
    self.textView.layer.cornerRadius = 4.0f;
    self.textView.layer.masksToBounds = YES;
}

@end
