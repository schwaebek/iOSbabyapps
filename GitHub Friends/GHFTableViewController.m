//
//  GHFTableViewController.m
//  GitHub Friends
//
//  Created by Katlyn Schwaebe on 7/24/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "GHFTableViewController.h"
#import "GHFTableViewCell.h"
#import "GHFViewController.h"
#import "GRAGithubRequest.h"

//d8d08ef634ffa1ebc821ad45e59e97169f704293
//@interface GHFRootViewController () <UITextFieldDelegate>


@interface GHFTableViewController () <UITextFieldDelegate>

@end

//NSDictionary * infoItem = self.info[indexPath.row];


@implementation GHFTableViewController;

NSMutableArray * githubFriends;
NSArray * friendsList;
NSArray * insertObjects;
UITextField * searchField;
UIButton * profileButton;
UIButton * searchButton;
UIButton * arrowButton;
UIButton * numberButton;


//@property (nonatomic) NSArray * info;
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
        
        githubFriends = [@[] mutableCopy];
    
    NSArray * loadedUsers = [GRAGithubRequest loadUsers];
    if (loadedUsers)
    {
        githubFriends = [loadedUsers mutableCopy];
    }
    
    self.tableView.rowHeight = 100;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
    //[mutableCopy];
    
    return self;
    
}
- (void)viewDidLoad
{

    [super viewDidLoad];
    
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 250.0, 50.0)];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    [tap setCancelsTouchesInView:NO];

    searchField = [[UITextField alloc] initWithFrame: CGRectMake(8.0, 8.0, 250.0, 35.0)];
    searchField.backgroundColor = [UIColor whiteColor];
    searchField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    searchField.autocorrectionType = UITextAutocorrectionTypeNo;
    searchField.placeholder = @"search";
    searchField.delegate = self;
    searchField.textColor = [UIColor blackColor];
    searchField.text = @"";
    searchField.keyboardType = UIKeyboardTypeDefault;
    [headerView addSubview:searchField];
    searchField.layer.cornerRadius = 10.0;
    //searchField.textInputVie
    
    UIView * searchSpacing = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [searchField setLeftViewMode:UITextFieldViewModeAlways];
    [searchField setLeftView:searchSpacing];

    
    
    searchButton = [[UIButton alloc] initWithFrame:CGRectMake(270.0, 5.0, 40.0, 40.0)];
    [searchButton setTitle:@""  forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(searchButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    searchButton.backgroundColor = [UIColor whiteColor];
    searchButton.layer.cornerRadius = 20.0;
    
    
   // searchButton = [UIImage imageNamed:@"searchButton.png"];
    //[self.view addSubview:searchButton];
    
    UIImage * myButton = [UIImage imageNamed:@"searchButton.png"];
    [searchButton setImage:myButton forState:UIControlStateNormal];
    [self.view addSubview:searchButton];
    
    
    
    
    //[searchButton addTarget:self action:@selector(profileButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [headerView addSubview:searchButton];
    self.tableView.tableHeaderView =headerView;
    headerView.backgroundColor = [UIColor colorWithRed:0.976f green:0.098f blue:0.329f alpha:1.0f];
   // GHFTableViewController.layer.backgroundColor = [UIColor grayColor];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)searchButtonClicked
{
    NSLog(@"search button clicked");
    NSDictionary * userInfo = [GRAGithubRequest requestUserInfo:searchField.text];
    [githubFriends addObject:userInfo];
    [self.tableView reloadData];
    
    [GRAGithubRequest saveUsers:githubFriends];
}

-(void)dismissKeyboard
{
    [searchField resignFirstResponder];
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
    return 100;
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
    cell.navigationController = self.navigationController;
    // Configure the cell...
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog (@"Select row at %@", indexPath);
    
    
    
}

//Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }


//Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
     [githubFriends removeObjectAtIndex:indexPath.row];
     [GRAGithubRequest saveUsers:githubFriends];
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }


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
