//
//  DetailViewController.h
//  To Key
//
//  Created by Felipe Rios on 29/03/12.
//  Copyright (c) 1997 - 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController {
    UITextView *UITextViewIn;
    UITextView *UITextViewOu;
    UITextView *UITextViewInfo;
}

@property (nonatomic, retain) IBOutlet UITextView *UITextViewIn;
@property (nonatomic, retain) IBOutlet UITextView *UITextViewOu;
@property (nonatomic, retain) IBOutlet UITextView *UITextViewInfo;

- (NSString *)Boonz:(NSString *)stringIn;
- (NSString *)Mucki:(NSString *)stringIn;
- (NSString *)EvilCode:(NSString *)stringIn;
- (NSString *)GhostKeyGen:(NSString *)stringIn;

@end
