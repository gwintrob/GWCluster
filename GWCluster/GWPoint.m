//
//  GWPoint.m
//  GWCluster
//
//  Created by Gordon Wintrob on 2/27/13.
//  Copyright (c) 2013 Wintrob. All rights reserved.
//

#import "GWPoint.h"

@implementation GWPoint

@synthesize point;

+ (double)distanceBetweenPoint:(CGPoint)p1 point:(CGPoint)p2
{
    double xDist = (p2.x - p1.x);
    double yDist = (p2.y - p1.y);
    return sqrt((xDist * xDist) + (yDist * yDist));
}

- (double)calculatePenaltyAgainstObject:(GWPoint *)otherPoint
{
    return [GWPoint distanceBetweenPoint:self.point point:otherPoint.point];
}

@end
