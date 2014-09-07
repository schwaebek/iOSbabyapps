//
//  MFCRootViewController.m
//  My First Code App
//
//  Created by Katlyn Schwaebe on 7/22/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "MFCRootViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface MFCRootViewController () <UITextFieldDelegate>

//declare private properties and methods

//@property (nonatomic) UILabel * someLabel;


@end

@implementation MFCRootViewController
{
    UILabel * someLabel;
    UITextField * usernameField;
    UITextField * passwordField;
    UITextField * emailField;
    UITextField * phoneField;
    
    AVAudioPlayer * audioPlayer;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        NSLog(@"init");
        
        self.view.backgroundColor = [UIColor colorWithRed:0.004f green:0.549f blue:0.722f alpha:1.0f];
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    int screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    UIButton * resetButton = [[UIButton alloc] initWithFrame: CGRectMake(10.0, 450.0, screenWidth - 20.0, 50.0)];
    [resetButton setTitle:@"RESET" forState:UIControlStateNormal];
    resetButton.backgroundColor = [UIColor colorWithRed:0.239f green:0.239f blue:0.239f alpha:1.0f];
    
    resetButton.layer.cornerRadius = 10.0;
    
    [resetButton addTarget:self action:@selector(resetButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:resetButton];
    
    UIButton * greenButton = [[UIButton alloc] initWithFrame:CGRectMake(10.0, 280.0,  50.0, 50.0)];
    [greenButton setTitle:@"" forState:UIControlStateNormal];
    greenButton.backgroundColor = [UIColor colorWithRed:0.243f green:0.973f blue:0.329f alpha:1.0f];
    
    greenButton.layer.cornerRadius = 25.0;
    
    [greenButton addTarget:self action:@selector(greenButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:greenButton];
    
    UIButton * redButton = [[UIButton alloc] initWithFrame:CGRectMake(48.0, 280.0,  120.0, 113.0)];
    [redButton setTitle:@"" forState:UIControlStateNormal];
    //redButton.backgroundColor = [UIColor colorWithRed:0.996f green:0.059f blue:0.259f alpha:1.0f];
    
    //redButton.layer.cornerRadius = 25.0;
    redButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"everythingGuy5"]];
    
    [redButton addTarget:self action:@selector(redButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.view addSubview:redButton];
    
    UIButton * yellowButton = [[UIButton alloc] initWithFrame:CGRectMake(135.0, 280.0,  50.0, 50.0)];
    [yellowButton setTitle:@"" forState:UIControlStateNormal];
    yellowButton.backgroundColor = [UIColor colorWithRed:0.980f green:0.902f blue:0.322f alpha:1.0f];
    
    yellowButton.layer.cornerRadius = 25.0;
    
    [yellowButton addTarget:self action:@selector(yellowButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:yellowButton];
    
    UIButton * orangeButton = [[UIButton alloc] initWithFrame:CGRectMake(200.0, 280.0,  50.0, 50.0)];
    [orangeButton setTitle:@"" forState:UIControlStateNormal];
    orangeButton.backgroundColor = [UIColor colorWithRed:0.996f green:0.337f blue:0.173f alpha:1.0f];
    
    orangeButton.layer.cornerRadius = 25.0;
    
    [orangeButton addTarget:self action:@selector(orangeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:orangeButton];
    
    UIButton * purpleButton = [[UIButton alloc] initWithFrame:CGRectMake(265.0, 280.0,  50.0, 50.0)];
    [purpleButton setTitle:@"" forState:UIControlStateNormal];
    purpleButton.backgroundColor = [UIColor colorWithRed:0.451f green:0.161f blue:0.937f alpha:1.0f];
    
    purpleButton.layer.cornerRadius = 25.0;
    
    [purpleButton addTarget:self action:@selector(purpleButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:purpleButton];
    
    UIButton * loginButton = [[UIButton alloc] initWithFrame:CGRectMake(10.0, screenHeight - 60.0, screenWidth - 20.0, 50.0)];
    [loginButton setTitle:@"LOGIN" forState:UIControlStateNormal];
    loginButton.backgroundColor = [UIColor colorWithRed:0.427f green:0.890f blue:0.988f alpha:1.0f];
    
    loginButton.layer.cornerRadius = 10.0;
    
    [loginButton addTarget:self action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginButton];
    
    usernameField = [[UITextField alloc] initWithFrame: CGRectMake(10.0, 30.0, screenWidth - 20.0, 50.0)];
    
    usernameField.backgroundColor = [UIColor whiteColor];
    
    usernameField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    usernameField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    usernameField.placeholder = @"username";
    
    usernameField.delegate = self;
    
    usernameField.textColor = [UIColor colorWithRed:0.055f green:0.490f blue:0.694f alpha:1.0f];
    
    [self.view addSubview:usernameField];
    
    usernameField.layer.cornerRadius = 10.0;
    
    NSLog(@"view did load");
    
    passwordField = [[UITextField alloc] initWithFrame: CGRectMake(10.0, 90.0, screenWidth - 20.0, 50.0)];
    
    passwordField.backgroundColor = [UIColor whiteColor];
    
    passwordField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    passwordField.placeholder = @"password";
    
    passwordField.delegate = self;
    passwordField.secureTextEntry = YES;
    
    [self.view addSubview:passwordField];
    
    passwordField.layer.cornerRadius = 10.0;
    
    passwordField.textColor = [UIColor colorWithRed:0.055f green:0.490f blue:0.694f alpha:1.0f];
    
    
    
    NSLog(@"view did load");
    
    emailField = [[UITextField alloc] initWithFrame: CGRectMake(10.0, 150.0, screenWidth - 20.0, 50.0)];
    
    emailField.backgroundColor = [UIColor whiteColor];
    
    emailField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    emailField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    emailField.placeholder = @"email";
    
    emailField.delegate = self;
    
    [self.view addSubview:emailField];
    
    emailField.layer.cornerRadius = 10.0;
    
    emailField.textColor = [UIColor colorWithRed:0.055f green:0.490f blue:0.694f alpha:1.0f];
    
    emailField.keyboardType = UIKeyboardTypeEmailAddress;
    
    
    
    NSLog(@"view did load");
    
    phoneField = [[UITextField alloc] initWithFrame: CGRectMake(10.0, 210.0, screenWidth - 20.0, 50.0)];
    
    phoneField.backgroundColor = [UIColor whiteColor];
    
    phoneField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    phoneField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    phoneField.placeholder = @"phone";
    
    phoneField.delegate = self;
    
    [self.view addSubview:phoneField];
    
    phoneField.layer.cornerRadius = 10.0;
    
    phoneField.textColor = [UIColor colorWithRed:0.055f green:0.490f blue:0.694f alpha:1.0f];
    
    phoneField.keyboardType = UIKeyboardTypeNumberPad;
    
    
    NSLog(@"view did load");
    
  
}
- (BOOL)textFieldShouldReturn: (UITextField *)textField

{
    NSLog(@"text field should return");
    [textField resignFirstResponder];
    
    return YES;
}

- (void)loginButtonClicked
{
    if ([usernameField.text isEqualToString: @""])
    if ([emailField.text isEqualToString: @""])
    if ([phoneField.text isEqualToString: @""])
    {
        UIAlertView * noUsernameAlert = [[UIAlertView alloc] initWithTitle: @"Failed Login" message:@"Missing Username, Email, and Phone Number" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [noUsernameAlert show];
    }
    
    if ([usernameField.text isEqualToString:@""])
    if ([passwordField.text isEqualToString:@""])
    if ([phoneField.text isEqualToString:@""])
    {
        UIAlertView * noUsernameAlert = [[UIAlertView alloc] initWithTitle: @"Failed Login" message:@"Missing Username, Password and Phone Number" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    [noUsernameAlert show];
    }
    if ([passwordField.text isEqualToString:@""])
    if ([emailField.text isEqualToString:@""])
    if ([phoneField.text isEqualToString:@""])
    {
        UIAlertView * noUsernameAlert = [[UIAlertView alloc] initWithTitle: @"Failed Login" message:@"Missing Password, Email and Phone Number" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [noUsernameAlert show];
    }
    if ([usernameField.text isEqualToString:@""])
    if ([passwordField.text isEqualToString:@""])
    if ([emailField.text isEqualToString:@""])
    {
        UIAlertView * noUsernameAlert = [[UIAlertView alloc] initWithTitle: @"Failed Login" message:@"Missing Password, Email and Phone Number" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [noUsernameAlert show];
    }
    
    
    NSLog(@"button was clicked");
}

- (void)purpleButtonClicked
{
    NSLog(@"button was clicked");
    self.view.backgroundColor = [UIColor colorWithRed:0.451f green:0.161f blue:0.937f alpha:1.0f];
}
- (void)orangeButtonClicked
{
    NSLog(@"button was clicked");
    self.view.backgroundColor = [UIColor colorWithRed:0.996f green:0.337f blue:0.173f alpha:1.0f];
}
- (void)redButtonClicked
{
    NSLog(@"button was clicked");

    NSString * file = [[NSBundle mainBundle] pathForResource:@"everything2" ofType:@"wav"];
    NSData * fileData = [NSData dataWithContentsOfFile:file];
    audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData error:nil];
    
    [audioPlayer play];

    self.view.backgroundColor = [UIColor colorWithRed:0.996f green:0.059f blue:0.259f alpha:1.0f];
}
- (void)yellowButtonClicked
{
    NSLog(@"button was clicked");
    self.view.backgroundColor = [UIColor colorWithRed:0.980f green:0.902f blue:0.322f alpha:1.0f];
}
- (void)greenButtonClicked
{
    NSLog(@"button was clicked");
    self.view.backgroundColor = [UIColor colorWithRed:0.243f green:0.973f blue:0.329f alpha:1.0f];
}
- (void)resetButtonClicked
{
    NSLog(@"button was clicked");
    self.view.backgroundColor = [UIColor colorWithRed:0.004f green:0.549f blue:0.722f alpha:1.0f];
    usernameField.text = @"";
    passwordField.text = @"";
    emailField.text = @"";
    phoneField.text = @"";
    
}

-(void)dismissKeyboard
{
    
}
- (void)didReceiveMemoryWarning

{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
