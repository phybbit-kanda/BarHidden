//
//  BHAppDelegate.h
//  BarHidden
//
//  Created by 神田 on 2012/08/29.
//  Copyright (c) 2012年 kanda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BHBarHiddenDelegate.h"
@interface BHAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate,BHBarHiddenDelegate>{
	
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
