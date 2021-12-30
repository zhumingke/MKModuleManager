//
//  MKTestTwo.m
//  MKModuleManager_Example
//
//  Created by zhumingke on 2021/12/30.
//  Copyright © 2021 zhumingke. All rights reserved.
//

#import "MKTestTwo.h"

@implementation MKTestTwo

- (NSInteger)moduleLevel {
    return 1;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {
    NSLog(@"%@->%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    return YES;
}

@end
