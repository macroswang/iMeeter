//
//  EasyDevelopControllers.h
//  EasyDevelop
//
//  Created by gyc on 7/2/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EasyDevelopControllers : NSObject

#pragma mark-
#pragma mark methord
//init
+(EasyDevelopControllers*)sharedEasyDevelopControllers;
//测试界面
- (UINavigationController *)navigationRootViewController;
//加载界面
- (UINavigationController *)navigationLoadingViewController;
//登陆界面
- (UINavigationController *)navigationLoginViewController;
//主界面
- (UINavigationController *)navigationMainViewController;

//个人设置
- (UINavigationController *)navigationPersonSettingViewController;
//个人中心
- (UINavigationController *)navigationPersonCenterController;
//广场
- (UINavigationController *)navigationHallViewController;
@end
