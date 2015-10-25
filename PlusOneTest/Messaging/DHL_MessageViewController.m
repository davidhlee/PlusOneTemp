//
//  DHL_MessageViewController.m
//  PlusOneTest
//
//  Created by David Lee on 10/24/15.
//  Copyright © 2015 David Lee. All rights reserved.
//

#import "DHL_MessageViewController.h"
#import "DHL_MessageViewControllerCell.h"

@interface DHL_MessageViewController ()

@end

@implementation DHL_MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.objectsManager = [[DHL_ObjectsManager alloc] init];
    self.cellIdentifier = @"DHL_MessageViewControllerCell";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowOrHide:) name:UIKeyboardWillShowNotification object:nil];
    
    // Dynamic tableViewCell height:
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0; // set to whatever your "average" cell height is
    
    // Add a RefreshControl:
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(resetViewController:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
    self.textViewContainer.delegate = self;
    
    [self resetViewController:nil];
}

- (void)resetViewController:(UIRefreshControl *)refreshControl {
    [self.objectsManager setInitialMessages];
    [self.textView resignFirstResponder];
    self.textViewContainerBottom.constant = 0;
    
    [self.tableView  performSelectorOnMainThread:@selector(reloadData)
                                           withObject:nil
                                        waitUntilDone:NO];
    
    [refreshControl  performSelectorOnMainThread:@selector(endRefreshing)
                                      withObject:nil
                                   waitUntilDone:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma DHL_MessageViewController methods
- (void)reScrollTableViewWithMessage:(NSDictionary *)message {
    
    [self.tableView beginUpdates];
    [self.objectsManager.objects insertObject:message atIndex:self.objectsManager.objects.count];
    
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:(self.objectsManager.objects.count - 1) inSection:0]]
                          withRowAnimation:UITableViewRowAnimationTop];
    [self.tableView endUpdates];
    
    // Scroll tableView to bottom:
    [self scrollKeyboardToBottom];
    
    // Reset the textView size:
    self.textView.text = @"";
    CGSize textViewSize = self.textView.contentSize;
    [self.textViewHeight setConstant:textViewSize.height];
}

- (void)scrollKeyboardToBottom {
    // Scroll tableView to bottom:
    if (self.tableView.contentOffset.y < (self.tableView.contentSize.height - self.tableView.frame.size.height)) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(self.objectsManager.objects.count - 1) inSection:0];
        [self.tableView scrollToRowAtIndexPath:indexPath
                              atScrollPosition:UITableViewScrollPositionTop
                                      animated:YES];
    }
}

- (IBAction)presentAddPhoto:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:nil];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objectsManager.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DHL_MessageViewControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *message = [self.objectsManager.objects objectAtIndex:indexPath.row];
    [cell configureCellWithObject:message];
    
    // Dynamically size cell:
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:17.0f]};
    CGRect rect = [message[@"message"] boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 100.0f, CGFLOAT_MAX)
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                 attributes:attributes
                                                    context:nil];
    CGSize size = rect.size;
    cell.textLabelHeight.constant = size.height + 1.0f + 20.0f;
    cell.textLabelWidth.constant = size.width + 1.0f + 20.0f;

    if ([message[@"fromUser"] isEqualToString:@"me"]) {
        cell.textLabelRight.constant = 10.0f;
        cell.textLabelLeft.constant = (self.view.frame.size.width  - cell.textLabelWidth.constant) - 20.0f;
    } else {
        cell.textLabelLeft.constant = 10.0f;
        cell.textLabelRight.constant = (self.view.frame.size.width - cell.textLabelWidth.constant) - 20.0f;
    }
    
    // Apply Gradient
    if (!cell.gradientLayer) {
        [cell.textLabelContainer setBackgroundColor:[UIColor clearColor]];
        cell.gradientLayer = [CAGradientLayer layer];
    }
    
    cell.gradientLayer.frame = CGRectMake(0.0f, 0.0f, cell.textLabelWidth.constant, cell.textLabelHeight.constant);
    cell.gradientLayer.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:79/255.0f green:190/255.0f blue:246/255.0f alpha:1.0f]CGColor], (id)[[UIColor colorWithRed:4/255.0f green:122/255.0f blue:254/255.0f alpha:1.0f]CGColor], nil];
    cell.gradientLayer.cornerRadius = 4.0f;
    cell.gradientLayer.masksToBounds = YES;
    [cell.textLabelContainer.layer insertSublayer:cell.gradientLayer atIndex:0];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.0f;
}

#pragma UITextViewDelegate methods
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (textView.contentSize.height > self.textViewHeight.constant && textView.contentSize.height < 200.0f) {
        CGSize textViewSize = textView.contentSize;
        [self.textViewHeight setConstant:textViewSize.height];
    }
    
    // Scroll tableView to bottom:
    [self scrollKeyboardToBottom];
    
    return YES;
}

- (void)keyboardWillShowOrHide:(NSNotification *)notification {
    CGRect endingFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    self.textViewContainerBottom.constant = endingFrame.size.height;
    
    // Animate the view with the keyboard:
    void (^animations)() = ^void() {
        [self scrollKeyboardToBottom];
    };
    
    [UIView animateWithDuration:[notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]
                          delay:0.0
                        options:([notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue]<<16)|UIViewAnimationOptionLayoutSubviews|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         [self.view layoutIfNeeded];
                         
                         if (animations) {
                             animations();
                         }
                     }
                     completion:nil];
}

- (IBAction)createMessage:(id)sender {
    NSDictionary *newMessage;
//    if (self.textView.attributedText) {
//        newMessage = @{@"message": self.textView.attributedText, @"fromUser": @"me"};
//    } else {
        newMessage = @{@"message": self.textView.text, @"fromUser": @"me"};
//    }

    [self reScrollTableViewWithMessage:newMessage];
}

#pragma mark UIImagePickerControllerDelegate delegate
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{

    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(__bridge NSString *)kUTTypeImage]){
        /* Let's get the metadata. This is only for images. Not videos */
        
        UIImage *newImage = nil;
        if ([picker allowsEditing]){
            newImage = [info objectForKey:UIImagePickerControllerEditedImage];
        } else {
            newImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        }
        
        if (newImage) {
            // Resize the image:
            CGRect rect = CGRectMake(0,0,75,75);
            UIGraphicsBeginImageContext( rect.size );
            [newImage drawInRect:rect];
            UIImage *picture1 = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            NSData *imageData = UIImagePNGRepresentation(picture1);
            UIImage *resizedImage=[UIImage imageWithData:imageData];
            
            NSTextAttachment* onionatt = [NSTextAttachment new];
            onionatt.image = resizedImage;
            onionatt.bounds = CGRectMake(0,-5,resizedImage.size.width,resizedImage.size.height);
            NSAttributedString* onionattchar = [NSAttributedString attributedStringWithAttachment:onionatt];
            
            NSMutableAttributedString *attrString;
            if (self.textView.attributedText) {
                attrString = [self.textView.attributedText mutableCopy];
            } else {
                attrString = [[NSMutableAttributedString alloc] initWithString:self.textView.text];
            }
            [attrString insertAttributedString:onionattchar atIndex:attrString.string.length];
            
            self.textView.attributedText = attrString;
            
            CGSize textViewSize = self.textView.contentSize;
            [self.textViewHeight setConstant:textViewSize.height];
        }
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSLog(@"Picker was cancelled");
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
