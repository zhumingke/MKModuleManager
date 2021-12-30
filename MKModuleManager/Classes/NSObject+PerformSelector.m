//
//  NSObject+PerformSelector.m
//  MKModuleManager_Example
//
//  Created by zhumingke on 2021/12/30.
//  Copyright © 2021 zhumingke. All rights reserved.
//

#import "NSObject+PerformSelector.h"

@implementation NSObject (PerformSelector)

- (void)mk_PerformSelector:(SEL)aSel withObjects:(NSArray *)objects {

    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:aSel];
    if (!signature) {
        @throw [NSException exceptionWithName:@"抛出异常错误" reason:@"没有这个方法（方法名字错误）" userInfo:nil];
    }
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setTarget:self];
    [invocation setSelector:aSel];
    NSUInteger argsCount = signature.numberOfArguments - 2;
    NSUInteger arrCount = objects.count;
    NSUInteger resultCount = MIN(argsCount, arrCount);
    for (int i = 0; i < resultCount; i++) {
        id obj = objects[i];
        if ([obj isKindOfClass:[NSNull class]]) {
            obj = nil;
        }
        [invocation setArgument:&obj atIndex:i+2];
    }
    [invocation invoke];

}

@end
