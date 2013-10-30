//
//  EasyExampleTest.m
//  EasyDevelop
//
//  Created by gyc on 6/22/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "EasyExampleTest.h"
#import "ASIHTTPRequest.h"
#import "NetworkHelper.h"

@implementation EasyExampleTest
#pragma mark-
#pragma mark init
- (void)dealloc
{
    [networksHelper release];
    networksHelper =nil;
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark-
#pragma mark ASIHTTPRequest Test
- (void) exampleASIHTTPRequestTest
{
   
    networksHelper =[[NetworkHelper  alloc] init];
    //查询用户的基本信息
    [networksHelper queryImeterUserInfoData:nil  delegate:self
                                  didFinish:@selector(didFinish:userInfo:)
                                  didFailed:@selector(didFailed:userInfo:)
                                   userInfo:nil];
    //创建新用户
//    [networksHelper createImeterUserData:@"101010"
//                                     age:@"19"
//                                  avater:@"19"
//                                   email:@"19@123.com"
//                                  mobile:@"19"
//                                username:@"19"
//                                    nick:@"19"
//                                     sex:@"1"
//                               signature:@"19"
//                                delegate:self
//                               didFinish:@selector(didFinish:userInfo:)
//                               didFailed:@selector(didFailed:userInfo:)
//                                userInfo:nil];
    //修改用户基本信息
//    NSMutableDictionary* dictionaryForText =[ NSMutableDictionary dictionary];
//    [dictionaryForText setValue:@"10762880" forKey:@"userId"];//必须添加
//     [dictionaryForText setValue:@"1000" forKey:@"age"];
//    [networksHelper updateImeterUserData:@"10762880"
//                              keyForText:dictionaryForText
//                              keyForFile:nil
//                                delegate:self
//                               didFinish:@selector(didFinish:userInfo:)
//                               didFailed:@selector(didFailed:userInfo:)
//                                userInfo:nil];
    

 //查询发布信息
//    [networksHelper queryImeterMessagesInfoData:@"publisherId"
//                                whereCauseValue:@"10001"
//                                delegate:self
//                             didFinish:@selector(didFinish:userInfo:)
//                                  didFailed:@selector(didFailed:userInfo:)
//                               userInfo:nil];
    
    //创建发布信息
//    [networksHelper createImeterPublishContentData:@"23r"
//                                       publisherId:@"101010"
//                                        contentUrl:@"101010"
//                                       contentDesc:@"101010"
//                                          delegate:self
//                                         didFinish:@selector(didFinish:userInfo:)
//                                         didFailed:@selector(didFailed:userInfo:)
//                                          userInfo:nil];


//修改发布消息
//    NSMutableDictionary* dictionaryForText =[ NSMutableDictionary dictionary];
//     [dictionaryForText setValue:@"10762880" forKey:@"publisherId"];//必须添加
//
//    [networksHelper updateImeterMessagesData:@"10762880"
//                                  keyForText:dictionaryForText
//                                  keyForFile:nil
//                                    delegate:self
//                                   didFinish:@selector(didFinish:userInfo:)
//                                   didFailed:@selector(didFailed:userInfo:)
//                                    userInfo:nil];
   

//查询评论信息
//    [networksHelper queryImeterCommentInfoData:@"id"
//                                  whereCauseValue:@"10001"
//                                    delegate:self
//                                didFinish:@selector(didFinish:userInfo:)
//                                    didFailed:@selector(didFailed:userInfo:)
//                                 userInfo:nil];
    
   
//创建评论信息
//    [networksHelper createImeterCommentData:@"101010"
//                                publisherId:@"101010"
//                                 contentUrl:@"101010"
//                                contentDesc:@"101010"
//                                     avater:@"101010"
//                                  delegate:self
//                               didFinish:@selector(didFinish:userInfo:)
//                                   didFailed:@selector(didFailed:userInfo:)
//                                userInfo:nil];
    
    
//查询我的好友信息
//    [networksHelper queryMyFriendsInfoData:@"id"
//                           whereCauseValue:@"10001"
//                                  delegate:self
//                                 didFinish:@selector(didFinish:userInfo:)
//                                     didFailed:@selector(didFailed:userInfo:)
//                                   userInfo:nil];
    

//创建我的好友
//    [networksHelper  createImeterMyFriendsData:@"10001"
//                                    myFriendId:@"10002"
//                                        avater:@"10001"
//                                          nick:@"10001"
//                                           sex:@"1"
//                                    delegate:self
//                                   didFinish:@selector(didFinish:userInfo:)
//                                        didFailed:@selector(didFailed:userInfo:)
//                                    userInfo:nil];
    
//删除我的好友
//    [networksHelper deleteImeterMyFriendsData:@"10001"
//                                   myFriendId:@"10002"
//                                     delegate:self
//                                    didFinish:@selector(didFinish:userInfo:)
//                                    didFailed:@selector(didFailed:userInfo:)
//                                      userInfo:nil];


//查询我的关注信息(失败)
//    [networksHelper queryUserAttentionInfoData:@"id"
//                               whereCauseValue:@"10001"
//                                         delegate:self
//                                        didFinish:@selector(didFinish:userInfo:)
//                                        didFailed:@selector(didFailed:userInfo:)
//                                        userInfo:nil];
    
//创建我的关注
//    [networksHelper createImeterAttentionData:@"10001"
//                                beAttentionId:@"10002"
//                                       avater:@"10001"
//                                         nick:@"10001" sex:@"1"
//                                     delegate:self
//                                    didFinish:@selector(didFinish:userInfo:)
//                                    didFailed:@selector(didFailed:userInfo:)
//                                     userInfo:nil];
 
    
//删除我的关注
//    [networksHelper deleteImeterAttentionData:@"10001"
//                                beAttentionId:@"10002"
//                                       delegate:self
//                                       didFinish:@selector(didFinish:userInfo:)
//                                     didFailed:@selector(didFailed:userInfo:)
//                                      userInfo:nil];
    
 //查询评价人
//    [networksHelper queryUserGoodnfoData:@"id"
//                         whereCauseValue:@"10001"
//                                          delegate:self
//                                          didFinish:@selector(didFinish:userInfo:)
//                                         didFailed:@selector(didFailed:userInfo:)
//                                         userInfo:nil];

//创建评价人
//    [networksHelper createImeterUserGoodData:@"10001"
//                               beAttentionId:@"10002"
//                                      avater:@"10001"
//                                        nick:@"10001"
//                                         sex:@"1"
//                                    delegate:self
//                                    didFinish:@selector(didFinish:userInfo:)
//                                      didFailed:@selector(didFailed:userInfo:)
//                                           userInfo:nil];

    
    //查询用户发布的通知信息
//    [networksHelper queryUserMessageInfoData:@"id"
//                             whereCauseValue:@"10001"
//                                     delegate:self
//                                     didFinish:@selector(didFinish:userInfo:)
//                                    didFailed:@selector(didFailed:userInfo:)
//                                            userInfo:nil];
    
    //创建用户通知
//    [networksHelper createImeterUserMessageData:@"10001"
//                                     recevierId:@"10002"
//                                         avater:@"10001"
//                                          title:@"10001"
//                                           type:@"0"
//                                        content:@"10001"
//                                        delegate:self
//                                        didFinish:@selector(didFinish:userInfo:)
//                                         didFailed:@selector(didFailed:userInfo:)
//                                            userInfo:nil];
    
    //删除通知
//    [networksHelper deleteImeterUserMessageData:@"10001"
//                                  beAttentionId:@"10002"
//                                           delegate:self
//                                           didFinish:@selector(didFinish:userInfo:)
//                                           didFailed:@selector(didFailed:userInfo:)
//                                            userInfo:nil];

    //创建用户举报
//    [networksHelper createImeterUserReportData:@"10001"
//                                    beReportId:@"10002"
//                                  beReportCode:@"10002"
//                                 reportContent:@"10002"
//                                      delegate:self
//                                        didFinish:@selector(didFinish:userInfo:)
//                                          didFailed:@selector(didFailed:userInfo:)
//                                           userInfo:nil];
    
    
    //创建用户的位置(纬度和经度)
//    [networksHelper createImeterUserLocationData:@"10001"
//                                       longitude:@"10001"
//                                         address:@"10001"
//                                        latitude:@"10001"
//                                         delegate:self
//                                          didFinish:@selector(didFinish:userInfo:)
//                                             didFailed:@selector(didFailed:userInfo:)
//                                            userInfo:nil];
    
}

-(void)didFinish:(id)result userInfo:(NSDictionary*)userInfo
{
    
    
    DDLogCVerbose(@"test～～～～～～～～～成功==%@",result);
    
    
}
-(void)didFailed:(NSError *)error userInfo:(NSDictionary*)userInfo
{
     DDLogCVerbose(@"test查询失败");
}

#pragma mark-
@end
