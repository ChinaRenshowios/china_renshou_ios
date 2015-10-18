//
//  AppDelegate.m
//  Alumnus
//
//  Created by 张超 on 15/8/17.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "AppDelegate.h"
//#import "AFNetworking.h"
#import "ALNavViewController.h"
#import "ALTabBarController.h"
#import "LoginViewController.h"
#import "ViewController.h"
#import "ALNetWorkApi.h"
#import "YLSwipeLockView.h"
#import "YLInitSwipePasswordController.h"
#import "YLCheckToUnlockViewController.h"
#import "testModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:@"00000000" forKey:@"loginName"];
    [dict setValue:@"fb276fb0ed6cdd139bd678d3ace8614" forKey:@"password"];
    [dict setValue:@"866769021414134" forKey:@"mobileDeviceId"];
    [dict setValue:@"true" forKey:@"_IS_DES_"];
    [ALNetWorkApi loginWithDict:dict withResponse:^(BOOL success, id responseData, NSString *message) {
        if (success) {
            NSDictionary *dic = responseData;
            testModel *test = [testModel getEntityFromDic:dic];
            NSLog(@"responseData - %@",test._MSG_);
        }else{
            NSLog(@"responseData - %@ message%@",responseData,message);
            
        }
    }];

//    self.window = [[UIWindow alloc]init];
//    self.window.frame = [UIScreen mainScreen].bounds;
//    
//    ALTabBarController *tabbarVc = [[ALTabBarController alloc]init];
//    
//    self.window.rootViewController = tabbarVc;
//    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"login"]){
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        self.window.rootViewController = loginVC;
    }
    else{
        //ViewController *viewVC = [[ViewController alloc] init];
        
       // self.window.rootViewController = viewVC;
        if (![[NSUserDefaults standardUserDefaults] boolForKey:@"gesturePasswordSet"]&&![[NSUserDefaults standardUserDefaults] boolForKey:@"engoreGesturePassword"]) {
            YLInitSwipePasswordController *controller = [[YLInitSwipePasswordController alloc] init];
            self.window.rootViewController = controller;
        }
        else if([[NSUserDefaults standardUserDefaults] boolForKey:@"engoreGesturePassword"]){
            ViewController *viewVC = [[ViewController alloc] init];
            
            self.window.rootViewController = viewVC;
        }
        else{
            YLCheckToUnlockViewController *controller = [[YLCheckToUnlockViewController alloc] init];
            self.window.rootViewController = controller;
        }

    }

    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
