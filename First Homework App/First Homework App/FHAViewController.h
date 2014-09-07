//
//  FHAViewController.h
//  First Homework App
//
//  Created by Katlyn Schwaebe on 7/21/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface FHAViewController: UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;



- (IBAction)loginButton:(id)sender;


- (IBAction)resetButton:(id)sender;


- (IBAction)purpleButton:(id)sender;

- (IBAction)blueButton:(id)sender;

- (IBAction)pinkButton:(id)sender;


// 2 textfields (username, password)

// 3 labels (username = username.text, password.text, error = error message empty username empty password or both)

// 2 button (login, reset)

// 3 buttons (no text different background colors, when you tap them, change the view background color to match the button)



@end
