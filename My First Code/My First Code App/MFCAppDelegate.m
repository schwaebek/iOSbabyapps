//
//  MFCAppDelegate.m
//  My First Code App
//
//  Created by Katlyn Schwaebe on 7/22/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "MFCAppDelegate.h"
#import "MFCRootViewController.h"

@implementation MFCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    
    MFCRootViewController * rootViewController = [[MFCRootViewController alloc] init];
    
    //rootViewController.view.backgroundColor = [UIColor redColor]
    
    self.window.rootViewController = rootViewController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
    
    //code will not work here
}

@end
