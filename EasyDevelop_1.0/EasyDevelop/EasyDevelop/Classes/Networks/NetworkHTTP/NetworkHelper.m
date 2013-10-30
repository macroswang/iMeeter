//
//  NetworkHelper.m
//  EasyDevelop
//
//  Created by gyc on 6/22/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "NetworkHelper.h"
#import "AnalyticData.h"
#import "NetworkASIHTTPRequest.h"


#define   USER_DELEGATE              @"USER_DELEGATE"   //用户delegate     (不能为nil)
#define   USER_DIDFINISH             @"USER_DIDFINISH"  //用户定义回调成功方法(不能为nil)
#define   USER_DIDFAILED             @"USER_DIDFAILED"  //用户定义回调失败方法(不能为nil)
#define   USER_USERINFO              @"USER_USERINFO"   //用户定义UserInfo(需要放在最后可以为nil)
#define   USER_ANALYTIC_DATA              @"USER_ANALYTIC_DATA"   //用户定义解析方法(不能为nil)

#define   USER_DESTINATIONFILE       @"USER_DESTINATIONFILE"   //文件下载成功后的目标文件
#define   USER_TEMPORARYFILE         @"USER_TEMPORARYFILE"    //零时文件
@implementation NetworkHelper
#pragma mark-
#pragma mark init
- (void)dealloc
{
    
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
#pragma mark Request GET 
- (void) requestWithGET:(NSURL*)requestURL  //URL(必须)
            requestType:(RequestType)requestType //RequesTypeID(必须)
         diskCachePath :(NSString*)diskCachePath //缓存路径（可以为nil）
            cachePolicy:(ASICachePolicy)cachePolicy//存储策（可以为nil）
               delegate:(id)delegate
              didFinish:(SEL)didFinish
              didFailed:(SEL)didFailed
           analyticData:(SEL)analyticData
               userInfo:(NSDictionary*)userInfo
{
    

    
    DDLogCVerbose(@"didFinish方法===%@", NSStringFromSelector(didFinish));
    
    //ASIHTTP配置
    ASIHTTPRequestAttribute* requestAttribute =[[[ASIHTTPRequestAttribute alloc] init] autorelease];
    [requestAttribute  setRequestType:requestType];//请求requestTypeID
    [requestAttribute  setCachePolicy:cachePolicy];
    [requestAttribute  setDiskCachePath:diskCachePath];
    [requestAttribute  setRequestDidFinishSelector:@selector(didRequestFinished:)];
    [requestAttribute  setRequestDidFailSelector:@selector(didRequestFailed:)];
    
    //ASIHTTPUserInfo
    NSDictionary* asiUserInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                                 delegate,   USER_DELEGATE,
                                 NSStringFromSelector(didFinish),  USER_DIDFINISH,
                                 NSStringFromSelector(didFailed),  USER_DIDFAILED,
                                 NSStringFromSelector(analyticData), USER_ANALYTIC_DATA,
                                 userInfo,USER_USERINFO,
                                 nil];
    
   NetworkASIHTTPRequest*  networkRequest =[NetworkASIHTTPRequest initWithDelegate:self];
    [networkRequest requestWithASIHTTPRequest:requestURL requestAttribute:requestAttribute userInfo:asiUserInfo];
 


}

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
            userInfo:(NSDictionary*)userInfo
{
    
    //ASIHTTP配置
     ASIHTTPRequestAttribute* requestAttribute =[[[ASIHTTPRequestAttribute alloc] init] autorelease];
    [requestAttribute  setRequestType:requestType];//请求requestTypeID
    [requestAttribute  setRequestDidFinishSelector:@selector(didRequestFinished:)];
    [requestAttribute  setRequestDidFailSelector:@selector(didRequestFailed:)];
    
    //进度条
    if (progressView) {
        [requestAttribute setIsShowAccurateProgress:YES];
        [requestAttribute setUpLoadProgressView:progressView];//下载进度条设置
    }
    
    
    
    //ASIHTTPUserInfo
    NSDictionary* asiUserInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                                 delegate,   USER_DELEGATE,
                                 NSStringFromSelector(didFinish),  USER_DIDFINISH,
                                 NSStringFromSelector(didFailed),  USER_DIDFAILED,
                                 NSStringFromSelector(analyticData), USER_ANALYTIC_DATA,
                                 userInfo,USER_USERINFO,
                                 nil];
    
    
    NetworkASIHTTPRequest*  networkRequest =[NetworkASIHTTPRequest initWithDelegate:self];
    [networkRequest sendDataWithASIFormDataRequest:requestURL requestAttribute:requestAttribute keyForText:keyForText keyForFile:keyForFile userInfo:asiUserInfo];
    
}


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
                 userInfo:(NSDictionary*)userInfo
{
    
    //        NSLog(@"打印下载文件===%@==temp===%@",destinationFile,temporaryFile);
    
    //ASIHTTP配置
    ASIHTTPRequestAttribute* requestAttribute =[[[ASIHTTPRequestAttribute alloc] init] autorelease];

    [requestAttribute  setRequestType:requestType];//请求requestTypeID
    [requestAttribute setDestinationFile:destinationFile];
    [requestAttribute  setTemporaryFile:temporaryFile];
    
    [requestAttribute setRequestDidFinishSelector:@selector(didRequestFinished:)];
    [requestAttribute  setRequestDidFailSelector:@selector(didRequestFailed:)];
    //是否支持断点续传
    [requestAttribute  setIsAllowResume:YES];
    [requestAttribute  setIsBackDownLoad:YES];
    //进度条
    //下载进度条
    if (progressView) {
        [requestAttribute setIsShowAccurateProgress:YES];
        [requestAttribute setDownLoadProgressView:progressView];//下载进度条设置
    }
    
    
    //ASIHTTPUserInfo
    NSDictionary* asiUserInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                                 destinationFile,USER_DESTINATIONFILE,//文件下载成功的目标文件
                                 temporaryFile,USER_TEMPORARYFILE, //临时文件
                                 delegate,   USER_DELEGATE,
                                 NSStringFromSelector(didFinish),  USER_DIDFINISH,
                                 NSStringFromSelector(didFailed),  USER_DIDFAILED,
                                  NSStringFromSelector(analyticData), USER_ANALYTIC_DATA,
                                 userInfo,USER_USERINFO,
                                 nil];
    
    
   NetworkASIHTTPRequest*  networkRequest =[NetworkASIHTTPRequest initWithDelegate:self];
    //开始下载
    [networkRequest downLoadFileWithASIHTTPRequest:requestURL requestAttribute:requestAttribute userInfo:asiUserInfo];
    
}


