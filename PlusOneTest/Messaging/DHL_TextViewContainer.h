//
//  DHL_TextViewContainer.h
//  PlusOneTest
//
//  Created by David Lee on 10/24/15.
//  Copyright © 2015 David Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DHL_TextViewContainerDelegate <NSObject>
@optional
- (void)createMessage:(NSDictionary *)message;
@end

@interface DHL_TextViewContainer : UIView

@property (nonatomic, weak) id<DHL_TextViewContainerDelegate> delegate;

@property (nonatomic, strong) IBOutlet UITextView *textView;

@end