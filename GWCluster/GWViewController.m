//
//  GWViewController.m
//  GWCluster
//
//  Created by Gordon Wintrob on 2/27/13.
//  Copyright (c) 2013 Wintrob. All rights reserved.
//

#import "GWViewController.h"
#import "GWPointClusterView.h"

@implementation GWViewController

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    [self resetCluster];
//    state = 0;
//}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        GWPointClusterView *pcv = [[GWPointClusterView alloc] initWithFrame:self.view.frame];
        [self.view insertSubview:pcv belowSubview:titleLabel];
    }
    return self;
}

@end