#pragma mark-
#pragma mark request Delegate
//request success
- (void) didRequestFinished:(ASIHTTPRequest *)request
{
 
    
    NSDictionary   *asiUserInfo = request.userInfo;
    RequestType    requestTypeID =request.tag;
    NSString*     responeString =[request responseString];
   DDLogCVerbose(@"信息请求成功～～～～～～～～%i",requestTypeID);
     //用户配置
    id  delegate =[asiUserInfo objectForKey:USER_DELEGATE];
    NSString*   didFinishStr =(NSString*)[asiUserInfo objectForKey:USER_DIDFINISH];
    SEL         didFinish =NSSelectorFromString(didFinishStr);
    NSString*   didFailedStr =(NSString*)[asiUserInfo objectForKey:USER_DIDFAILED];
    SEL         didFailed =NSSelectorFromString(didFailedStr);//失败
    NSString*   analyticDataStr =(NSString*)[asiUserInfo objectForKey: USER_ANALYTIC_DATA];
    SEL         analyticData =NSSelectorFromString(analyticDataStr);//解析数据
    NSDictionary   *userInfo =[asiUserInfo objectForKey:USER_USERINFO];
    
    DDLogCVerbose(@"didFinishStr===%@\ndidFailedStr=%@==analyticDataStr===%@",didFinishStr,didFailedStr,analyticDataStr);
    
    BOOL isSuccess  =[[AnalyticData sharedAnalyticData] serverResult:responeString];
    if (isSuccess) {
              DDLogCVerbose(@"信息对应解析方法:%@",analyticDataStr);
        id  result= [[AnalyticData sharedAnalyticData] performSelector:analyticData withObject:responeString];
        if (delegate&&[delegate respondsToSelector:didFinish])
        {
            [delegate performSelector:didFinish withObject:result withObject:userInfo];
        }
    }
    else
    {
        if (delegate&&[delegate respondsToSelector:didFailed])
        {
           NSString*  message= [[AnalyticData sharedAnalyticData] serverResultMessage:responeString];
            
            NSError* error =[NSError errorWithDomain:message code:1111 userInfo:userInfo];
            [delegate performSelector:didFailed withObject:error withObject:userInfo];
        }
    
    }
    
    
}


