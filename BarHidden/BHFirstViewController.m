//
//  BHFirstViewController.m
//  BarHidden
//
//  Created by 神田 on 2012/08/29.
//  Copyright (c) 2012年 kanda. All rights reserved.
//

#import "BHFirstViewController.h"

@interface BHFirstViewController ()

@end

@implementation BHFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil barHiddenDelegate:(id <BHBarHiddenDelegate>)aDelegate 
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = NSLocalizedString(@"First", @"First");
		self.tabBarItem.image = [UIImage imageNamed:@"first"];
		mBarHiddenDelegate = aDelegate;
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[mScrollView setContentSize:CGSizeMake(mScrollView.contentSize.width, mScrollView.contentSize.height*3)];
	mScrollView.scrollEnabled = YES;
	mScrollView.bounces = YES;
}

- (void)viewDidUnload
{
	mScrollView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
BOOL test = YES;
- (IBAction)BarHiddenButton:(id)sender {
	[self.navigationController setNavigationBarHidden:test animated:test];
//	[mBarHiddenDelegate setBarHidden:test animated:YES];
	[mBarHiddenDelegate setBarHidden:test animated:YES withScrollView:mScrollView];
	test = !test;
}
@end
