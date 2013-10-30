//
//  URLHelper.h
//  EasyDevelop
//
//  Created by gyc on 6/22/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import <Foundation/Foundation.h>
//网络请求类型请求类型
typedef enum
{
     kRequestTypeDefault =10000,
     kRequestTypeTestGet,//测试
     kRequestTypeQueryImeterUserInfoData,//查询用户基本信息
     kRequestTypeCreateImeterUserData,//创建用户信息
     kRequestTypeUpdateImeterUserData,//修改用户信息
    
      kRequestTypeQueryImeterMessagesInfoData,//查询发布信息
      kRequestTypeCreateImeterPublishContent,//创建发布信息
      kRequestTypeUpdateImeterMessagesData,//修改发布信息
    
     kRequestTypeQueryImeterCommentInfoData,//查询评论信息
     kRequestTypeCreateImeterCommentData,//创建评论信息
    
    kRequestTypeQueryMyFriendsInfoData,//查询我的好友信息
    kRequestTypeCreateImeterMyFriendsData,//创建我的好友
    kRequestTypeDeleteImeterMyFriendsData,//删除我的好友
    
    kRequestTypeQueryUserAttentionInfoData,//查询我的关注信息
    
    kRequestTypeCreateImeterAttentionData,//创建我的关注
    
    kRequestTypeDeleteImeterAttentionData,//删除我的关注
    
    kRequestTypeQueryUserGoodnfoData,//查询评价人
    kRequestTypeCreateImeterUserGoodData,//创建评价人
    kRequestTypeQueryUserMessageInfoData,//查询用户发布的通知信息
    
    kRequestTypeCreateImeterUserMessageData,//创建用户通知
    kRequestTypeDeleteImeterUserMessageData,//删除通知
    kRequestTypeCreateImeterUserReportData,//创建用户举报
    
//    kRequestTypeUpdateImeterUserReportIData,//更新用户举报
    
    kRequestTypeCreateImeterUserLocationData,//创建用户的位置(纬度和经度)
    
    kRequestTypeMax,
}RequestType;
@interface URLHelper : NSObject
#pragma mark -
#pragma mark 远程请求路径（远程返回NSURL）
//查询用户的基本信息(用户ID如果为空则表示查询所有用户)
+ (NSURL*) queryUserByUserId:(NSString*)userId;
//查询发布信息
//whereCause:查询条件，例如值: where publisherId='10001'
+ (NSURL*) queryPublishContentInfo:(NSString*)whereCause
                   whereCauseValue:(NSString*)whereCauseValue;
//查询评论信息
//whereCause:查询条件，例如值: where publisherId='10001'
+ (NSURL*) queryCommentInfoMethord:(NSString*)whereCause
                   whereCauseValue:(NSString*)whereCauseValue;
//查询我的好友信息
//whereCause:查询条件，例如值: where publisherId='10001'
+ (NSURL*) queryMyFriendsInfoMethord:(NSString*)whereCause
                     whereCauseValue:(NSString*)whereCauseValue;

//查询我的关注信息
//whereCause:查询条件，例如值: where publisherId='10001'
+ (NSURL*) queryUserAttentionInfoMethord:(NSString*)whereCause
                         whereCauseValue:(NSString*)whereCauseValue;
//查询评价人
//whereCause:查询条件，例如值: where publisherId='10001'
+ (NSURL*) queryUserGoodInfoMethord:(NSString*)whereCause
                    whereCauseValue:(NSString*)whereCauseValue;

//查询用户发布的通知信息
//whereCause:查询条件，例如值: where publisherId='10001'
+ (NSURL*) queryUserMessageInfoMethord:(NSString*)whereCause
                       whereCauseValue:(NSString*)whereCauseValue;
#pragma mark-
#pragma mark NSString 转URL
+ (NSURL*)requestURLWithString:(NSString*)urlStr;
@end
