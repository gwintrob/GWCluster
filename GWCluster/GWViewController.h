//
//  GWViewController.h
//  GWCluster
//
//  Created by Gordon Wintrob on 2/27/13.
//  Copyright (c) 2013 Wintrob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GWPointCluster.h"

@interface GWViewController : UIViewController

@property (nonatomic, weak) GWPointCluster *cluster;
- (void)reset;

@end
