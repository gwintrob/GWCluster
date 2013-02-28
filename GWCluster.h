//
//  GWCluster.h
//  GWCluster
//
//  Created by Gordon Wintrob on 1/20/13.
//  Copyright (c) 2013 Gordon Wintrob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWClusterObject.h"

@interface GWCluster : NSObject

@property (nonatomic) int numIterations;
@property (nonatomic, retain) NSMutableArray *clusters;
@property (nonatomic, retain) NSMutableArray *means;
@property (nonatomic, retain) NSArray *objects;

typedef GWClusterObject * (^ClusterBlock)(NSArray *);
@property (nonatomic, copy) ClusterBlock averageCluster;

- (void)resetClusters;
- (id)initWithObjects:(NSArray *)initObjects means:(NSArray *)initMeans averageCluster:(ClusterBlock)block;
- (NSArray *)run;

@end
