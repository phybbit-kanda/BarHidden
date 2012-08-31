//
//  BHAppDelegate.m
//  BarHidden
//
//  Created by 神田 on 2012/08/29.
//  Copyright (c) 2012年 kanda. All rights reserved.
//

#import "BHAppDelegate.h"

#import "BHFirstViewController.h"

#import "BHSecondViewController.h"

@implementation BHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
	UIViewController *viewController1 = [[BHFirstViewController alloc] initWithNibName:@"BHFirstViewController" bundle:nil barHiddenDelegate:self];
	
	UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:viewController1];
	UIViewController *viewController2 = [[BHSecondViewController alloc] initWithNibName:@"BHSecondViewController" bundle:nil];
	self.tabBarController = [[UITabBarController alloc] init];
	self.tabBarController.viewControllers = @[nav, viewController2];
	self.window.rootViewController = self.tabBarController;
//	[self.tabBarController.tabBar setAlpha:0.2];
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/
BOOL hiddenTabBar = NO;
- (void)setBarHidden:(BOOL)hidden animated:(BOOL)animated{
	
	hiddenTabBar = hidden;
	
	if(!hidden){
	
	for(UIView *view in _tabBarController.view.subviews)
	{
		CGRect _rect = view.frame;
		if([view isKindOfClass:[UITabBar class]])
		{
		} else {
			if (!hiddenTabBar) {
				_rect.origin.y=-44;
				_rect.size.height = 480+44;
				[view setFrame:_rect];
			} 
		}
	}
	
	}
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.2];
	for(UIView *view in _tabBarController.view.subviews)
	{
		CGRect _rect = view.frame;
		if([view isKindOfClass:[UITabBar class]])
		{
			if (!hidden) {
				_rect.origin.y = 431;
				[view setFrame:_rect];
			} else {
				_rect.origin.y = 480;
				[view setFrame:_rect];
			}
		}
	}
	if(!hidden)[self endHidden];
//		[UIView setAnimationDidStopSelector:@selector(endHidden2)];
	[UIView commitAnimations];
	if(hidden)[self endHidden];
	
}

- (void)setBarHidden:(BOOL)hidden animated:(BOOL)animated withScrollView:(UIScrollView*)scrollView{
	
	hiddenTabBar = hidden;
	
	//Barを表示する場合のMainViewのアニメーション開始位置
	if(!hidden&&animated){
		for(UIView *view in _tabBarController.view.subviews)
		{
			CGRect _rect = view.frame;
			if(![view isKindOfClass:[UITabBar class]])
			{
				if (!hiddenTabBar) {
					_rect.origin.y=-44;
					_rect.size.height = 480+44;
					[view setFrame:_rect];
				}
			}
		}
		
	}
	if(animated){
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.2];
	}
	//ScrollViewのサイズを変更
	if(hidden){
		CGRect _rect = scrollView.frame;
		_rect.size.height = 480;
		[scrollView setFrame:_rect];
	} else {
		CGRect _rect = scrollView.frame;
		_rect.size.height = 431;
		[scrollView setFrame:_rect];
	}
	
	//TabBarの位置を変更
	for(UIView *view in _tabBarController.view.subviews)
	{
		CGRect _rect = view.frame;
		if([view isKindOfClass:[UITabBar class]])
		{
			if (!hidden) {
				_rect.origin.y = 431;
				[view setFrame:_rect];
			} else {
				_rect.origin.y = 480;
				[view setFrame:_rect];
			}
		}
	}
	if(!hidden)[self endHidden];
	[UIView commitAnimations];
	if(hidden)[self endHidden];
}

//mainviewのサイズを変更
- (void)endHidden{
	for(UIView *view in _tabBarController.view.subviews)
	{
		CGRect _rect = view.frame;
		if(![view isKindOfClass:[UITabBar class]])
		 {
			if (!hiddenTabBar) {
				_rect.origin.y=0;
				_rect.size.height = 431;
				[view setFrame:_rect];
			} else {
				_rect.size.height = 480;
				[view setFrame:_rect];
			}
		}
	}
}
@end
