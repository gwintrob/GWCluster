//
//  GWPoint.h
//  GWCluster
//
//  Created by Gordon Wintrob on 2/27/13.
//  Copyright (c) 2013 Wintrob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWClusterObject.h"

@interface GWPoint : GWClusterObject

@property (nonatomic) CGPoint point;
@property (nonatomic) UIColor *color;

- (id)initWithPoint:(CGPoint)newPoint;
+ (GWPoint *)calculateMeanOfPoints:(NSArray *)points;

@end