- (void) didRequestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    DDLogError(@"服务器返回失败:%@",error);
    NSDictionary   *asiUserInfo = request.userInfo;
    //用户配置
    id  delegate =[asiUserInfo objectForKey:USER_DELEGATE];
    NSString*   didFailedStr =(NSString*)[asiUserInfo objectForKey:USER_DIDFAILED];
    SEL         didFailed =NSSelectorFromString(didFailedStr);//失败
    NSDictionary   *userInfo =[asiUserInfo objectForKey:USER_USERINFO];
    
    if (delegate&&[delegate respondsToSelector:didFailed])
    {
        [delegate performSelector:didFailed withObject:error withObject:userInfo];
    }
}

///////////////////////////////////////////////////////////////////////////
#pragma mark-
#pragma mark 用户的基本信息
//查询用户的基本信息
- (void)queryImeterUserInfoData:(NSString*)userId
                       delegate:(id)delegate
                      didFinish:(SEL)didFinish
                      didFailed:(SEL)didFailed
                       userInfo:(NSDictionary*)userInfo
{
    NSURL* requestURL = [URLHelper queryUserByUserId:nil];
    
    DDLogVerbose(@"%@_请求URL:%@",NSStringFromSelector(_cmd),requestURL);
    

    
      [self requestWithGET:requestURL
               requestType:kRequestTypeQueryImeterUserInfoData
             diskCachePath:nil
               cachePolicy:ASIUseDefaultCachePolicy
                  delegate:delegate
                 didFinish:didFinish
                 didFailed:didFailed
              analyticData:@selector(queryImeterUserInfoData:)
                  userInfo:userInfo];
    

}


//创建新用户
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
                    userInfo:(NSDictionary*)userInfo
{
    //post
    NSMutableDictionary* dictionaryForText =[ NSMutableDictionary dictionary];
     [dictionaryForText setValue:userId forKey:@"userId"];
     [dictionaryForText setValue:age forKey:@"age"];
     [dictionaryForText setValue:avater forKey:@"avater"];
     [dictionaryForText setValue:email forKey:@"email"];
     [dictionaryForText setValue:mobile forKey:@"mobile"];
     [dictionaryForText setValue:username forKey:@"username"];
     [dictionaryForText setValue:nick forKey:@"nick"];
     [dictionaryForText setValue:sex forKey:@"sex"];
     [dictionaryForText setValue:signature forKey:@"signature"];

 
    NSURL* requestURL = [URLHelper requestURLWithString:kCreateUserInfoMethord];
     [self requestWithPost:requestURL
               requestType:kRequestTypeCreateImeterUserData
                keyForText:dictionaryForText
                keyForFile:nil
              progressView:nil
                  delegate:delegate
                 didFinish:didFinish
                 didFailed:didFailed
              analyticData:@selector(serverResultMessage:)
                  userInfo:userInfo];
    


}

//修改用户基本信息
- (void)updateImeterUserData:(NSString*)userId
                  keyForText:(NSMutableDictionary*)keyForText
                  keyForFile:(NSMutableDictionary*)keyForFile
                    delegate:(id)delegate
                   didFinish:(SEL)didFinish
                   didFailed:(SEL)didFailed
                    userInfo:(NSDictionary*)userInfo
{
  
    
    
    NSURL* requestURL = [URLHelper requestURLWithString:kUpdateUserInfoMethord];//
    [self requestWithPost:requestURL
              requestType:kRequestTypeUpdateImeterUserData//
               keyForText:keyForText
               keyForFile:keyForFile
             progressView:nil
                 delegate:delegate
                didFinish:didFinish
                didFailed:didFailed
             analyticData:@selector(serverResultMessage:)//
                 userInfo:userInfo];
    
    
    
}

