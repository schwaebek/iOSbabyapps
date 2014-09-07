//
//  FHAViewController.m
//  First Homework App
//
//  Created by Katlyn Schwaebe on 7/21/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "FHAViewController.h"

@interface FHAViewController ()

@end

@implementation FHAViewController

/* Syntax for an if  / else condition looks like this

    // You have an object (variable named myName) of the class NSString
    NSString* myName = @"Katlyn";
    
    if ([myName isEqualToString:@""])
    {
        
    }
*/

- (IBAction)loginButton:(id)sender {
    NSString * username = self.usernameTextField.text;
    
    NSString * password = self.passwordTextField.text;
    
    //If you wanted a variable storing your name .... NSString* myName = @"Katlyn"
    
    // Most specific condition
    // Check if my username AND password variables BOTH contain an empty string value .... @""
    
    if ([username isEqualToString:@""]&&[password isEqualToString:@""])
    {

        UIAlertView * noUsernameOrPassword = [[UIAlertView alloc] initWithTitle: @"Failed Login" message:@"Missing Username and Password" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [noUsernameOrPassword show];
    }
    
    // Else if your username contains an empty string value, then display this message
    else if ([username isEqualToString:@""])
    {
    UIAlertView * noUsernameAlert = [[UIAlertView alloc] initWithTitle: @"Failed Login" message:@"Missing Username" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [noUsernameAlert show];
    }
    
    // Else if your password contains an empty string value, then display this message
    else if ([password isEqualToString:@""])
    {
        UIAlertView * noPasswordAlert = [[UIAlertView alloc] initWithTitle: @"Failed Login" message:@"Missing Password" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [noPasswordAlert show];
    }
   
}
- (IBAction)redButton:(id)sender {self.view.backgroundColor =  [UIColor redColor];
}

- (IBAction)resetButton:(id)sender {
    self.usernameTextField.text = @"";
    self.passwordTextField.text = @"";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)purpleButton:(id)sender {
    self.view.backgroundColor =  [UIColor purpleColor];
}

- (IBAction)blueButton:(id)sender {
    self.view.backgroundColor =  [UIColor blueColor];
}





@end
