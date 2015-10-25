//
//  DHL_MessageViewControllerCell.m
//  PlusOneTest
//
//  Created by David Lee on 10/24/15.
//  Copyright © 2015 David Lee. All rights reserved.
//

#import "DHL_MessageViewControllerCell.h"

@implementation DHL_MessageViewControllerCell

- (void)layoutSubviews {
//    self.textView.layer.borderColor = [[UIColor colorWithRed:200/255.0f green:200/255.0f blue:200/255.0f alpha:1.0f] CGColor];
//    self.textView.layer.borderWidth = 1.0f;
//    self.textView.layer.cornerRadius = 4.0f;
//    self.textView.layer.masksToBounds = YES;

//    [super layoutSubviews];

    
    self.textLabel.preferredMaxLayoutWidth = self.textLabel.frame.size.width;
    //self.textLabel.preferredMaxLayoutWidth = size.width;
//    [self layoutIfNeeded];
}

- (void)awakeFromNib {
    // Initialization code

    
}

- (void)configureCellWithObject:(NSDictionary *)object {
    self.textLabel.text = object[@"message"];
    
    self.textLabelContainer.layer.cornerRadius = 4.0f;
    self.textLabelContainer.layer.masksToBounds = YES;
    self.textLabelContainer.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