#pragma mark-
#pragma mark 信息发布相关接口
//查询发布信息
- (void)queryImeterMessagesInfoData:(NSString*)whereCause
                    whereCauseValue:(NSString*)whereCauseValue
                       delegate:(id)delegate
                      didFinish:(SEL)didFinish
                      didFailed:(SEL)didFailed
                       userInfo:(NSDictionary*)userInfo
{
    NSURL* requestURL = [URLHelper queryPublishContentInfo:whereCause whereCauseValue:whereCauseValue];
    
    DDLogVerbose(@"%@_请求URL:%@",NSStringFromSelector(_cmd),requestURL);

    [self requestWithGET:requestURL
             requestType:kRequestTypeQueryImeterMessagesInfoData
           diskCachePath:nil
             cachePolicy:ASIUseDefaultCachePolicy
                delegate:delegate
               didFinish:didFinish
               didFailed:didFailed
            analyticData:@selector(analyticForTest:)
                userInfo:userInfo];
    
    
}
//创建发布信息
- (void)createImeterPublishContentData:(NSString*)title
                         publisherId:(NSString*)publisherId
                      contentUrl:(NSString*)contentUrl
                       contentDesc:(NSString*)contentDesc
                    delegate:(id)delegate
                   didFinish:(SEL)didFinish
                   didFailed:(SEL)didFailed
                    userInfo:(NSDictionary*)userInfo
{
    //post
    NSMutableDictionary* dictionaryForText =[ NSMutableDictionary dictionary];
    [dictionaryForText setValue:title forKey:@"title"];
    [dictionaryForText setValue:publisherId forKey:@"publisherId"];
    [dictionaryForText setValue:contentUrl forKey:@"contentUrl"];
    [dictionaryForText setValue:contentDesc forKey:@"contentDesc"];
   
    
    
    NSURL* requestURL = [URLHelper requestURLWithString:kCreatePublishContentInfoMethord];
    [self requestWithPost:requestURL
              requestType:kRequestTypeCreateImeterPublishContent
               keyForText:dictionaryForText
               keyForFile:nil
             progressView:nil
                 delegate:delegate
                didFinish:didFinish
                didFailed:didFailed
             analyticData:@selector(serverResultMessage:)
                 userInfo:userInfo];
    
    
    
}

//修改发布信息
- (void)updateImeterMessagesData:(NSString*)publisherId
                  keyForText:(NSMutableDictionary*)keyForText
                  keyForFile:(NSMutableDictionary*)keyForFile
                    delegate:(id)delegate
                   didFinish:(SEL)didFinish
                   didFailed:(SEL)didFailed
                    userInfo:(NSDictionary*)userInfo
{
    
    
    
    NSURL* requestURL = [URLHelper requestURLWithString:kUpdatePublishContentInfoMethord];//
    [self requestWithPost:requestURL
              requestType:kRequestTypeUpdateImeterMessagesData//
               keyForText:keyForText
               keyForFile:keyForFile
             progressView:nil
                 delegate:delegate
                didFinish:didFinish
                didFailed:didFailed
             analyticData:@selector(serverResultMessage:)//
                 userInfo:userInfo];
    
    
    
}

//查询评论信息
- (void)queryImeterCommentInfoData:(NSString*)whereCause
                    whereCauseValue:(NSString*)whereCauseValue
                           delegate:(id)delegate
                          didFinish:(SEL)didFinish
                          didFailed:(SEL)didFailed
                           userInfo:(NSDictionary*)userInfo
{
    NSURL* requestURL = [URLHelper queryCommentInfoMethord:whereCause whereCauseValue:whereCauseValue];
    
    DDLogVerbose(@"%@_请求URL:%@",NSStringFromSelector(_cmd),requestURL);
    
    [self requestWithGET:requestURL
             requestType:kRequestTypeQueryImeterCommentInfoData
           diskCachePath:nil
             cachePolicy:ASIUseDefaultCachePolicy
                delegate:delegate
               didFinish:didFinish
               didFailed:didFailed
            analyticData:@selector(analyticForTest:)
                userInfo:userInfo];
    
    
}

