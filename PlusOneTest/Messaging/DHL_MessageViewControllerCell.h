//
//  DHL_MessageViewControllerCell.h
//  PlusOneTest
//
//  Created by David Lee on 10/24/15.
//  Copyright © 2015 David Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel_Padding.h"

@interface DHL_MessageViewControllerCell : UITableViewCell

@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) IBOutlet UILabel_Padding *textLabel;
@property (nonatomic, strong) IBOutlet UIView *textLabelContainer;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint *textLabelLeft;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint *textLabelHeight;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint *textLabelWidth;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint *textLabelRight;

- (void)configureCellWithObject:(NSDictionary *)object;

@end
