//
//  MasterViewController.m
//  To Key
//
//  Created by Felipe Rios on 29/03/12.
//  Copyright (c) 1997 - 2012. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "PasswordViewController.h"

@implementation MasterViewController
@synthesize ArrOptions, DicOptions, UITableV, detailViewController, passwordViewController;

- (IBAction)More:(id)sender {
    UIActionSheet *As = [[UIActionSheet alloc] initWithTitle: @"More and Info" delegate: self cancelButtonTitle: nil destructiveButtonTitle: nil otherButtonTitles: @"More Apps", @"About This App", nil];
    [As setActionSheetStyle: UIActionSheetStyleBlackTranslucent];
    [As showInView: self.view];
    [As release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        // MY APPLE ITUNES CHANNEL
    } else if (buttonIndex == 1) {
        UIAlertView *AV = [[UIAlertView alloc] initWithTitle: @"Info (About)" message: @"To Key Generator v1.0 \n\nCreated By: Felipe Rios \nCopyright © 1997 - 2012, \nAll Rights Reserved. \n\n*Twitter: @FDeveloping" delegate: self cancelButtonTitle: @"OK" otherButtonTitles: nil];
        [AV show];
        [AV release];
    }
}

#pragma mark TableView Delegate and DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [ArrOptions count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *Key = [ArrOptions objectAtIndex: section];
    NSArray *Resume = [DicOptions objectForKey: Key];
    return [Resume count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    NSString *Key = [ArrOptions objectAtIndex: indexPath.section];
    NSArray *Resume = [DicOptions objectForKey: Key];
    cell.textLabel.text = [[Resume objectAtIndex: indexPath.row] objectForKey: @"name"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image = [UIImage imageNamed: [[Resume objectAtIndex: indexPath.row] objectForKey: @"icon"]];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	NSString *Key = [ArrOptions objectAtIndex: section];
    return Key;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
	if(section == 0){
		return @"Crack-mes Projects";
	}else{
		return @"Password Programs";
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 30.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0)
        return [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"Title Header 01.png"]];
    else
        return [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"Title Header 02.png"]];
}
 
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 0)
        return [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"Footer 01.png"]];
    else
        return [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"Footer 02.png"]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *Key = [ArrOptions objectAtIndex: indexPath.section];
    NSArray *Resume = [DicOptions objectForKey: Key];
    if (indexPath.section == 0) {
        if (!self.detailViewController) {
            self.detailViewController = [[[DetailViewController alloc] initWithNibName: @"DetailViewController" bundle: nil] autorelease];
        }
        detailViewController.title = [[Resume objectAtIndex: indexPath.row] objectForKey: @"name"];
        detailViewController.UITextViewInfo.text = [[Resume objectAtIndex: indexPath.row] objectForKey: @"info"];
        detailViewController.UITextViewIn.text = @"";
        detailViewController.UITextViewOu.text = @"";
        [self.navigationController pushViewController: self.detailViewController animated: YES];
        detailViewController.UITextViewInfo.text = [[Resume objectAtIndex: indexPath.row] objectForKey: @"info"];
        [tableView deselectRowAtIndexPath: indexPath animated: YES];
    } else {
        if (!self.passwordViewController) {
            self.passwordViewController = [[[PasswordViewController alloc] initWithNibName: @"PasswordViewController" bundle: nil] autorelease];
        }
        passwordViewController.title = [[Resume objectAtIndex: indexPath.row] objectForKey: @"name"];
        passwordViewController.UISlider1.value = 0;
        passwordViewController.UISlider2.value = 0;
        passwordViewController.UISlider3.value = 0;
        passwordViewController.UISlider4.value = 0;
        passwordViewController.UILabel1.text = @"0";
        passwordViewController.UILabel2.text = @"0";
        passwordViewController.UILabel3.text = @"0";
        passwordViewController.UILabel4.text = @"0";
        passwordViewController.UILabel5.text = @"0";
        passwordViewController.UITextViewOut.text = @"";
        [self.navigationController pushViewController: self.passwordViewController animated: YES];
        passwordViewController.UITextViewInfo.text = [[Resume objectAtIndex: indexPath.row] objectForKey: @"info"];
        [tableView deselectRowAtIndexPath: indexPath animated: YES];
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
    NSString *Path = [[NSBundle mainBundle] pathForResource: @"OptionsList" ofType: @"plist"];
    NSDictionary *Dic = [[NSDictionary alloc] initWithContentsOfFile: Path];
    self.DicOptions = Dic;
    [Dic release];
    NSArray *Resume = [[DicOptions allKeys] sortedArrayUsingSelector: @selector(compare:)];
    self.ArrOptions = Resume;
    UITableV.backgroundColor = [UIColor clearColor];
}

- (void)viewDidUnload
{
    self.ArrOptions = nil;
    self.DicOptions = nil;
    self.UITableV = nil;
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
    [ArrOptions release];
    [DicOptions release];
    [UITableV release];
    [detailViewController release];
    [passwordViewController release];
    [super dealloc];
}

@end