//创建评论信息
- (void)createImeterCommentData:(NSString*)userId	
                           publisherId:(NSString*)beUserId
                            contentUrl:(NSString*)commentCode
                           contentDesc:(NSString*)commentContent
                         avater:(NSString*)avater
                              delegate:(id)delegate
                             didFinish:(SEL)didFinish
                             didFailed:(SEL)didFailed
                              userInfo:(NSDictionary*)userInfo
{
    //post
    NSMutableDictionary* dictionaryForText =[ NSMutableDictionary dictionary];
    [dictionaryForText setValue:userId	 forKey:@"userId"];
    [dictionaryForText setValue:beUserId forKey:@"beUserId"];
    [dictionaryForText setValue:commentCode forKey:@"commentCode"];
    [dictionaryForText setValue:commentContent forKey:@"commentContent"];
    [dictionaryForText setValue:avater forKey:@"avater"];
    
    
    
    NSURL* requestURL = [URLHelper requestURLWithString:kCreateCommentInfoMethord];
    [self requestWithPost:requestURL
              requestType:kRequestTypeCreateImeterCommentData
               keyForText:dictionaryForText
               keyForFile:nil
             progressView:nil
                 delegate:delegate
                didFinish:didFinish
                didFailed:didFailed
             analyticData:@selector(serverResultMessage:)
                 userInfo:userInfo];
    
    
    
}

#pragma mark-
#pragma mark  用户好友、关注相关接口
//查询我的好友信息
- (void)queryMyFriendsInfoData:(NSString*)whereCause
                   whereCauseValue:(NSString*)whereCauseValue
                          delegate:(id)delegate
                         didFinish:(SEL)didFinish
                         didFailed:(SEL)didFailed
                          userInfo:(NSDictionary*)userInfo
{
    NSURL* requestURL = [URLHelper queryMyFriendsInfoMethord:whereCause whereCauseValue:whereCauseValue];
    
    DDLogVerbose(@"%@_请求URL:%@",NSStringFromSelector(_cmd),requestURL);
    
    [self requestWithGET:requestURL
             requestType:kRequestTypeQueryMyFriendsInfoData
           diskCachePath:nil
             cachePolicy:ASIUseDefaultCachePolicy
                delegate:delegate
               didFinish:didFinish
               didFailed:didFailed
            analyticData:@selector(analyticForTest:)
                userInfo:userInfo];
    
    
}

//创建我的好友
- (void)createImeterMyFriendsData:(NSString*)userId
                    myFriendId:(NSString*)myFriendId
                     avater:(NSString*)avater	
                    nick:(NSString*)nick
                         sex:(NSString*)sex
                       delegate:(id)delegate
                      didFinish:(SEL)didFinish
                      didFailed:(SEL)didFailed
                       userInfo:(NSDictionary*)userInfo
{
    //post
    NSMutableDictionary* dictionaryForText =[ NSMutableDictionary dictionary];
    [dictionaryForText setValue:userId	 forKey:@"userId"];
    [dictionaryForText setValue:myFriendId forKey:@"myFriendId"];
    [dictionaryForText setValue:avater forKey:@"avater"];
    [dictionaryForText setValue:nick forKey:@"nick"];
    [dictionaryForText setValue:sex forKey:@"sex"];
    
    
    
    NSURL* requestURL = [URLHelper requestURLWithString:kCreateMyFriendsInfoMethord];
    [self requestWithPost:requestURL
              requestType:kRequestTypeCreateImeterMyFriendsData
               keyForText:dictionaryForText
               keyForFile:nil
             progressView:nil
                 delegate:delegate
                didFinish:didFinish
                didFailed:didFailed
             analyticData:@selector(serverResultMessage:)
                 userInfo:userInfo];
    
    
    
}

//删除我的好友
- (void)deleteImeterMyFriendsData:(NSString*)userId
                       myFriendId:(NSString*)myFriendId
                         delegate:(id)delegate
                        didFinish:(SEL)didFinish
                        didFailed:(SEL)didFailed
                         userInfo:(NSDictionary*)userInfo
{
    //post
    NSMutableDictionary* dictionaryForText =[ NSMutableDictionary dictionary];
    [dictionaryForText setValue:userId	 forKey:@"userId"];
    [dictionaryForText setValue:myFriendId forKey:@"myFriendId"];
 
    
    
    
    NSURL* requestURL = [URLHelper requestURLWithString:kDeleteMyFriendsInfoMethord];
    [self requestWithPost:requestURL
              requestType:kRequestTypeDeleteImeterMyFriendsData
               keyForText:dictionaryForText
               keyForFile:nil
             progressView:nil
                 delegate:delegate
                didFinish:didFinish
                didFailed:didFailed
             analyticData:@selector(serverResultMessage:)
                 userInfo:userInfo];
    
    
    
}

