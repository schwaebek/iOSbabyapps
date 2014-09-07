//
//  SFAViewController.m
//  Simple Form App
//
//  Created by Katlyn Schwaebe on 7/21/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "SFAViewController.h"

@interface SFAViewController ()

@end

@implementation SFAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    // do something here
}

- (IBAction)loginButtonClicked:(id)sender
{
    // get username text
    NSString * username = self.usernameTextField.text;
    
    
    // get password text
    NSString * password = self.passwordTextField.text;
    
    NSLog(@"username is %@ and password is %@",username,password);
    
    // check if fields are empty
    
    if (0 == 1)
    {
        //false
    }
    if ([self.usernameTextField.text isEqualToString:@""])
    {
        // warn empty string
        
        UIAlertView * noUsernameAlert = [[UIAlertView alloc]initWithTitle: @"Failed Login" message:@"Please put a username next time you try to login" delegate:self cancelButtonTitle:@"Whatever" otherButtonTitles:nil];
                                                                                                                                                                                         
        [noUsernameAlert show];
        
        NSLog(@"username is empty... tell user to fill in");
        
    } else {
        
        // thank you for submitting your username
    }
        
    
    // try login submission success
    
    // TIY:NOTE
    
    
}
@end
