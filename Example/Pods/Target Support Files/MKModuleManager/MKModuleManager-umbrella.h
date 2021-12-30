#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "MKAppEventModuleProtocol.h"
#import "MKBaseAppEventModule.h"
#import "MKModuleManager.h"
#import "NSObject+PerformSelector.h"

FOUNDATION_EXPORT double MKModuleManagerVersionNumber;
FOUNDATION_EXPORT const unsigned char MKModuleManagerVersionString[];

