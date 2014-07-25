//
//  GHFTableViewCell.m
//  GitHub Friends
//
//  Created by Katlyn Schwaebe on 7/24/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "GHFTableViewCell.h"

@implementation GHFTableViewCell
{
    UILabel * friendName;
    UILabel * followers;
    UILabel * following;
    UILabel * location;
    UIImageView * friendImage;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        //Name label
        friendName = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, 200, 40)];
        friendName.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview: friendName];
        friendName.font = [UIFont fontWithName: @"HelveticaNeue-Ultralight" size: 30];
        
        
        followers = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 100, 40)];
        followers.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview: followers];
        followers.font = [UIFont fontWithName:@"HelveticaNeue-light" size:15];
        
        following = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 100, 40)];
        following.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview: following];
        following.font = [UIFont fontWithName:@"HelveticaNeue-light" size:15];
    
        
        location = [[UILabel alloc] initWithFrame:CGRectMake(100, 60, 200, 55)];
        location.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:location];
        location.font = [UIFont fontWithName:@"HelveticaNeue-light" size:15];
        
        
        //Image
        friendImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        [self.contentView addSubview:friendImage];
        friendImage.backgroundColor = [UIColor lightGrayColor];
        
        
        
        //////////friendImage = [UIColor grayColor];
        
        //Profile button
        UIButton * profileButton = [[UIButton alloc] initWithFrame: CGRectMake(210.0, 80.0,  100.0, 25.0)];
        [profileButton setTitle:@"profile" forState:UIControlStateNormal];
        profileButton.backgroundColor = [UIColor colorWithRed:0.624f green:0.624f blue:0.624f alpha:1.0f];
        //[profileButton addTarget:self action:@selector(profileButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:profileButton];
        profileButton.layer.cornerRadius = 10.0;
        
        //Gist button
        UIButton * gistButton = [[UIButton alloc] initWithFrame: CGRectMake(210.0, 40.0,  100.0, 25.0)];
        [gistButton setTitle:@"gist" forState:UIControlStateNormal];
        gistButton.backgroundColor = [UIColor colorWithRed:0.624f green:0.624f blue:0.624f alpha:1.0f];
        gistButton.layer.cornerRadius = 10.0;
        //[gistButton addTarget:self action:@selector(profileButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:gistButton];
        
    }
    return self;
}
   /* @"login": @"joalbright",
    @"avatar_url": "https://avatars.githubusercontent.com/u/1536630?",
    @"name": @"Jo Albright",
    @"blog": @"jo2.co",
    @"location": @"Atlanta, Ga",
    @"email": @"me@jo2.co" */

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
    friendImage.layer.cornerRadius = 20;
    friendImage.layer.masksToBounds= YES;
    friendName.text = friendInfo [@"name"];
    followers.text = friendInfo [@"followers"];
    following.text = friendInfo [@"following"];
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
