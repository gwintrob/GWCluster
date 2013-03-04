//
//  GWPoint.m
//  GWCluster
//
//  Created by Gordon Wintrob on 2/27/13.
//  Copyright (c) 2013 Wintrob. All rights reserved.
//

#import "GWPoint.h"

@implementation GWPoint

@synthesize color,point;

- (id)initWithPoint:(CGPoint)newPoint
{
    self = [super init];
    
    if (self)
    {
        [self setPoint:newPoint];
        [self setColor:[UIColor blackColor]];
    }
    
    return self;
}

+ (double)distanceBetweenPoint:(CGPoint)p1 point:(CGPoint)p2
{
    double xDist = (p2.x - p1.x);
    double yDist = (p2.y - p1.y);
    return sqrt((xDist * xDist) + (yDist * yDist));
}

+ (double)averageVals:(double *)vals
{
    int count = sizeof(vals);
    double total = 0;
    
    for(int i = 0; i < count; i++)
    {
        total += vals[i];
    }
    
    return total / count;
}

- (double)calculatePenaltyAgainstObject:(GWPoint *)otherPoint
{
    return [GWPoint distanceBetweenPoint:self.point point:otherPoint.point];
}

+ (GWPoint *)calculateMeanOfPoints:(NSArray *)points
{
    int count = [points count];
    double xVals[count];
    double yVals[count];
    
    for(int i = 0; i < count; i++)
    {
        CGPoint p = ((GWPoint *)points[i]).point;
        xVals[i] = p.x;
        yVals[i] = p.y;
    }
    
    double x = [GWPoint averageVals:xVals];
    double y = [GWPoint averageVals:yVals];
    
    CGPoint newPoint = CGPointMake(x, y);
    return [[GWPoint alloc] initWithPoint:newPoint];
}

- (NSString *)description
{
    return [[NSString alloc] initWithFormat:@"<GWPoint: %.0f,%.0f (%@)>", point.x, point.y, color, nil];
}

@end
