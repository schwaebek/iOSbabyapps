//
//  SIGDrawView.h
//  Signatures
//
//  Created by Katlyn Schwaebe on 8/13/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SIGDrawView : UIView

@property (nonatomic) NSMutableArray * signatures;
@property (nonatomic) NSMutableDictionary * currentSignature;
@property (nonatomic) UIColor * lineColor;
@property (nonatomic) int lineWidth;

@end
