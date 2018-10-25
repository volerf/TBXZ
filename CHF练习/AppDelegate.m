//
//  AppDelegate.m
//  CHF练习
//
//  Created by apple on 2018/8/9.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ChatViewController.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //添加的登录页面 并使viewController不可见
//    self.login =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    LoginView* VC = [[LoginView alloc]init];
//    self.login.rootViewController = VC;
//    [self.login makeKeyAndVisible];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UITabBarController* tabBer = [[UITabBarController alloc]init];
    self.window.rootViewController = tabBer;
    
    UINavigationController* firstNav = [[UINavigationController alloc]initWithRootViewController:[[ViewController alloc]init]];
    firstNav.tabBarItem.title = @"动态";
    [firstNav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [firstNav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    firstNav.tabBarItem.image = [[UIImage imageNamed:@"news_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    firstNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"news_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [tabBer addChildViewController:firstNav];
    
    UINavigationController* secondNav = [[UINavigationController alloc]initWithRootViewController:[[ChatViewController alloc]init]];
    secondNav.tabBarItem.title = @"消息";
    [secondNav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [secondNav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    secondNav.tabBarItem.image = [[UIImage imageNamed:@"chat_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    secondNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"chat_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [tabBer addChildViewController:secondNav];
    
    UINavigationController* thirdNav = [[UINavigationController alloc]initWithRootViewController:[[LoginViewController alloc]init]];
    thirdNav.tabBarItem.title = @"我的";
    [thirdNav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [thirdNav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    thirdNav.tabBarItem.image = [[UIImage imageNamed:@"mine_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    thirdNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"mine_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [tabBer addChildViewController:thirdNav];
    
    
//    UIColor* color = [UIColor grayColor];
//    color = [color colorWithAlphaComponent:0.3];//透明度
//    firstNav.navigationBar.barTintColor = color;
    
    tabBer.selectedViewController = thirdNav;//打开后显示的第一个页面
    [self.window makeKeyAndVisible];
    
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


@end
