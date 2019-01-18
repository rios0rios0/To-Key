//
//  AppDelegate.m
//  To Key
//
//  Created by Felipe Rios on 29/03/12.
//  Copyright (c) 1997 - 2012. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize window, navigationController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window addSubview: navigationController.view]; 
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[window release];
    [navigationController release];
	[super dealloc];
}

@end
