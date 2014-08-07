//
//  REVAppDelegate.m
//  Revision
//
//  Created by Katlyn Schwaebe on 8/7/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "REVAppDelegate.h"

@implementation REVAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UIViewController alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
