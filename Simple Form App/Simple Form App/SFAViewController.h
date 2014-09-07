//
//  SFAViewController.h
//  Simple Form App
//
//  Created by Katlyn Schwaebe on 7/21/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFAViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)loginButtonClicked:(id)sender;

@end
