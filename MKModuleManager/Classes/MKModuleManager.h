//
//  MKModuleManager.h
//  MKModuleManager_Example
//
//  Created by zhumingke on 2021/12/30.
//  Copyright © 2021 zhumingke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKAppEventModuleProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MKModuleManager : NSObject

+ (instancetype)sharedInstance;

/// 初始化时注册各模块
@property (nonatomic , strong) NSMutableArray *appEventModules;

/// 移除module
/// @param moduleID module ID
- (void)removeModule:(nonnull NSString *)moduleID;

/// 注册module
/// @param moduleID module ID
- (void)registerModule:(nonnull NSString *)moduleID;

/// module集合
- (NSArray<id<MKAppEventModuleProtocol>> *)allModules;

/// 为modules分发APPdelegate事件
/// @param sel APPdelegate方法
/// @param objects 参数
- (void)handleApplicationEvent:(SEL)sel withObjects:(NSArray *)objects;

@end

NS_ASSUME_NONNULL_END
