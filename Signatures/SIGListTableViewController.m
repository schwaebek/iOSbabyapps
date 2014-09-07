//
//  SIGListTableViewController.m
//  Signatures
//
//  Created by Katlyn Schwaebe on 8/13/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "SIGListTableViewController.h"
#import "SIGRootViewController.h"
#import "SIGDrawViewController.h"



@interface SIGListTableViewController ()

@end

@implementation SIGListTableViewController


    //UITextField * textBox;
    NSMutableArray * groups;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
       
        self.tableView .separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        groups = ([self loadGroupData]) ? [self loadGroupData] : [@[] mutableCopy];
  
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    UIBarButtonItem * addNewGroup = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewGroupClicked)];
    
    
  
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    self.navigationItem.rightBarButtonItem = addNewGroup;
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}
-(void)viewWillAppear: (BOOL) animated
{
    [super viewWillAppear:YES];
    [self saveGroupData];
    NSLog(@"%@", groups);
    [self.tableView reloadData];
}


- (void)addNewGroupClicked
{
    SIGRootViewController * SIGDrawVC = [[SIGRootViewController alloc] init];
    SIGDrawVC.groups = groups;
    [self.navigationController presentViewController:SIGDrawVC animated: YES completion:nil];
    
 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return groups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = groups [indexPath.row][@"signature"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog (@"hello");
    SIGRootViewController * listTVC = [[SIGRootViewController alloc] init];
    listTVC.groupInfo = groups[indexPath.row];
    [self.navigationController pushViewController:listTVC animated:YES];
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [groups removeObjectAtIndex:indexPath.row];
        [self saveGroupData];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}


-(void) saveGroupData

{
    NSData * groupData = [NSKeyedArchiver archivedDataWithRootObject:groups];
    [groupData writeToFile:[self groupFilePath] atomically:YES];
}

-(NSMutableArray *) loadGroupData
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self groupFilePath]];
}

-(NSString *)groupFilePath
{
    NSArray * documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * path = documentDirectories[0];
    return [path stringByAppendingPathComponent:@"group.data"];
}

-(BOOL) prefersStatusBarHidden { return YES; }

@end
