//
//  GWPointCluster.m
//  GWCluster
//
//  Created by Gordon Wintrob on 2/27/13.
//  Copyright (c) 2013 Wintrob. All rights reserved.
//

#import "GWPointCluster.h"

@implementation GWPointCluster
@synthesize points;

-(id)init
{
    self = [super init];
    
    if (self)
    {
        self.points = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void)addPoint:(CGPoint)point
{
    GWPoint *gwPoint = [[GWPoint alloc] initWithPoint:point];
    [self.points addObject:gwPoint];
}

-(void)cluster
{
    NSArray *means = [self.points subarrayWithRange:NSMakeRange(0, 2)];
    GWCluster *cluster = [[GWCluster alloc] initWithObjects:self.points means:means averageCluster:^(NSArray *clusterPoints) {
        return [GWPoint calculateMeanOfPoints:self.points];
    }];

}

@end
