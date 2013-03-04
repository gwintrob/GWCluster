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

    // Setup title
    UITapGestureRecognizer* titleGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(incrementK:)];
    [titleLabel setUserInteractionEnabled:YES];
    [titleLabel addGestureRecognizer:titleGesture];
    
    // Setup button
    // http://nathanbarry.com/designing-buttons-ios5/
    UIImage *buttonImage = [[UIImage imageNamed:@"greyButton.png"]
                            resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    UIImage *buttonImageHighlight = [[UIImage imageNamed:@"greyButtonHighlight.png"]
                                     resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    [clusterButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [clusterButton setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
}

- (void)incrementK:(UIGestureRecognizer *)gr
{
    int currentK = self.pcv.cluster.k;
    int newK = 1;
    
    if (currentK < 5)
    {
        newK = currentK + 1;
    }
    
    [self.pcv.cluster setK:newK];
    [titleLabel setText:[NSString stringWithFormat:@"%d-Means Clustering", newK]];
}

- (void)clusterPoints:(id)sender
{
    [self.pcv clusterPoints];
}


@end
