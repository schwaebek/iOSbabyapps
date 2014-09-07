//
//  MCSAnnotation.h
//  My Cool Spots
//
//  Created by Katlyn Schwaebe on 8/18/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MCSAnnotation : NSObject <MKAnnotation>
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
- (void) setCoordinate:(CLLocationCoordinate2D)newCoordinate;
@property (nonatomic, readonly, copy) NSString * title;
-(void)setTitle:(NSString *)title;
@end