//查询我的关注信息
- (void)queryUserAttentionInfoData:(NSString*)whereCause
               whereCauseValue:(NSString*)whereCauseValue
                      delegate:(id)delegate
                     didFinish:(SEL)didFinish
                     didFailed:(SEL)didFailed
                      userInfo:(NSDictionary*)userInfo
{
    NSURL* requestURL = [URLHelper queryUserAttentionInfoMethord:whereCause whereCauseValue:whereCauseValue];
    
    DDLogVerbose(@"%@_请求URL:%@",NSStringFromSelector(_cmd),requestURL);
    
    [self requestWithGET:requestURL
             requestType:kRequestTypeQueryUserAttentionInfoData
           diskCachePath:nil
             cachePolicy:ASIUseDefaultCachePolicy
                delegate:delegate
               didFinish:didFinish
               didFailed:didFailed
            analyticData:@selector(analyticForTest:)
                userInfo:userInfo];
    
    
}


//创建我的关注
- (void)createImeterAttentionData:(NSString*)attentionId
                       beAttentionId:(NSString*)beAttentionId
                           avater:(NSString*)avater
                             nick:(NSString*)nick
                              sex:(NSString*)sex
                         delegate:(id)delegate
                        didFinish:(SEL)didFinish
                        didFailed:(SEL)didFailed
                         userInfo:(NSDictionary*)userInfo
{
    //post
    NSMutableDictionary* dictionaryForText =[ NSMutableDictionary dictionary];
    [dictionaryForText setValue:attentionId	 forKey:@"attentionId"];
    [dictionaryForText setValue:beAttentionId forKey:@"beAttentionId"];
    [dictionaryForText setValue:avater forKey:@"avater"];
    [dictionaryForText setValue:nick forKey:@"nick"];
    [dictionaryForText setValue:sex forKey:@"sex"];
    
    
    
    NSURL* requestURL = [URLHelper requestURLWithString:kCreateAttentionInfoMethord];
    [self requestWithPost:requestURL
              requestType:kRequestTypeCreateImeterAttentionData
               keyForText:dictionaryForText
               keyForFile:nil
             progressView:nil
                 delegate:delegate
                didFinish:didFinish
                didFailed:didFailed
             analyticData:@selector(serverResultMessage:)
                 userInfo:userInfo];
    
    
    
}

//删除我的关注
- (void)deleteImeterAttentionData:(NSString*)attentionId
                       beAttentionId:(NSString*)beAttentionId
                         delegate:(id)delegate
                        didFinish:(SEL)didFinish
                        didFailed:(SEL)didFailed
                         userInfo:(NSDictionary*)userInfo
{
    //post
    NSMutableDictionary* dictionaryForText =[ NSMutableDictionary dictionary];
    [dictionaryForText setValue:attentionId	 forKey:@"attentionId"];
    [dictionaryForText setValue:beAttentionId forKey:@"beAttentionId"];
    
    
    
    
    NSURL* requestURL = [URLHelper requestURLWithString:kDeleteAttentionInfoMethord];
    [self requestWithPost:requestURL
              requestType:kRequestTypeDeleteImeterAttentionData
               keyForText:dictionaryForText
               keyForFile:nil
             progressView:nil
                 delegate:delegate
                didFinish:didFinish
                didFailed:didFailed
             analyticData:@selector(serverResultMessage:)
                 userInfo:userInfo];
    
    
    
}

//查询评价人
- (void)queryUserGoodnfoData:(NSString*)whereCause
                   whereCauseValue:(NSString*)whereCauseValue
                          delegate:(id)delegate
                         didFinish:(SEL)didFinish
                         didFailed:(SEL)didFailed
                          userInfo:(NSDictionary*)userInfo
{
    NSURL* requestURL = [URLHelper queryUserGoodInfoMethord:whereCause whereCauseValue:whereCauseValue];
    
    DDLogVerbose(@"%@_请求URL:%@",NSStringFromSelector(_cmd),requestURL);
    
    [self requestWithGET:requestURL
             requestType:kRequestTypeQueryUserGoodnfoData
           diskCachePath:nil
             cachePolicy:ASIUseDefaultCachePolicy
                delegate:delegate
               didFinish:didFinish
               didFailed:didFailed
            analyticData:@selector(analyticForTest:)
                userInfo:userInfo];
    
    
}

