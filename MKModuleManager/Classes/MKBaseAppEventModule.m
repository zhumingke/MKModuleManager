//
//  MKBaseAppEventModule.m
//  MKModuleManager_Example
//
//  Created by zhumingke on 2021/12/30.
//  Copyright © 2021 zhumingke. All rights reserved.
//

#import "MKBaseAppEventModule.h"
#import "MKModuleManager.h"

static NSInteger const kMK_Module_Level_Default = 100;

@implementation MKBaseAppEventModule

- (NSString *)moduleID {
    return NSStringFromClass([self class]);
}

- (NSInteger)moduleLevel {
    return kMK_Module_Level_Default;
}

- (void)destroyModule {
    [[MKModuleManager sharedInstance] removeModule:[self moduleID]];
}

@end
