//
//  GWViewController.m
//  GWCluster
//
//  Created by Gordon Wintrob on 2/27/13.
//  Copyright (c) 2013 Wintrob. All rights reserved.
//

#import "GWViewController.h"

@implementation GWViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.pcv = [[GWPointClusterView alloc] initWithFrame:self.view.frame];
        [self.view insertSubview:self.pcv belowSubview:titleLabel];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // TODO: Override button styling
}

- (void)clusterPoints:(id)sender
{
    [self.pcv clusterPoints];
}


@end