//创建评价人
- (void)createImeterUserGoodData:(NSString*)goodId	
                    beAttentionId:(NSString*)beAttentionId
                           avater:(NSString*)avater
                             nick:(NSString*)nick
                              sex:(NSString*)sex
                         delegate:(id)delegate
                        didFinish:(SEL)didFinish
                        didFailed:(SEL)didFailed
                         userInfo:(NSDictionary*)userInfo
{
    //post
    NSMutableDictionary* dictionaryForText =[ NSMutableDictionary dictionary];
    [dictionaryForText setValue:goodId		 forKey:@"goodId"];
    [dictionaryForText setValue:beAttentionId forKey:@"beAttentionId"];
    [dictionaryForText setValue:avater forKey:@"avater"];
    [dictionaryForText setValue:nick forKey:@"nick"];
    [dictionaryForText setValue:sex forKey:@"sex"];
    
    
    
    NSURL* requestURL = [URLHelper requestURLWithString:kCreateUserGoodInfoMethord];
    [self requestWithPost:requestURL
              requestType:kRequestTypeCreateImeterUserGoodData
               keyForText:dictionaryForText
               keyForFile:nil
             progressView:nil
                 delegate:delegate
                didFinish:didFinish
                didFailed:didFailed
             analyticData:@selector(serverResultMessage:)
                 userInfo:userInfo];
    
    
    
}

#pragma mark-
#pragma mark 用户举报、通知相关接口
//查询用户发布的通知信息
- (void)queryUserMessageInfoData:(NSString*)whereCause
                   whereCauseValue:(NSString*)whereCauseValue
                          delegate:(id)delegate
                         didFinish:(SEL)didFinish
                         didFailed:(SEL)didFailed
                          userInfo:(NSDictionary*)userInfo
{
    NSURL* requestURL = [URLHelper queryUserMessageInfoMethord:whereCause whereCauseValue:whereCauseValue];
    
    DDLogVerbose(@"%@_请求URL:%@",NSStringFromSelector(_cmd),requestURL);
    
    [self requestWithGET:requestURL
             requestType:kRequestTypeQueryUserMessageInfoData
           diskCachePath:nil
             cachePolicy:ASIUseDefaultCachePolicy
                delegate:delegate
               didFinish:didFinish
               didFailed:didFailed
            analyticData:@selector(analyticForTest:)
                userInfo:userInfo];
    
    
}


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
                        userInfo:(NSDictionary*)userInfo
{
    //post
    NSMutableDictionary* dictionaryForText =[ NSMutableDictionary dictionary];
    [dictionaryForText setValue:senderId		 forKey:@"senderId"];
    [dictionaryForText setValue:recevierId forKey:@"recevierId"];
    [dictionaryForText setValue:avater forKey:@"avater"];
    [dictionaryForText setValue:title forKey:@"title"];
    [dictionaryForText setValue:content forKey:@"content"];
    [dictionaryForText setValue:type forKey:@"type"];
    
    
    
    NSURL* requestURL = [URLHelper requestURLWithString:kCreateUserMessageInfoMethord];
    [self requestWithPost:requestURL
              requestType:kRequestTypeCreateImeterUserMessageData
               keyForText:dictionaryForText
               keyForFile:nil
             progressView:nil
                 delegate:delegate
                didFinish:didFinish
                didFailed:didFailed
             analyticData:@selector(serverResultMessage:)
                 userInfo:userInfo];
    
    
    
}

