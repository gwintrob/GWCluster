//
//  GWCluster.m
//  GWCluster
//
//  Created by Gordon Wintrob on 1/20/13.
//  Copyright (c) 2013 Gordon Wintrob. All rights reserved.
//

#import "GWCluster.h"
#import "GWPoint.h"

@implementation GWCluster

@synthesize numIterations, clusters, means, objects;

- (void)resetClusters
{
    NSMutableArray *emptyClusters = [[NSMutableArray alloc] initWithCapacity:means.count];
    for (int i = 0; i <  means.count; i++) {
        [emptyClusters addObject:[[NSMutableArray alloc] init]];
    }
    [self setClusters:emptyClusters];
}

- (id)initWithObjects:(NSArray *)initObjects means:(NSArray *)initMeans averageCluster:(ClusterBlock)block
{
    self = [super init];
    if (self) {
        [self setNumIterations:50];
        
        NSMutableArray *initMeansMutable = [[NSMutableArray alloc] initWithCapacity:initMeans.count];
        for (GWClusterObject *obj in initMeans) {
            [initMeansMutable addObject:obj];
        }
        
        [self setMeans:initMeansMutable];
        [self setObjects:initObjects];
        [self setAverageCluster:block];
        [self resetClusters];
    }
    
    return self;
}

- (NSArray *)run
{    
    for (int iter = 0; iter < numIterations; iter++) {
        [self resetClusters];
        for (GWClusterObject *obj in objects) {
            double minPenalty = DBL_MAX;
            int bestCluster = 0;
            for (int i = 0; i < means.count; i++) {
                GWClusterObject *mean = [means objectAtIndex:i];
                double penalty = [obj calculatePenaltyAgainstObject:mean];
                if (penalty <= minPenalty) {
                    bestCluster = i;
                    minPenalty = penalty;
                }
            }

            [self.clusters[bestCluster] addObject:obj];
        }
        
        NSMutableArray *newMeans = [[NSMutableArray alloc] init];
        for (int i = 0; i < clusters.count; i++) {
            if (((NSArray *)clusters[i]).count > 0)
            {
                GWClusterObject *newMean = self.averageCluster(clusters[i]);
                [newMeans addObject:newMean];
            } else {
                [newMeans addObject:[means objectAtIndex:i]];
            }
                
        }
        
        [self setMeans:newMeans];
    }
    
    return self.clusters;
}

@end
