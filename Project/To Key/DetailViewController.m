//
//  DetailViewController.m
//  To Key
//
//  Created by Felipe Rios on 29/03/12.
//  Copyright (c) 1997 - 2012. All rights reserved.
//

#import "DetailViewController.h"

typedef unsigned long DWORD;

@implementation DetailViewController
@synthesize UITextViewIn, UITextViewOu, UITextViewInfo;

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range 
 replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        // Return FALSE so that the final '\n' character doesn't get added
        if ([self.title isEqualToString: @"~EvilCode's Keygen-Me #1"]) {
            UITextViewOu.text = [self EvilCode: UITextViewIn.text];
        } else if ([self.title isEqualToString: @"KeygenMe #1"]) {
            UITextViewOu.text = [self Boonz: UITextViewIn.text];
        } else if ([self.title isEqualToString: @"Ghost Keygen-me"]) {
            UITextViewOu.text = [self GhostKeyGen: UITextViewIn.text];            
        } else if ([self.title isEqualToString: @"Muckis Crackme #2"]) {
            UITextViewOu.text = [self Mucki: UITextViewIn.text];
        }
        return NO;
    }
    // For any other character return TRUE so that the text gets added to the view
    return YES;
}

#pragma mark KeyGen Functions

- (NSString *)Boonz:(NSString *)stringIn {
    if (([stringIn length] >= 4) || ([stringIn length] <= 50)){
        NSMutableString *stringOut = [[NSMutableString alloc] init];
        DWORD Key, Count;
        Key = 0;
        for (Count = 0; Count < [stringIn length]; Count++) {
            int c = [stringIn characterAtIndex: Count];
            Key = Key - c - 25 + 50; //Correção de um Problema com + 50
        }
        [stringOut appendFormat: @"Bon-%X-%X-41720F48", Key, (Key * (Key * Key))];
        return [NSString stringWithString: stringOut];
        [stringOut release];
    } else {
        return @"String must be 4 - 50 chars long!";
    }
}

- (NSString *)EvilCode:(NSString *)stringIn {
    if ([stringIn length] != 0) {
        NSMutableString *stringOut = [[NSMutableString alloc] init];
        DWORD Key1, Key2, Count;
        Key1 = 0;
        for (Count = 0; Count < [stringIn length]; Count++) {
            int c = [stringIn characterAtIndex: Count];
            Key1 = Key1 + (c << 2) + 82;
        }
        Key2 = Key1 * 2748;
        [stringOut appendFormat: @"~Evil-%X-%X-Code%X", Key1, Key2, [stringIn length]];
        return [NSString stringWithString: stringOut];
        [stringOut release];
    } else {
        return @"Empty Input String!";
    }    
}

- (NSString *)GhostKeyGen:(NSString *)stringIn {
    if ([stringIn length] >= 1) {
        NSMutableString *stringOut = [[NSMutableString alloc] init];
        DWORD Key, Count;
        Key = 0;
        for (Count = 0; Count < [stringIn length]; Count++) {
            int c = [stringIn characterAtIndex: Count];
            Key = ((Key + c) ^ 10) + 2;
        }
        [stringOut appendFormat: @"C%d", Key];
        return [NSString stringWithString: stringOut];
        [stringOut release];
    } else {
        return @"Empty Input String!";
    }
}

- (NSString *)Mucki:(NSString *)stringIn {
    if ([stringIn length] != 0) {
        NSMutableString *stringOut = [[NSMutableString alloc] init];
        DWORD Key1, Key2, Count;
        Key1 = 0;
        for (Count = 0; Count < [stringIn length]; Count++) {
            int c = [stringIn characterAtIndex: Count];
            Key1 = Key1 + ((((c << 4) ^ (c >> 5)) + 38) ^ Key1);
        }
        Key2 = (789999 - Key1) * (789999 - Key1);
        [stringOut appendFormat: @"CM2-%X-%X", Key1, Key2];
        return [[NSString stringWithString: stringOut] uppercaseString];
        [stringOut release];
    } else {
        return @"Empty Input String!";
    }
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
}

- (void)viewDidUnload
{
    self.UITextViewIn = nil;
    self.UITextViewOu = nil;
    self.UITextViewInfo = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc 
{
    [UITextViewIn release];
    [UITextViewOu release];
    [UITextViewInfo release];
    [super dealloc];
}

@end
