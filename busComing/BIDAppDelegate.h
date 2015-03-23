//
//  BIDAppDelegate.h
//  busComing
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 com.pzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
#import "YRSideViewController.h"
@interface BIDAppDelegate : UIResponder <UIApplicationDelegate>
  @property (strong,nonatomic) BMKMapManager *mapManager;
@property (strong, nonatomic) UIWindow *window;
///左侧菜单控制器
@property (nonatomic)YRSideViewController *sideViewController;
///主导航栏控制器
@property (nonatomic)UINavigationController *currentNavigationController;
@end
