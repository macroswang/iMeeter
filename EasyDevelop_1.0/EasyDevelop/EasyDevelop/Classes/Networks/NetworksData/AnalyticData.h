//
//  AnalyticData.h
//  EasyDevelop
//
//  Created by gyc on 6/22/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImeterUserInfoData.h"

@interface AnalyticData : NSObject

#pragma mark-
#pragma mark methord
//init
+(AnalyticData*)sharedAnalyticData;
#pragma mark-
#pragma mark 判断服务器是否请求成功
//判断服务器请求返回参数
-(BOOL)serverResult:(NSString*)jsonString;
//服务器返回消息
-(NSString*)serverResultMessage:(NSString*)jsonString;
#pragma mark-
#pragma mark Test
- (NSNumber*) analyticForTest:(NSString*)jsonString;

#pragma mark-
#pragma mark 用户的基本信息
//查询用户的基本信息
- (NSMutableArray*)queryImeterUserInfoData:(NSString*)jsonString;
@end
