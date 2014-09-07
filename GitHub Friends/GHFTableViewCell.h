//
//  GHFTableViewCell.h
//  GitHub Friends
//
//  Created by Katlyn Schwaebe on 7/24/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GHFTableViewCell : UITableViewCell

@property (nonatomic) NSDictionary * friendInfo;

@property (nonatomic) UINavigationController * navigationController;


/*
Everything in a header file is PUBLIC (aka visible to all other classes).
 If you declare a property in this .h file, then all classes will know about that property
 and will be able to access it.
 
 If you declare a property only in the .m file (e.g. UITableViewCell.m), then ONLY the class who owns it (UITableViewCell)
 can access that property. No other class types (e.g. GitHubWebRequest.m) can access it.
 
 Therefore properties in the .h file are PUBLIC (visible to everyone)
 and properties in the .m file are PRIVATE (only visible to the class instane who owns it)
 
 
 And the same thing applies to methods.
 Any methods defined in the .h are PUBLIC and can be called by anyone.
 Any methods define in the .m file are PRIVATE and can only be called by the class who defines it.
 
 */



@end
