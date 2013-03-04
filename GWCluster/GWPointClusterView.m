//
//  GWView.m
//  GWCluster
//
//  Created by Gordon Wintrob on 2/28/13.
//  Copyright (c) 2013 Wintrob. All rights reserved.
//

#import "GWPointClusterView.h"

@implementation GWPointClusterView
@synthesize cluster;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self resetCluster];
        
        [self setBackgroundColor:[UIColor clearColor]];
        [self setMultipleTouchEnabled:YES];
        
        UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        singleTapRecognizer.numberOfTapsRequired = 1;
        [self addGestureRecognizer:singleTapRecognizer];
        
        UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resetCluster:)];
        doubleTapRecognizer.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubleTapRecognizer];
        
        [singleTapRecognizer requireGestureRecognizerToFail:doubleTapRecognizer];
    }
    
    return self;
}

- (void)tap:(UIGestureRecognizer *)gr
{
    CGPoint point = [gr locationInView:self];
    [self.cluster addPoint:point];
    [self setNeedsDisplay];
}

-(void)clusterPoints
{
    [self.cluster clusterPoints];
    [self setNeedsDisplay];
}


// This might be faster than the GestureRecognizer
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    for (UITouch *t in touches) {
//        if ([t tapCount] > 1) {
//            [self resetCluster];
//        }
//    }
//}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 10.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    for (GWPoint *gwPoint in cluster.points) {
        [gwPoint.color set];
        CGPoint point = gwPoint.point;
        CGContextAddArc(context, point.x, point.y, 5, 0, 2*M_PI, YES);
        CGContextDrawPath(context, kCGPathFillStroke);
    }
}

- (void)resetCluster:(UIGestureRecognizer *)gr
{
    [self resetCluster];
    [self setNeedsDisplay];
}

- (void)resetCluster {
    NSLog(@"resetting cluster");
    GWPointCluster *newCluster = [[GWPointCluster alloc] init];
    [self setCluster:newCluster];
}

@end
