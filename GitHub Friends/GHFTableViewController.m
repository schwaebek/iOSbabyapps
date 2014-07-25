//
//  GHFTableViewController.m
//  GitHub Friends
//
//  Created by Katlyn Schwaebe on 7/24/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "GHFTableViewController.h"
#import "GHFTableViewCell.h"

//@interface GHFRootViewController () <UITextFieldDelegate>


@interface GHFTableViewController () <UITextFieldDelegate>

@end

//NSDictionary * infoItem = self.info[indexPath.row];


@implementation GHFTableViewController;


UITextField * searchField;
UIButton * profileButton;
UIButton * searchButton;


//@property (nonatomic) NSArray * info;


NSMutableArray * githubFriends;
//NSArray * [@""];


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
        
        
        
        // Custom initialization
        
        /*
          NSArray * myArray = @[];
         NSMutableArray * myMutableArray = [    @[]          mutableCopy];
         
         */
        
        githubFriends = [@[@{
                            @"name": @"Jo Albright",
                            @"avatar_url": @"https://avatars.githubusercontent.com/u/1536630?",
                            @"followers": @"followers: 1",
                            @"following": @"following: 2",
                            @"location": @"Atlanta, GA",
                            },
    @{
          @"name": @"Daniel Merrill",
          @"avatar_url": @"https://avatars.githubusercontent.com/u/8224723?",
          @"followers": @"followers: 1",
          @"following": @"following: 2",
          @"location": @"Atlanta, GA",
          },
    @{
          @"name": @"Eric Seidel",
          @"avatar_url": @"https://avatars.githubusercontent.com/u/8224720?",
          @"followers": @"followers: 1",
          @"following": @"following: 2",
          @"location": @"Atlanta, GA",
          },
    @{
          @"name": @"Eric Williams",
          @"avatar_url": @"https://avatars.githubusercontent.com/u/8224735?",
          @"followers": @"followers: 1",
          @"following": @"following: 2",
          @"location": @"Atlanta, GA",
          },
    @{
            @"name": @"Katlyn Schwaebe",
            @"avatar_url": @"https://avatars.githubusercontent.com/u/6909470?",
            @"followers": @"followers: 1",
            @"following": @"following: 2",
            @"location": @"Atlanta, GA",
            },

    @{
          @"name": @"Joseph Lau",
          @"avatar_url": @"https://avatars.githubusercontent.com/u/7451830?",
          @"followers": @"followers: 1",
          @"following": @"following: 2",
          @"location": @"Atlanta, GA",
          },
    @{
          @"name": @"Joshua Hendershot",
          @"avatar_url": @"https://avatars.githubusercontent.com/u/7279926?",
          @"followers": @"followers: 1",
          @"following": @"following: 2",
          @"location": @"Atlanta, GA",
          },
    @{
          @"name": @"Kalson Kalu",
          @"avatar_url": @"https://avatars.githubusercontent.com/u/7114996?",
          @"followers": @"followers: 1",
          @"following": @"following: 2",
          @"location": @"Atlanta, GA",
          },
    @{
          @"name": @"Merritt Tidwell",
          @"avatar_url": @"https://avatars.githubusercontent.com/u/7989843?",
          @"followers": @"followers: 1",
          @"following": @"following: 2",
          @"location": @"Atlanta, GA",
          },
    @{
          @"name": @"Rene Candelier",
          @"avatar_url": @"https://avatars3.githubusercontent.com/u/4494771?s=400",
          @"followers": @"followers: 1",
          @"following": @"following: 2",
          @"location": @"Atlanta, GA",
          },
    @{
          @"name": @"Steve Sneller",
          @"avatar_url": @"https://avatars.githubusercontent.com/u/8129918?",
          @"followers": @"followers: 1",
          @"following": @"following: 2",
          @"location": @"Atlanta, GA",
          },
    @{
          @"name": @"Jaime Connor",
          @"avatar_url": @"https://avatars2.githubusercontent.com/u/8224727?s=400",
          @"followers": @"followers: 1",
          @"following": @"following: 2",
          @"location": @"Atlanta, GA",
          },
    @{
          @"name": @"Nick Peterson",
          @"avatar_url": @"https://avatars.githubusercontent.com/u/8224722",
          @"followers": @"followers: 1",
          @"following": @"following: 2",
          @"location": @"Atlanta, GA",
          },
    @{
          @"name": @"Shane Sniteman",
          @"avatar_url": @"https://avatars2.githubusercontent.com/u/8129918?s=400",
          @"followers": @"followers: 1",
          @"following": @"following: 2",
          @"location": @"Atlanta, GA",
          },
    @{
          @"name": @"Jeremy Butler",
          @"avatar_url": @"https://avatars.githubusercontent.com/u/7903562?",
          @"followers": @"followers: 1",
          @"following": @"following: 2",
          @"location": @"Atlanta, GA",
          },
      ] mutableCopy];
    
    //[mutableCopy];
    
    return self;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 50)];
    
    
    searchField = [[UITextField alloc] initWithFrame: CGRectMake(10.0, 20.0, 250.0, 35.0)];
    searchField.backgroundColor = [UIColor whiteColor];
    searchField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    searchField.autocorrectionType = UITextAutocorrectionTypeNo;
    searchField.placeholder = @"search";
    searchField.delegate = self;
    searchField.textColor = [UIColor whiteColor];
    searchField.text = @"" ;
    searchField.keyboardType = UIKeyboardTypeDefault;
    [headerView addSubview:searchField];
    searchField.borderStyle = UITextBorderStyleLine;
    
    
    
    
    
    
    UIButton * searchButton = [[UIButton alloc] initWithFrame:CGRectMake(270.0, 20.0, 40.0, 40.0)];
    [searchButton setTitle:@"go"  forState:UIControlStateNormal];
    searchButton.backgroundColor = [UIColor colorWithRed:0.624f green:0.624f blue:0.624f alpha:1.0f];
    searchButton.layer.cornerRadius = 20.0;
    
    //[searchButton addTarget:self action:@selector(profileButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [headerView addSubview:searchButton];
    
    self.tableView.tableHeaderView =headerView;
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(BOOL)searchFieldShouldReturn: (UITextField *)searchField
{
    [searchField resignFirstResponder];
    
    return YES;
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
 {
 #warning Potentially incomplete method implementation.
 // Return the number of sections.
 return 0; */

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    return 115;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return githubFriends.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GHFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil)
    {
        cell=[[GHFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.friendInfo = githubFriends[indexPath.row];
    
    
    // Configure the cell...
    
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

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
