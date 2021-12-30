//
//  MKAppEventModuleProtocol.h
//  MKModuleManager_Example
//
//  Created by zhumingke on 2021/12/30.
//  Copyright © 2021 zhumingke. All rights reserved.
//

#import <UserNotifications/UserNotifications.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MKAppEventModuleProtocol <UIApplicationDelegate, UNUserNotificationCenterDelegate>

/// module ID
- (NSString *)moduleID;

/// module 优先级
- (NSInteger)moduleLevel;

/// 释放module
- (void)destroyModule;

@end

NS_ASSUME_NONNULL_END
