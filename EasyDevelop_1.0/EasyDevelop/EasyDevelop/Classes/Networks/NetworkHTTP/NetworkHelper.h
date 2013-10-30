//
//  NetworkHelper.h
//  EasyDevelop
//
//  Created by gyc on 6/22/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkProgressView.h"
@interface NetworkHelper : NSObject



//************************************methord************************/
#pragma mark-
#pragma mark Request GET
- (void) requestWithGET:(NSURL*)requestURL  //URL(必须)
            requestType:(RequestType)requestType //RequesTypeID(必须)
         diskCachePath :(NSString*)diskCachePath //缓存路径（可以为nil）
            cachePolicy:(ASICachePolicy)cachePolicy//存储策（可以为nil）
               delegate:(id)delegate
              didFinish:(SEL)didFinish
              didFailed:(SEL)didFailed
           analyticData:(SEL)analyticData
               userInfo:(NSDictionary*)userInfo;
#pragma mark-
#pragma mark Request POST


- (void) requestWithPost:(NSURL*)requestURL
             requestType:(RequestType)requestType
              keyForText:(NSMutableDictionary*)keyForText
              keyForFile:(NSMutableDictionary*)keyForFile
            progressView:(NetworkProgressView *)progressView
                delegate:(id)delegate
               didFinish:(SEL)didFinish
               didFailed:(SEL)didFailed
            analyticData:(SEL)analyticData
                userInfo:(NSDictionary*)userInfo;
#pragma mark-
#pragma mark downLoad File
- (void)startDownloadFile:(NSURL*)requestURL
              requestType:(RequestType)requestType
          destinationFile:(NSString*)destinationFile
            temporaryFile:(NSString*)temporaryFile
             progressView:(NetworkProgressView *)progressView
                 delegate:(id)delegate
                didFinish:(SEL)didFinish
                didFailed:(SEL)didFailed
             analyticData:(SEL)analyticData
                 userInfo:(NSDictionary*)userInfo;

#pragma mark-
#pragma mark 用户的基本信息
//查询用户的基本信息
- (void)queryImeterUserInfoData:(NSString*)userId
                       delegate:(id)delegate
                      didFinish:(SEL)didFinish
                      didFailed:(SEL)didFailed
                       userInfo:(NSDictionary*)userInfo;
//创建新用户
//查询用户的基本信息
- (void)createImeterUserData:(NSString*)userId
                         age:(NSString*)age
                      avater:(NSString*)avater
                       email:(NSString*)email
                      mobile:(NSString*)mobile
                    username:(NSString*)username
                        nick:(NSString*)nick
                         sex:(NSString*)sex
                   signature:(NSString*)signature
                    delegate:(id)delegate
                   didFinish:(SEL)didFinish
                   didFailed:(SEL)didFailed
                    userInfo:(NSDictionary*)userInfo;
//修改用户基本信息
- (void)updateImeterUserData:(NSString*)userId
                  keyForText:(NSMutableDictionary*)keyForText
                  keyForFile:(NSMutableDictionary*)keyForFile
                    delegate:(id)delegate
                   didFinish:(SEL)didFinish
                   didFailed:(SEL)didFailed
                    userInfo:(NSDictionary*)userInfo;

#pragma mark-
#pragma mark 信息发布相关接口
//查询发布信息
- (void)queryImeterMessagesInfoData:(NSString*)whereCause
                    whereCauseValue:(NSString*)whereCauseValue
                           delegate:(id)delegate
                          didFinish:(SEL)didFinish
                          didFailed:(SEL)didFailed
                           userInfo:(NSDictionary*)userInfo;
//创建发布信息
- (void)createImeterPublishContentData:(NSString*)title
                           publisherId:(NSString*)publisherId
                            contentUrl:(NSString*)contentUrl
                           contentDesc:(NSString*)contentDesc
                              delegate:(id)delegate
                             didFinish:(SEL)didFinish
                             didFailed:(SEL)didFailed
                              userInfo:(NSDictionary*)userInfo;
//修改发布信息
- (void)updateImeterMessagesData:(NSString*)publisherId
                      keyForText:(NSMutableDictionary*)keyForText
                      keyForFile:(NSMutableDictionary*)keyForFile
                        delegate:(id)delegate
                       didFinish:(SEL)didFinish
                       didFailed:(SEL)didFailed
                        userInfo:(NSDictionary*)userInfo;
//查询评论信息
- (void)queryImeterCommentInfoData:(NSString*)whereCause
                   whereCauseValue:(NSString*)whereCauseValue
                          delegate:(id)delegate
                         didFinish:(SEL)didFinish
                         didFailed:(SEL)didFailed
                          userInfo:(NSDictionary*)userInfo;
//创建评论信息
- (void)createImeterCommentData:(NSString*)userId
                    publisherId:(NSString*)beUserId
                     contentUrl:(NSString*)commentCode
                    contentDesc:(NSString*)commentContent
                         avater:(NSString*)avater
                       delegate:(id)delegate
                      didFinish:(SEL)didFinish
                      didFailed:(SEL)didFailed
                       userInfo:(NSDictionary*)userInfo;
