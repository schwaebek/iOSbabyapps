//
//  GHFTableViewCell.m
//  GitHub Friends
//
//  Created by Katlyn Schwaebe on 7/24/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "GHFTableViewCell.h"
#import "GHFViewController.h"

@implementation GHFTableViewCell
{
    UILabel * friendName;
    UILabel * followers;
    UILabel * following;
    UILabel * location;
    UIImageView * friendImage;
    UIButton * gistButton;
    UIButton * numberButton;
    UIButton * profileButton;
    

}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        //Name label
        friendName = [[UILabel alloc] initWithFrame:CGRectMake(105, 1, 200, 40)];
        friendName.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview: friendName];
        friendName.font = [UIFont fontWithName: @"HelveticaNeue-Ultralight" size: 25];
        
        followers = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 100, 40)];
        followers.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview: followers];
        followers.font = [UIFont fontWithName:@"HelveticaNeue-light" size:15];
        
        following = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 100, 40)];
        following.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview: following];
        following.font = [UIFont fontWithName:@"HelveticaNeue-light" size:15];
    
        location = [[UILabel alloc] initWithFrame:CGRectMake(105, 15, 200, 55)];
        location.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:location];
        location.font = [UIFont fontWithName:@"HelveticaNeue-light" size:15];
        self.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
        
        //Image
        friendImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        [self.contentView addSubview:friendImage];
        friendImage.backgroundColor = [UIColor lightGrayColor];
        
        
        
        //////////
       /* if ([friendInfo [@"followers"]integerValue] > [friendInfo [@"following"]integerValue]) {
            NSLog(@"There is more follower than following");
        }else if ([friendInfo [@"followers"]integerValue] < [friendInfo [@"following"]integerValue]) {
            NSLog(@"There is more following than followers"); */

        
        //Gist button
        gistButton = [[UIButton alloc] initWithFrame: CGRectMake(248.0, 70.0,  70.0, 25.0)];
        [gistButton setTitle:@"GISTS" forState:UIControlStateNormal];
        gistButton.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
        gistButton.layer.cornerRadius = 11.0;
        [gistButton addTarget:self action:@selector(gistButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:gistButton];
        //gistButton.layer.borderColor = [UIColor whiteColor];
        gistButton.titleLabel.font = [UIFont fontWithName: @"HelveticaNeue-light" size: 10];
        gistButton.layer.borderWidth = 1.0;
        gistButton.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        numberButton = [[UIButton alloc] initWithFrame: CGRectMake(235, 70, 25, 25)];
        [numberButton setTitle:@"" forState:UIControlStateNormal];
        numberButton.backgroundColor = [UIColor whiteColor];
        numberButton.layer.cornerRadius = 11.0;
        [numberButton addTarget:self action:@selector(numberButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        NSString* title = [NSString stringWithFormat:@"%d", [self.friendInfo [@"public_gists"] intValue]];
        [numberButton setTitle:title forState:UIControlStateNormal];
        [self.contentView addSubview:numberButton];
        numberButton.titleLabel.font = [UIFont fontWithName: @"HelveticaNeue-light" size: 10];
        numberButton.titleLabel.textColor = [UIColor grayColor];
        
        profileButton = [[UIButton alloc] initWithFrame: CGRectMake(285, 10, 25, 25)];
        [profileButton setTitle:@"" forState:UIControlStateNormal];
        profileButton.titleLabel.textColor = [UIColor whiteColor];
        profileButton.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
        profileButton.layer.cornerRadius = 11.0;
        [profileButton addTarget:self action:@selector(profileButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:profileButton];
        profileButton.titleLabel.font = [UIFont fontWithName: @"HelveticaNeue-light" size: 10];
        profileButton.layer.borderWidth = 1.0;
        profileButton.layer.borderColor = [[UIColor whiteColor]CGColor];
        
        
        
        UIImage * profileImage = [UIImage imageNamed:@"profileArrow"];
        [profileButton setImage:profileImage forState:UIControlStateNormal];
        [self.contentView addSubview:profileButton];
      
        
    }
    return self;
}
-(void)numberButtonClicked
{
    
}
-(void)profileButtonClicked
{
    GHFViewController * profileView = [[GHFViewController alloc] init];
    profileView.view.backgroundColor = [UIColor lightGrayColor];
    
    profileView.friendInfo = self.friendInfo;
    [self.navigationController pushViewController:profileView animated:YES];
}

-(void)gistButtonClicked
{
    GHFViewController * profileView = [[GHFViewController alloc] init];
    profileView.view.backgroundColor = [UIColor lightGrayColor];
    
    NSString * gistURL = [NSString stringWithFormat:@"https://gist.github.com/%@", self.friendInfo[@"login"]];
    profileView.friendInfo = @{@"html_url":gistURL};
    [self.navigationController pushViewController:profileView animated:YES];
}
-(void)setFriendInfo:(NSDictionary *)friendInfo
{
    _friendInfo = friendInfo;
    /// for image getting
    
    NSURL * url = [NSURL URLWithString:friendInfo[@"avatar_url"]];
    NSData * data = [NSData dataWithContentsOfURL:url];
    UIImage * image = [UIImage imageWithData:data];
    friendImage.image = image;


   /*
    NSString * followerString = [NSString stringWithFormat:@"Followers : %@", friendInfo[@"followers"]];
    friendFollowers.text = followerString;
    
    NSString * followingString = [NSString stringWithFormat:@"Following : %@", friendInfo[@"following"]];
    friendFollowing.text = followingString;
    */
    
    friendImage.image = image;
    //friendImage.layer.cornerRadius = 20;
    friendImage.layer.masksToBounds= YES;
    friendName.text = friendInfo [@"name"];
    followers.text = [NSString stringWithFormat:@"%d", [friendInfo [@"followers"] intValue]]; // number needs to convert to string
    following.text = [NSString stringWithFormat:@"%d", [friendInfo [@"following"] intValue]];
    location.text = friendInfo [@"location"];
    
    
    
    NSLog(@"%@",friendInfo);
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
