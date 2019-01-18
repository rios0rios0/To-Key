//
//  PasswordViewController.m
//  To Key
//
//  Created by Felipe Rios on 29/03/12.
//  Copyright (c) 1997 - 2012. All rights reserved.
//

#import "PasswordViewController.h"

#define ALPHA_T @"abcdefghijklmnopqrstuvwxyz"
#define ALPHA_C @"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
#define NUMERIC @"1234567890"
#define SPECIAL @"!@#$%¨&*()~´ª[]º~^;:/*-+.,'<>¿?_"

@implementation PasswordViewController
@synthesize UILabel1, UILabel2, UILabel3, UILabel4, UILabel5, UISlider1, UISlider2, UISlider3, UISlider4, UITextViewOut, UITextViewInfo;

- (NSString *)Randomize:(NSString *)cons length:(int)leng {
    NSMutableString *stringOut = [[NSMutableString alloc] initWithCapacity: leng];
    for (int i = 0; i < leng; i++) {
        [stringOut appendFormat: @"%c", [cons characterAtIndex: rand() % [cons length]]];
    }
    return stringOut;
    [stringOut release];
}

- (float)All:(float)subtract {
    return ((UISlider1.value + UISlider2.value + UISlider3.value + UISlider4.value) - subtract);
}

- (IBAction)ChangeSlider:(UISlider *)sender {
    if (sender == UISlider1) {
        if ([UILabel5.text integerValue] <= 20) {
            UILabel1.text = [NSString stringWithFormat: @"%0.f", sender.value];
            UILabel5.text = [NSString stringWithFormat: @"%0.f", [self All: 0]];
        } else {
            sender.value = 20 - ([self All: sender.value]);
            UILabel1.text = [NSString stringWithFormat: @"%0.f", sender.value];
            UILabel5.text = [NSString stringWithFormat: @"%0.f", [self All: 0]];
        }
    } else if (sender == UISlider2) {
        if ([UILabel5.text integerValue] <= 20) {
            UILabel2.text = [NSString stringWithFormat: @"%0.f", sender.value];
            UILabel5.text = [NSString stringWithFormat: @"%0.f", [self All: 0]];
        } else {
            sender.value = 20 - ([self All: sender.value]);
            UILabel2.text = [NSString stringWithFormat: @"%0.f", sender.value];
            UILabel5.text = [NSString stringWithFormat: @"%0.f", [self All: 0]];
        }
    } else if (sender == UISlider3) {
        if ([UILabel5.text integerValue] <= 20) {
            UILabel3.text = [NSString stringWithFormat: @"%0.f", sender.value];
            UILabel5.text = [NSString stringWithFormat: @"%0.f", [self All: 0]];
        } else {
            sender.value = 20 - ([self All: sender.value]);
            UILabel3.text = [NSString stringWithFormat: @"%0.f", sender.value];
            UILabel5.text = [NSString stringWithFormat: @"%0.f", [self All: 0]];
        }
    } else if (sender == UISlider4) {
        if ([UILabel5.text integerValue] <= 20) {
            UILabel4.text = [NSString stringWithFormat: @"%0.f", sender.value];
            UILabel5.text = [NSString stringWithFormat: @"%0.f", [self All: 0]];
        } else {
            sender.value = 20 - ([self All: sender.value]);
            UILabel4.text = [NSString stringWithFormat: @"%0.f", sender.value];
            UILabel5.text = [NSString stringWithFormat: @"%0.f", [self All: 0]];
        }
    }
}

- (IBAction)Process:(id)sender {
    if (([UILabel5.text integerValue] > 20) || ([UILabel5.text integerValue] <= 0)) {
        UITextViewOut.text = @"Number must be 0 - 20";
        return;
    }
    UITextViewOut.text = @"";
    NSMutableString *stringOut = [[NSMutableString alloc] init];
    if (UISlider1.value > 0) {
        [stringOut appendFormat: @"%@", [self Randomize: ALPHA_T length: UISlider1.value]];
    }
    if (UISlider2.value > 0) {
        [stringOut appendFormat: @"%@", [self Randomize: ALPHA_C length: UISlider2.value]];
    }
    if (UISlider3.value > 0) {
        [stringOut appendFormat: @"%@", [self Randomize: NUMERIC length: UISlider3.value]];
    }
    if (UISlider4.value > 0) {
        [stringOut appendFormat: @"%@", [self Randomize: SPECIAL length: UISlider4.value]];
    }
    for (int i = 0; i < 15; i++) {
        UITextViewOut.text = [UITextViewOut.text stringByAppendingFormat: @"%@\n", [self Randomize: stringOut length: (UISlider1.value + UISlider2.value + UISlider3.value + UISlider4.value)]];
    }
    [stringOut release];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UISlider1.transform = CGAffineTransformRotate(UISlider1.transform, 270.0/180 * M_PI);
    UISlider2.transform = CGAffineTransformRotate(UISlider2.transform, 270.0/180 * M_PI);
    UISlider3.transform = CGAffineTransformRotate(UISlider3.transform, 270.0/180 * M_PI);
    UISlider4.transform = CGAffineTransformRotate(UISlider4.transform, 270.0/180 * M_PI);
}

- (void)viewDidUnload
{
    self.UILabel1 =nil;
    self.UILabel2 =nil;
    self.UILabel3 =nil;
    self.UILabel4 =nil;
    self.UILabel5 =nil;
    self.UISlider1 = nil;
    self.UISlider2 = nil;
    self.UISlider3 = nil;
    self.UISlider4 = nil;
    self.UITextViewOut = nil;
    self.UITextViewInfo = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc
{
    [UILabel1 release];
    [UILabel2 release];
    [UILabel3 release];
    [UILabel4 release];
    [UILabel5 release];
    [UISlider1 release];
    [UISlider2 release];
    [UISlider3 release];
    [UISlider4 release];
    [UITextViewOut release];
    [UITextViewInfo release];
    [super dealloc];
}

@end
