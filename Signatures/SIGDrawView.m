//
//  SIGDrawView.m
//  Signatures
//
//  Created by Katlyn Schwaebe on 8/13/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "SIGDrawView.h"
#import "SIGRootViewController.h"
#import "SIGListTableViewController.h"

@implementation SIGDrawView
UIButton * saveButton;
UIButton * cancelButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        saveButton = [[UIButton alloc] initWithFrame:CGRectMake(160, 150, 140, 50)];
        saveButton.backgroundColor = [UIColor whiteColor];
        saveButton.layer.cornerRadius = 25;
        UIImage * saveImage = [UIImage imageNamed:@"save"];
        [saveButton setImage:saveImage forState:UIControlStateNormal];
        [saveButton addTarget:self action:@selector(saveButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:saveButton];
        
        cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 150, 140, 50)];
        cancelButton.backgroundColor = [UIColor whiteColor];
        cancelButton.layer.cornerRadius = 25;
        UIImage * cancelImage = [UIImage imageNamed:@"cancel"];
        [cancelButton setImage:cancelImage forState:UIControlStateNormal];
        [cancelButton addTarget:self action:@selector(cancelButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cancelButton];
        
        
        
        
        self.signatures = [@[] mutableCopy];
        self.backgroundColor = [UIColor clearColor];
        
        // Custom initialization
    }
    return self;
}
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //this grabs our context layer to draw on
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor blackColor]set];
    // this sets stroke or fill colors that follow
    
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineWidth(context, 2);
    
    for (NSDictionary * signature in self.signatures)
    {
        
        NSArray * points = (NSArray *) signature[@"points"];
        UIColor * lineColor = signature[@"color"];
        [lineColor set];
        
        if (points.count > 0)
        {
            CGPoint startPoint = [points[0] CGPointValue];
            CGContextMoveToPoint(context, startPoint.x, startPoint.y);
        }
        
        for (NSValue * pointVal in points)
        {
            CGPoint point = [pointVal CGPointValue];
            CGContextAddLineToPoint(context, point.x, point.y);
        }
        //this draws the context
        CGContextStrokePath(context);
        
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    self.currentSignature = [@{
                               
                               @"points":[@[]mutableCopy],
                               
                               } mutableCopy];
    
    [self.signatures addObject:self.currentSignature];
    [self signatureWithTouches:touches];
    
    //this is for scribble
    //[self scribbleWithTouches:touches];
    
    //this is for lines
    
     [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //this is for scribble
    [self signatureWithTouches:touches];
    
    //this is for lines
    
    
    [self setNeedsDisplay];
    
}

-(void) signatureWithTouches:(NSSet *) touches
{
    
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        [self.currentSignature[@"points"] addObject:[NSValue valueWithCGPoint:location]];
    }
    [self setNeedsDisplay];
}



-(void)cancelButtonClicked
{
    [self.signatures removeAllObjects];
    [self setNeedsDisplay];
}
-(void)saveButtonClicked
{
    [self.signatures removeAllObjects];
    [self setNeedsDisplay];
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