// 删除通知信息
- (void)deleteImeterUserMessageData:(NSString*)attentionId
                    beAttentionId:(NSString*)beAttentionId
                         delegate:(id)delegate
                        didFinish:(SEL)didFinish
                        didFailed:(SEL)didFailed
                         userInfo:(NSDictionary*)userInfo
{
    //post
    NSMutableDictionary* dictionaryForText =[ NSMutableDictionary dictionary];
    [dictionaryForText setValue:attentionId	 forKey:@"attentionId"];
    [dictionaryForText setValue:beAttentionId forKey:@"beAttentionId"];
    
    
    
    
    NSURL* requestURL = [URLHelper requestURLWithString:kDeleteUserMessageInfoMethord ];
    [self requestWithPost:requestURL
              requestType:kRequestTypeDeleteImeterUserMessageData
               keyForText:dictionaryForText
               keyForFile:nil
             progressView:nil
                 delegate:delegate
                didFinish:didFinish
                didFailed:didFailed
             analyticData:@selector(serverResultMessage:)
                 userInfo:userInfo];
    
    
    
}

//创建用户举报
- (void)createImeterUserReportData:(NSString*)reportId
                         beReportId:(NSString*)beReportId
                             beReportCode:(NSString*)beReportCode
                              reportContent:(NSString*)reportContent
                           delegate:(id)delegate
                          didFinish:(SEL)didFinish
                          didFailed:(SEL)didFailed
                           userInfo:(NSDictionary*)userInfo
{
    //post
    NSMutableDictionary* dictionaryForText =[ NSMutableDictionary dictionary];
    [dictionaryForText setValue:reportId		 forKey:@"reportId"];
    [dictionaryForText setValue:beReportId forKey:@"beReportId"];
    [dictionaryForText setValue:beReportCode forKey:@"beReportCode"];
    [dictionaryForText setValue:reportContent forKey:@"reportContent"];
  
    
    
    NSURL* requestURL = [URLHelper requestURLWithString:kCreateUserReportInfoMethord];
    [self requestWithPost:requestURL
              requestType:kRequestTypeCreateImeterUserReportData
               keyForText:dictionaryForText
               keyForFile:nil
             progressView:nil
                 delegate:delegate
                didFinish:didFinish
                didFailed:didFailed
             analyticData:@selector(serverResultMessage:)
                 userInfo:userInfo];
    
    
    
}

//更新用户举报
//- (void)updateImeterUserReportIData:(NSString*)reportId
//                      keyForText:(NSMutableDictionary*)keyForText
//                      keyForFile:(NSMutableDictionary*)keyForFile
//                        delegate:(id)delegate
//                       didFinish:(SEL)didFinish
//                       didFailed:(SEL)didFailed
//                        userInfo:(NSDictionary*)userInfo
//{
//    
//    
//    
//    NSURL* requestURL = [URLHelper requestURLWithString:kUpdateUserReportInfoMethord];//
//    [self requestWithPost:requestURL
//              requestType:kRequestTypeUpdateImeterUserReportIData//
//               keyForText:keyForText
//               keyForFile:keyForFile
//             progressView:nil
//                 delegate:delegate
//                didFinish:didFinish
//                didFailed:didFailed
//             analyticData:@selector(serverResultMessage:)//
//                 userInfo:userInfo];
//    
//    
//    
//}

//创建用户的位置(纬度和经度)
- (void)createImeterUserLocationData:(NSString*)userId
                        longitude:(NSString*)longitude
                      address:(NSString*)address
                     latitude:(NSString*)latitude
                          delegate:(id)delegate
                         didFinish:(SEL)didFinish
                         didFailed:(SEL)didFailed
                          userInfo:(NSDictionary*)userInfo
{
    //post
    NSMutableDictionary* dictionaryForText =[ NSMutableDictionary dictionary];
    [dictionaryForText setValue:latitude		 forKey:@"latitude"];
    [dictionaryForText setValue:longitude forKey:@"longitude"];
    [dictionaryForText setValue:address forKey:@"address"];
    [dictionaryForText setValue:userId forKey:@"userId"];
    
    
    
    NSURL* requestURL = [URLHelper requestURLWithString:kCreateUserLocationInfoMethord];
    
    [self requestWithPost:requestURL
              requestType:kRequestTypeCreateImeterUserLocationData
               keyForText:dictionaryForText
               keyForFile:nil
             progressView:nil
                 delegate:delegate
                didFinish:didFinish
                didFailed:didFailed
             analyticData:@selector(serverResultMessage:)
                 userInfo:userInfo];
    
    
    
}

@end
