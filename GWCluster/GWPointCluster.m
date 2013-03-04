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
    NSArray *means = [self.points subarrayWithRange:NSMakeRange(0, 3)];
    GWCluster *cluster = [[GWCluster alloc] initWithObjects:self.points means:means averageCluster:^(NSArray *clusterPoints) {
        return [GWPoint calculateMeanOfPoints:clusterPoints];
    }];
    [cluster run];
    
    NSMutableArray *clusters = cluster.clusters;
    NSArray *colors = [GWPointCluster generateKColors:[clusters count]];
    for (int i = 0; i < [clusters count]; i++)
    {
        NSLog(@"%d: %d", [clusters count], [clusters[i] count]);
        for (GWPoint *point in clusters[i])
        {
            [point setColor:colors[i]];
        }
    }
}

+ (NSArray *)generateKColors:(int)k
{
    return [[NSArray alloc] initWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor blueColor], nil];
}

@end
