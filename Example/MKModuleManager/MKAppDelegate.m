//
//  MKAppDelegate.m
//  MKModuleManager
//
//  Created by zhumingke on 12/30/2021.
//  Copyright (c) 2021 zhumingke. All rights reserved.
//

#import "MKAppDelegate.h"
#import "MKModuleManager.h"

@implementation MKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSArray *array = @[@"MKTestOne",@"MKTestTwo",@"MKTestThree",@"MKTestFour"];
    [MKModuleManager sharedInstance].appEventModules = [array mutableCopy];
    NSLog(@"modules: %@",[MKModuleManager sharedInstance].allModules);
    
    [[MKModuleManager sharedInstance] handleApplicationEvent:@selector(application:didFinishLaunchingWithOptions:) withObjects:@[application,launchOptions ?: [NSDictionary dictionary]]];
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[MKModuleManager sharedInstance] handleApplicationEvent:@selector(applicationDidEnterBackground:) withObjects:@[application]];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [[MKModuleManager sharedInstance] handleApplicationEvent:@selector(applicationWillEnterForeground:) withObjects:@[application]];
}


@end
