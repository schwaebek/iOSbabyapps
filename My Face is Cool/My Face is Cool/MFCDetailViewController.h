//
//  MFCDetailViewController.h
//  My Face is Cool
//
//  Created by Katlyn Schwaebe on 8/20/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFCDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
