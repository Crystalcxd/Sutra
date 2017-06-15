//
//  AppDelegate.m
//  Sutra
//
//  Created by medica_mac on 2017/6/14.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "AppDelegate.h"

#import "JingListViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self mainView];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)mainView {
    // Homepage
    JingListViewController *jingVC = [[JingListViewController alloc] init];
    jingVC.navigationController.navigationBar.translucent = NO;
    MLNavigationController *navJingController = [[MLNavigationController alloc] initWithRootViewController:jingVC];
    
    //Discover
    UIViewController *keVC = [[UIViewController alloc] init];
    keVC.view.backgroundColor = [UIColor yellowColor];
    keVC.navigationController.navigationBar.translucent = NO;
    MLNavigationController *navKeController = [[MLNavigationController alloc] initWithRootViewController:keVC];
    
    //Discover
    UIViewController *xueVC = [[UIViewController alloc] init];
    xueVC.view.backgroundColor = [UIColor yellowColor];
    xueVC.navigationController.navigationBar.translucent = NO;
    MLNavigationController *navXueController = [[MLNavigationController alloc] initWithRootViewController:xueVC];
    
    //Discover
    UIViewController *yueVC = [[UIViewController alloc] init];
    yueVC.view.backgroundColor = [UIColor yellowColor];
    yueVC.navigationController.navigationBar.translucent = NO;
    MLNavigationController *navYueController = [[MLNavigationController alloc] initWithRootViewController:yueVC];

    // News
    UIViewController *tuVC = [[UIViewController alloc] init];
    tuVC.view.backgroundColor = [UIColor blueColor];
    tuVC.navigationController.navigationBar.translucent = NO;
    MLNavigationController *navTuController = [[MLNavigationController alloc] initWithRootViewController:tuVC];
    
    RDVTabBarController *tabBarController = [[RDVTabBarController alloc] init];
    [tabBarController.tabBar setHeight:60];
    [tabBarController.tabBar setTranslucent:YES];
    tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    
    [tabBarController setViewControllers:@[navJingController,navKeController,navXueController, navYueController, navTuController]];
    
    [self configurationTabBar:tabBarController.tabBar];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
}

- (void)configurationTabBar:(RDVTabBar *)tabBar {
    //设置  三个分类的  tabbaritem 选中和没选中下地背景图片 和  底图
//    UIImage *finishedImageTofu = [UIImage imageNamed:@"bottom_selected"];
//    UIImage *unfinishedImageTofu = [UIImage imageNamed:@"bottom"];
    
    NSArray *tabBarItemSelected = @[@"jing", @"ke",@"xue",@"yue",@"tu"];
    NSArray *tabBarItemNormal = @[@"jing", @"ke",@"xue",@"yue",@"tu"];
    NSArray *tabBarItemTitle = @[@"Jing", @"Ke",@"Xue",@"Yue",@"Tu"];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in tabBar.items) {
//        [item setBackgroundSelectedImage:finishedImageTofu withUnselectedImage:unfinishedImageTofu];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@", [tabBarItemSelected objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@", [tabBarItemNormal objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        [item setSelectedTitleAttributes:@{
                                           NSFontAttributeName: [UIFont systemFontOfSize:12],
                                           NSForegroundColorAttributeName: [UIColor colorWithRed:0 green:0.5 blue:1 alpha:1],
                                           }];
        [item setUnselectedTitleAttributes:@{
                                             NSFontAttributeName: [UIFont systemFontOfSize:12],
                                             NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                             }];
        [item setTitle:[tabBarItemTitle objectAtIndex:index]];
        index++;
        NSLog(@"%ld", (long)index);
    }
}

@end
