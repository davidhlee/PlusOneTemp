//
//  UILabel_Padding.m
//  PlusOneTest
//
//  Created by David Lee on 10/24/15.
//  Copyright © 2015 David Lee. All rights reserved.
//

#import "UILabel_Padding.h"

@implementation UILabel_Padding

- (void)drawTextInRect:(CGRect)uiLabelRect {
    UIEdgeInsets myLabelInsets = {6, 10, 6, 10};
    [super drawTextInRect:UIEdgeInsetsInsetRect(uiLabelRect, myLabelInsets)];
}

@end
