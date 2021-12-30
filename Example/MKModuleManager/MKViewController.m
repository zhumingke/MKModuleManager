//
//  MKViewController.m
//  MKModuleManager
//
//  Created by zhumingke on 12/30/2021.
//  Copyright (c) 2021 zhumingke. All rights reserved.
//

#import "MKViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface MKViewController ()

@end

@implementation MKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.cyanColor;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"添加通知" forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(addLocalNotice) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:btn];
}

- (void)addLocalNotice {
    if (@available(iOS 10.0, *)) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        content.title = @"测试标题";
        content.subtitle = @"测试通知副标题";
        content.body = @"测试通知的具体内容";
        // 默认声音
        content.sound = [UNNotificationSound defaultSound];
        content.badge = @1;
        NSTimeInterval time = [[NSDate dateWithTimeIntervalSinceNow:5] timeIntervalSinceNow];
        UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:time repeats:NO];
        NSString *identifier = @"noticeId";
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger];
        [center addNotificationRequest:request withCompletionHandler:^(NSError *_Nullable error) {
            if (error) {
                NSLog(@"%@",error.localizedDescription);
            } else {
                NSLog(@"成功添加推送");
            }
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
