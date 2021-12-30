//
//  MKTestThree.m
//  MKModuleManager_Example
//
//  Created by zhumingke on 2021/12/30.
//  Copyright © 2021 zhumingke. All rights reserved.
//

#import "MKTestThree.h"

@implementation MKTestThree

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {

    NSLog(@"%@->%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
        
    }];
    center.delegate = self;
    
    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%@->%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
    NSLog(@"%@->%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    completionHandler();
}


@end
