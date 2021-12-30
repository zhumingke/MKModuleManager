//
//  MKTestOne.m
//  MKModuleManager_Example
//
//  Created by zhumingke on 2021/12/30.
//  Copyright © 2021 zhumingke. All rights reserved.
//

#import "MKTestOne.h"

@implementation MKTestOne

- (NSInteger)moduleLevel {
    return 2;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%@->%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%@->%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

@end
