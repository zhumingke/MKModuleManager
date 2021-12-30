//
//  MKModuleManager.m
//  MKModuleManager_Example
//
//  Created by zhumingke on 2021/12/30.
//  Copyright © 2021 zhumingke. All rights reserved.
//

#import "MKModuleManager.h"
#import "MKBaseAppEventModule.h"
#import "NSObject+PerformSelector.h"

@interface MKModuleManager ()

@property (nonatomic , strong) NSMutableArray<id<MKAppEventModuleProtocol>> *modules;

@end

@implementation MKModuleManager

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)removeModule:(NSString *)moduleID {
    NSInteger index = NSNotFound;
    NSInteger resIndex = 0;
    for (id<MKAppEventModuleProtocol> module in self.modules) {
        if ([[module moduleID] isEqualToString:moduleID]) {
            index = resIndex;
            break;
        }
        resIndex ++;
    }
    if (index != NSNotFound) {
        [self.modules removeObjectAtIndex:index];
    }
}

- (void)registerModule:(NSString *)moduleID {
    Class moduleCls = NSClassFromString(moduleID);
    if (moduleCls && [moduleCls conformsToProtocol:@protocol(MKAppEventModuleProtocol)]) {
        id<MKAppEventModuleProtocol> module = [[moduleCls alloc] init];
        [self addModule:module];
    }
    [self.modules sortUsingComparator:^NSComparisonResult(MKBaseAppEventModule *obj1, MKBaseAppEventModule *obj2) {
        return [obj1 moduleLevel] > [obj2 moduleLevel];
    }];
}

- (void)addModule:(id<MKAppEventModuleProtocol>)module {
    if (![self.modules containsObject:module]) {
        [self.modules addObject:module];
    }
}

- (NSArray<id> *)allModules {
    return self.modules;
}

- (void)handleApplicationEvent:(SEL)sel withObjects:(NSArray *)objects {
    for (id<MKAppEventModuleProtocol> module in self.modules) {
        if ([module respondsToSelector:sel]) {
            MKBaseAppEventModule *x = module;
            [x mk_PerformSelector:sel withObjects:objects];
        }
    }
}

#pragma mark - setter/getter

- (NSMutableArray<id<MKAppEventModuleProtocol>> *)modules {
    if (!_modules) {
        _modules = [NSMutableArray array];
    }
    return _modules;
}

- (void)setAppEventModules:(NSMutableArray *)appEventModules {
    if (appEventModules.count == 0) {
        return;
    }
    _appEventModules = appEventModules;
    for (NSString *moduleName in _appEventModules) {
        if (moduleName) {
            [self registerModule:moduleName];
        }
    }
    [self.modules sortUsingComparator:^NSComparisonResult(MKBaseAppEventModule *obj1, MKBaseAppEventModule *obj2) {
        return obj1.moduleLevel > obj2.moduleLevel;
    }];
}

@end
