//
//  MFLTableViewController.m
//  List App
//
//  Created by Katlyn Schwaebe on 7/23/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "MFLTableViewController.h"
UILabel * someLabel;


        ///PROPERTIES///

@interface MFLTableViewController ()
@property (nonatomic) NSArray * info;

/*
@property (nonatomic) NSArray * days;
@property (nonatomic) NSArray * students;
@property (nonatomic) NSArray * colors;
@property (nonatomic) NSArray * fontSizes;
 */
 


@end

@implementation MFLTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        // Custom initialization
        
        /// ARRAYS ///
      /*
        self.days = @[@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday" ,@"Saturday", @"Sunday"];
        self.students = @[@"Reagan", @"Libby", @"Vianne", @"Treise", @"Melanie", @"Michael", @"Katlyn"];
        self.colors = @[[UIColor redColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], [UIColor blueColor], [UIColor purpleColor], [UIColor brownColor]];
        self.fontSizes = @[@20.0, @23.0, @26.0, @29.0, @32.0, @35.0, @38.0];
       */
        
self.info = @[
              @{
                  @"day": @"Monday",
                  @"color": [UIColor redColor],
                  @"student": @"Reagan",
                  @"size": @20.0
                  },
              @{
                  @"day": @"Tuesday",
                  @"color": [UIColor orangeColor],
                  @"student": @"Libby",
                  @"size": @23.0
                  },
              @{
                  @"day": @"Wednesday",
                  @"color": [UIColor yellowColor],
                  @"student": @"Vianne",
                  @"size": @26.0
                  },
              @{
                  @"day": @"Thursday",
                  @"color": [UIColor greenColor],
                  @"student": @"Treise",
                  @"size": @29.0
                  },
              @{
                  @"day": @"Friday",
                  @"color": [UIColor blueColor],
                  @"student": @"Melanie",
                  @"size": @32.0
                  },
              @{
                  @"day": @"Saturday",
                  @"color": [UIColor purpleColor],
                  @"student": @"Michael",
                  @"size": @35.0
                  },
              @{
                  @"day": @"Sunday",
                  @"color": [UIColor brownColor],
                  @"student": @"Katlyn",
                  @"size": @38.0
                  },
              ];
        
    }
    
    return self;
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.info.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    
    NSDictionary * infoItem = self.info[indexPath.row];
    
    cell.textLabel.text =infoItem[@"day"];
    
    cell.backgroundColor = infoItem[@"color"];
    
    cell.detailTextLabel.text =infoItem[@"student"];
    
    cell.textLabel.font = [UIFont systemFontOfSize:[infoItem[@"size"] intValue]];
    
    /*    ///DAYS///
    
    NSString * day = self.days[indexPath.row];
    cell.textLabel.text = day;
    NSLog(@"listItem = %@", day);
    
        ///STUDENTS///
    
    NSString * student = self.students[indexPath.row];
    cell.detailTextLabel.text = student;
    NSLog(@"ListItem = %@", student);
    
        ///COLORS///
    
    UIColor * color = self.colors[indexPath.row];
    cell.backgroundColor = color;
    NSLog(@"ListItem = %@", color);
    
    
        ///FONTSIZES///
    
    NSNumber * font = self.fontSizes [indexPath. row];
    cell.textLabel.font = [UIFont systemFontOfSize:[font intValue]];
    NSLog(@"ListItem = %@", font);
    */

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