#pragma mark-
#pragma mark  用户好友、关注相关接口
//查询我的好友信息
- (void)queryMyFriendsInfoData:(NSString*)whereCause
               whereCauseValue:(NSString*)whereCauseValue
                      delegate:(id)delegate
                     didFinish:(SEL)didFinish
                     didFailed:(SEL)didFailed
                      userInfo:(NSDictionary*)userInfo;
//创建我的好友
//创建我的好友
- (void)createImeterMyFriendsData:(NSString*)userId
                       myFriendId:(NSString*)myFriendId
                           avater:(NSString*)avater
                             nick:(NSString*)nick
                              sex:(NSString*)sex
                         delegate:(id)delegate
                        didFinish:(SEL)didFinish
                        didFailed:(SEL)didFailed
                         userInfo:(NSDictionary*)userInfo;

//删除我的好友
- (void)deleteImeterMyFriendsData:(NSString*)userId
                       myFriendId:(NSString*)myFriendId
                         delegate:(id)delegate
                        didFinish:(SEL)didFinish
                        didFailed:(SEL)didFailed
                         userInfo:(NSDictionary*)userInfo;

//查询我的关注信息
- (void)queryUserAttentionInfoData:(NSString*)whereCause
                   whereCauseValue:(NSString*)whereCauseValue
                          delegate:(id)delegate
                         didFinish:(SEL)didFinish
                         didFailed:(SEL)didFailed
                          userInfo:(NSDictionary*)userInfo;

//创建我的关注
- (void)createImeterAttentionData:(NSString*)attentionId
                    beAttentionId:(NSString*)beAttentionId
                           avater:(NSString*)avater
                             nick:(NSString*)nick
                              sex:(NSString*)sex
                         delegate:(id)delegate
                        didFinish:(SEL)didFinish
                        didFailed:(SEL)didFailed
                         userInfo:(NSDictionary*)userInfo;
//删除我的关注
- (void)deleteImeterAttentionData:(NSString*)attentionId
                    beAttentionId:(NSString*)beAttentionId
                         delegate:(id)delegate
                        didFinish:(SEL)didFinish
                        didFailed:(SEL)didFailed
                         userInfo:(NSDictionary*)userInfo;
//查询评价人
- (void)queryUserGoodnfoData:(NSString*)whereCause
             whereCauseValue:(NSString*)whereCauseValue
                    delegate:(id)delegate
                   didFinish:(SEL)didFinish
                   didFailed:(SEL)didFailed
                    userInfo:(NSDictionary*)userInfo;

//创建评价人
- (void)createImeterUserGoodData:(NSString*)goodId
                   beAttentionId:(NSString*)beAttentionId
                          avater:(NSString*)avater
                            nick:(NSString*)nick
                             sex:(NSString*)sex
                        delegate:(id)delegate
                       didFinish:(SEL)didFinish
                       didFailed:(SEL)didFailed
                        userInfo:(NSDictionary*)userInfo;

#pragma mark-
#pragma mark 用户举报、通知相关接口
//查询用户发布的通知信息
- (void)queryUserMessageInfoData:(NSString*)whereCause
                 whereCauseValue:(NSString*)whereCauseValue
                        delegate:(id)delegate
                       didFinish:(SEL)didFinish
                       didFailed:(SEL)didFailed
                        userInfo:(NSDictionary*)userInfo;

//创建用户通知信息
- (void)createImeterUserMessageData:(NSString*)senderId
                         recevierId:(NSString*)recevierId
                             avater:(NSString*)avater
                              title:(NSString*)title
                               type:(NSString*)type//信息类型 消息类型 默认为0 0 一般消息 1 系统消息
                            content:(NSString*)content
                           delegate:(id)delegate
                          didFinish:(SEL)didFinish
                          didFailed:(SEL)didFailed
                           userInfo:(NSDictionary*)userInfo;
// 删除通知信息
- (void)deleteImeterUserMessageData:(NSString*)attentionId
                      beAttentionId:(NSString*)beAttentionId
                           delegate:(id)delegate
                          didFinish:(SEL)didFinish
                          didFailed:(SEL)didFailed
                           userInfo:(NSDictionary*)userInfo;
//创建用户举报
- (void)createImeterUserReportData:(NSString*)reportId
                        beReportId:(NSString*)beReportId
                      beReportCode:(NSString*)beReportCode
                     reportContent:(NSString*)reportContent
                          delegate:(id)delegate
                         didFinish:(SEL)didFinish
                         didFailed:(SEL)didFailed
                          userInfo:(NSDictionary*)userInfo;

//创建用户的位置(纬度和经度)
- (void)createImeterUserLocationData:(NSString*)userId
                           longitude:(NSString*)longitude
                             address:(NSString*)address
                            latitude:(NSString*)latitude
                            delegate:(id)delegate
                           didFinish:(SEL)didFinish
                           didFailed:(SEL)didFailed
                            userInfo:(NSDictionary*)userInfo;

@end
