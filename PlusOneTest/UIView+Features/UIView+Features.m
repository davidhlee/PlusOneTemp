//
//  UIView+Features.m
//  RouteCheck
//
//  Created by David Lee on 8/13/15.
//  Copyright (c) 2015 David Holland Lee. All rights reserved.
//

#import "UIView+Features.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Features)

- (CALayer *)prefix_addUpperBorder:(UIRectEdge)edge color:(UIColor *)color thickness:(CGFloat)thickness {
    CALayer *border = [CALayer layer];
    
    switch (edge) {
        case UIRectEdgeTop:
            border.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), thickness);
            break;
        case UIRectEdgeBottom:
            border.frame = CGRectMake(0, CGRectGetHeight(self.frame) - thickness, CGRectGetWidth(self.frame), thickness);
            break;
        case UIRectEdgeLeft:
            border.frame = CGRectMake(0, 0, thickness, CGRectGetHeight(self.frame));
            break;
        case UIRectEdgeRight:
            border.frame = CGRectMake(CGRectGetWidth(self.frame) - thickness, 0, thickness, CGRectGetHeight(self.frame));
            break;
        default:
            break;
    }
    
    border.backgroundColor = color.CGColor;
    
    [self.layer addSublayer:border];
    
    return border;
}

@end
