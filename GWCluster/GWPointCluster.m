//
//  GWPointCluster.m
//  GWCluster
//
//  Created by Gordon Wintrob on 2/27/13.
//  Copyright (c) 2013 Wintrob. All rights reserved.
//

#import "GWPointCluster.h"

@implementation GWPointCluster
@synthesize k, points;

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.points = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)addPoint:(CGPoint)point
{
    GWPoint *gwPoint = [[GWPoint alloc] initWithPoint:point];
    [self.points addObject:gwPoint];
}

- (void)clusterPoints
{
//    NSArray *means = [self.points subarrayWithRange:NSMakeRange(0, k)];
    NSArray *means = [self generateMeans];
    GWCluster *cluster = [[GWCluster alloc] initWithObjects:self.points means:means averageCluster:^(NSArray *clusterPoints) {
        return [GWPoint calculateMeanOfPoints:clusterPoints];
    }];
    [cluster run];
    
    NSMutableArray *clusters = cluster.clusters;
    NSArray *colors = [self generateColors];
    for (int i = 0; i < k; i++)
    {
        for (GWPoint *point in clusters[i])
        {
            [point setColor:colors[i]];
        }
    }
}

- (NSArray *)generateMeans
{
    NSMutableArray *means = [[NSMutableArray alloc] initWithCapacity:k];
    
    for(int i = 0; i < k; i++)
    {
        int randomI = arc4random() % k;
        [means addObject:points[randomI]];
    }
    
    return means;
}


- (NSArray *)generateColors
{
    NSMutableArray *colors = [[NSMutableArray alloc] initWithCapacity:k];
    
    for(int i = 0; i < k; i++)
    {
        double val = ((double)arc4random() / ARC4RANDOM_MAX);
        UIColor *color = [UIColor colorWithHue:val saturation:1.f brightness:1.f alpha:1.f];
        [colors addObject:color];
    }
    
    return colors;
}

@end
