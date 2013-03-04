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

@interface GWPointCluster : NSObject

@property (nonatomic) NSMutableArray *points;
- (void)addPoint:(CGPoint)point;
- (void)clusterPoints;

@end
