//
//  GWPointCluster.h
//  GWCluster
//
//  Created by Gordon Wintrob on 2/27/13.
//  Copyright (c) 2013 Wintrob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWCluster.h"
#import "GWPoint.h"
#define ARC4RANDOM_MAX 0x100000000

@interface GWPointCluster : NSObject


@property (nonatomic) int k;
@property (nonatomic) NSMutableArray *points;
- (void)addPoint:(CGPoint)point;
- (void)clusterPoints;
- (void)setK:(int)k;

@end
