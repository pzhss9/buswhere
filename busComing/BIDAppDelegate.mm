//
//  BIDAppDelegate.m
//  busComing
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 com.pzh. All rights reserved.
//

#import "BIDAppDelegate.h"
#import "YRSideViewController.h"
#import "BIDLeftViewController.h"
@implementation BIDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
     _mapManager = [[BMKMapManager alloc]init];
    [_mapManager start:@"92qYAHqkhHP3m0Zw9WUSGOYQ"  generalDelegate:nil];
    
   
    
    
    //获取故事版指针
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //获取做视图指针
    BIDLeftViewController *leftViewController=[storyBoard instantiateViewControllerWithIdentifier:@"LeftView"];
    //获取主视图指针
    UITabBarController *centerViewController=[storyBoard instantiateViewControllerWithIdentifier:@"centerViewController"];
    
   
     //抽屉视图初始化
    self.sideViewController=[[YRSideViewController alloc]init];
    self.sideViewController.leftViewController=leftViewController;
    self.sideViewController.rootViewController=centerViewController;
    self.sideViewController.needSwipeShowMenu=true;
    self.sideViewController.leftViewShowWidth=250;
    self.window.rootViewController=_sideViewController;
    
    
    
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
- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskPortrait;
}
- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
