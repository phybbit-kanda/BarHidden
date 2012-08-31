//
//  BHBarHiddenDelegate.h
//  BarHidden
//
//  Created by 神田 on 2012/08/29.
//  Copyright (c) 2012年 kanda. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BHBarHiddenDelegate
- (void)setBarHidden:(BOOL)hidden animated:(BOOL)animated;
- (void)setBarHidden:(BOOL)hidden animated:(BOOL)animated withScrollView:(UIScrollView*)scrollView;
@end
