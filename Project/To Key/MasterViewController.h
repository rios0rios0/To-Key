//
//  MasterViewController.h
//  To Key
//
//  Created by Felipe Rios on 29/03/12.
//  Copyright (c) 1997 - 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "PasswordViewController.h"

@interface MasterViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate> {
    NSArray *ArrOptions;
    NSDictionary *DicOptions;
    UITableView *UITableV;
    DetailViewController *detailViewController;
    PasswordViewController *passwordViewController;
}

@property (nonatomic, retain) NSArray *ArrOptions;
@property (nonatomic, retain) NSDictionary *DicOptions;
@property (nonatomic, retain) IBOutlet UITableView *UITableV;
@property (nonatomic, retain) DetailViewController *detailViewController;
@property (nonatomic, retain) PasswordViewController *passwordViewController;

- (IBAction)More:(id)sender;

@end
