//
//  PasswordViewController.h
//  To Key
//
//  Created by Felipe Rios on 29/03/12.
//  Copyright (c) 1997 - 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PasswordViewController : UIViewController {
    UILabel *UILabel1;
    UILabel *UILabel2;
    UILabel *UILabel3;
    UILabel *UILabel4;
    UILabel *UILabel5;
    UISlider *UISlider1;
    UISlider *UISlider2;
    UISlider *UISlider3;
    UISlider *UISlider4;
    UITextView *UITextViewOut;
    UITextView *UITextViewInfo;
}

@property (nonatomic, retain) IBOutlet UILabel *UILabel1;
@property (nonatomic, retain) IBOutlet UILabel *UILabel2;
@property (nonatomic, retain) IBOutlet UILabel *UILabel3;
@property (nonatomic, retain) IBOutlet UILabel *UILabel4;
@property (nonatomic, retain) IBOutlet UILabel *UILabel5;
@property (nonatomic, retain) IBOutlet UISlider *UISlider1;
@property (nonatomic, retain) IBOutlet UISlider *UISlider2;
@property (nonatomic, retain) IBOutlet UISlider *UISlider3;
@property (nonatomic, retain) IBOutlet UISlider *UISlider4;
@property (nonatomic, retain) IBOutlet UITextView *UITextViewOut;
@property (nonatomic, retain) IBOutlet UITextView *UITextViewInfo;

- (IBAction)Process:(id)sender;
- (IBAction)ChangeSlider:(UISlider *)sender;
- (NSString *)Randomize:(NSString *)cons length:(int)leng;

@end
