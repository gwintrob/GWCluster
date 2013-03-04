//
//  GWView.h
//  GWCluster
//
//  Created by Gordon Wintrob on 2/28/13.
//  Copyright (c) 2013 Wintrob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWPointCluster.h"

@interface GWPointClusterView : UIView

@property (nonatomic) GWPointCluster *cluster;
- (void)resetCluster;

@end
