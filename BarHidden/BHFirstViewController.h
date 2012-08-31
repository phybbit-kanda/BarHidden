//
//  BHFirstViewController.h
//  BarHidden
//
//  Created by 神田 on 2012/08/29.
//  Copyright (c) 2012年 kanda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BHBarHiddenDelegate.h"
@interface BHFirstViewController : UIViewController<UIScrollViewDelegate>
{
	
	__weak IBOutlet UIScrollView *mScrollView;
	id <BHBarHiddenDelegate> mBarHiddenDelegate;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil barHiddenDelegate:(id <BHBarHiddenDelegate>)aDelegate;
- (IBAction)BarHiddenButton:(id)sender;
@end
