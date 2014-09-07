//
//  SIGRootViewController.m
//  Signatures
//
//  Created by Katlyn Schwaebe on 8/13/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "SIGRootViewController.h"
#import "SIGDrawView.h"
#import "SIGListTableViewController.h"
#import "SIGDrawViewController.h"

@interface SIGRootViewController ()

@end

@implementation SIGRootViewController
{
    
UIImageView * imageView;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        SIGListTableViewController * listTVC = [[SIGListTableViewController alloc] init];
        listTVC.tableView.frame = CGRectMake(0, 200, 320, 400);
        [self.view addSubview:listTVC.tableView];
        
        // Custom initialization
        
        SIGDrawView * drawView = [[SIGDrawView alloc]init];
        drawView.frame = CGRectMake(0, 0, 320, 200);
        [self.view addSubview: drawView];

//        SIGDrawViewController * drawVC = [[SIGDrawViewController alloc] init];
//        [drawVC.view addSubview:drawView];
//        [self.view addSubview:drawVC.view];
        
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-355)];
    imageView.image = [UIImage imageNamed:@"brackets-1"];
    [self.view addSubview:imageView];
    // Do any additional setup after loading the view.
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
-(BOOL) prefersStatusBarHidden
{
    return YES;
}

@end
