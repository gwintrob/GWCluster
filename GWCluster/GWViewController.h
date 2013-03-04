//
//  GWViewController.h
//  GWCluster
//
//  Created by Gordon Wintrob on 2/27/13.
//  Copyright (c) 2013 Wintrob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GWPointClusterView.h"

@interface GWViewController : UIViewController
{
    IBOutlet UILabel *titleLabel;
    IBOutlet UIButton *clusterButton;
}

@property (nonatomic, strong) GWPointClusterView *pcv;
- (IBAction)clusterPoints:(id)sender;

@end
