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
    NSLog(@"adding point: %.0f,%.0f to cluster %@", point.x, point.y, self.cluster);
    [self.cluster addPoint:point];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)drawRect:(CGRect)rect
{
    NSLog(@"drawing cluster %@", self.cluster);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 10.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    [[UIColor blueColor] set];
    
    for (GWPoint *gwPoint in cluster.points) {
        NSLog(@"drawing point");
        CGPoint point = gwPoint.point;
        CGContextAddArc(context, point.x, point.y, 5, 0, 2*M_PI, YES);
        CGContextDrawPath(context, kCGPathFillStroke);
    }
}

- (void)resetCluster:(UIGestureRecognizer *)gr {
    [self resetCluster];
    [self setNeedsDisplay];
}

- (void)resetCluster {
    NSLog(@"resetting cluster");
    GWPointCluster *newCluster = [[GWPointCluster alloc] init];
    [self setCluster:newCluster];
    NSLog(@"new cluster %@", self.cluster);
}

@end
