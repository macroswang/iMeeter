//
//  NetworksConfig.h
//  EasyDevelop
//
//  Created by gyc on 6/22/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#ifndef EasyDevelop_NetworksConfig_h
#define EasyDevelop_NetworksConfig_h
#import "URLHelper.h"

//内网接口地址
#define NETWORK_BASE    @"http://142.0.134.35:9080/"
//用户基本信息基地址
#define  NETWORK_BASE_ADDR_USERINFO  NETWORK_BASE@"imeter-intf/userInfoController.shtml?method="
//信息发布相关基地址
#define  NETWORK_BASE_ADDR_PUBLISHINFO  NETWORK_BASE@"imeter-intf/publishInfoController.shtml?method="
//用户好友、关注相关基地址
#define  NETWORK_BASE_ADDR_FRIENDABOUTINFO  NETWORK_BASE@"imeter-intf/friendsAboutController.shtml?method="
//用户举报、通知相关基地址
#define  NETWORK_BASE_ADDR_MESSAGEABOUTINFO  NETWORK_BASE@"imeter-intf/messageAboutController.shtml?method="

//get
//查询用户的基本信息
#define kQueryUserInfoMethord    NETWORK_BASE_ADDR_USERINFO@"queryUserByUserId"

//查询发布信息
#define kQueryPublishContentInfoMethord  NETWORK_BASE_ADDR_PUBLISHINFO@"queryPublishContent"
//查询评论信息
#define kQueryCommentInfoMethord  NETWORK_BASE_ADDR_PUBLISHINFO@"queryCommentInfo"

//查询我的好友信息
#define kQueryMyFriendsInfoMethord  NETWORK_BASE_ADDR_FRIENDABOUTINFO@"queryMyFriends"
//查询我的关注信息
#define kQueryUserAttentionInfoMethord  NETWORK_BASE_ADDR_FRIENDABOUTINFO@"queryUserAttention"
//查询评价人
#define kQueryUserGoodInfoMethord   NETWORK_BASE_ADDR_FRIENDABOUTINFO@"queryUserGood"

//查询用户发布的通知信息
#define kQueryUserMessageInfoMethord    NETWORK_BASE_ADDR_MESSAGEABOUTINFO@"queryUserMessage"




//post
//创建新用户
#define kCreateUserInfoMethord  NETWORK_BASE_ADDR_USERINFO@"createMeterUser"
//修改用户
#define kUpdateUserInfoMethord  NETWORK_BASE_ADDR_USERINFO@"updateMeterUser"

//创建发布信息
#define kCreatePublishContentInfoMethord  NETWORK_BASE_ADDR_PUBLISHINFO@"createPublishContent"
//修改发布信息
#define kUpdatePublishContentInfoMethord  NETWORK_BASE_ADDR_PUBLISHINFO@"updatePublishContent"
//创建评论信息
#define kCreateCommentInfoMethord   NETWORK_BASE_ADDR_PUBLISHINFO@"createCommentInfo"


//创建我的好友
#define kCreateMyFriendsInfoMethord  NETWORK_BASE_ADDR_FRIENDABOUTINFO@"createMyFriends"
//删除我的好友
#define kDeleteMyFriendsInfoMethord  NETWORK_BASE_ADDR_FRIENDABOUTINFO@"deleteMyFriends"


//创建我的关注
#define kCreateAttentionInfoMethord   NETWORK_BASE_ADDR_FRIENDABOUTINFO@"createAttention"
//删除我的关注
#define kDeleteAttentionInfoMethord   NETWORK_BASE_ADDR_FRIENDABOUTINFO@"deleteAttention"
//创建评价人
#define kCreateUserGoodInfoMethord   NETWORK_BASE_ADDR_FRIENDABOUTINFO@"createUserGood"

//创建用户通知信息
#define kCreateUserMessageInfoMethord   NETWORK_BASE_ADDR_MESSAGEABOUTINFO@"createUserMessage"
//删除通知信息
#define kDeleteUserMessageInfoMethord   NETWORK_BASE_ADDR_MESSAGEABOUTINFO@"deleteUserMessage"
//创建用户举报
#define kCreateUserReportInfoMethord   NETWORK_BASE_ADDR_MESSAGEABOUTINFO@"createUserReport"
//更新用户举报
//#define kUpdateUserReportInfoMethord   NETWORK_BASE_ADDR_MESSAGEABOUTINFO@"updateUserReport"
//删除举报信息
//#define kDeleteUserReportInfoMethord   NETWORK_BASE_ADDR_MESSAGEABOUTINFO@"deleteUserReport"
//创建用户的位置(纬度和经度)
#define kCreateUserLocationInfoMethord   NETWORK_BASE_ADDR_MESSAGEABOUTINFO@"createUserLocation"
//
#endif
