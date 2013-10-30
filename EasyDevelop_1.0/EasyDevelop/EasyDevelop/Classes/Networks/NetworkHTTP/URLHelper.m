//
//  URLHelper.m
//  EasyDevelop
//
//  Created by gyc on 6/22/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "URLHelper.h"

@implementation URLHelper

#pragma mark -
#pragma mark Methord
//查询用户的基本信息(用户ID如果为空则表示查询所有用户)
+ (NSURL*) queryUserByUserId:(NSString*)userId
{
  

    NSString* urlStr =nil;
    if (userId)
    {
        urlStr =[NSString stringWithFormat:@"%@&userId=%@",kQueryUserInfoMethord,userId];
    }
    else
    {
      urlStr =[NSString stringWithFormat:@"%@",kQueryUserInfoMethord];
    }
    
    NSURL *requestURL =[NSURL URLWithString:urlStr];
    return requestURL;

   
}


//查询发布信息
//whereCause:查询条件，例如值: where publisherId='10001'
+ (NSURL*) queryPublishContentInfo:(NSString*)whereCause
             whereCauseValue:(NSString*)whereCauseValue
{
 
        NSString* urlStr =[NSString stringWithFormat:@"%@&%@=%@",kQueryPublishContentInfoMethord,whereCause,whereCauseValue];
        
    NSURL *requestURL =[NSURL URLWithString:urlStr];
    return requestURL;
}



//查询评论信息
//whereCause:查询条件，例如值: where publisherId='10001'
+ (NSURL*) queryCommentInfoMethord:(NSString*)whereCause
             whereCauseValue:(NSString*)whereCauseValue
{
    
    NSString* urlStr =[NSString stringWithFormat:@"%@&%@=%@",kQueryCommentInfoMethord ,whereCause,whereCauseValue];
    
    NSURL *requestURL =[NSURL URLWithString:urlStr];
    return requestURL;
}


//查询我的好友信息
//whereCause:查询条件，例如值: where publisherId='10001'
+ (NSURL*) queryMyFriendsInfoMethord:(NSString*)whereCause
                   whereCauseValue:(NSString*)whereCauseValue
{
    
    NSString* urlStr =[NSString stringWithFormat:@"%@&%@=%@",kQueryMyFriendsInfoMethord,whereCause,whereCauseValue];
    
    NSURL *requestURL =[NSURL URLWithString:urlStr];
    return requestURL;
}


//查询我的关注信息
//whereCause:查询条件，例如值: where publisherId='10001'
+ (NSURL*) queryUserAttentionInfoMethord:(NSString*)whereCause
                     whereCauseValue:(NSString*)whereCauseValue
{
    
    NSString* urlStr =[NSString stringWithFormat:@"%@&%@=%@",kQueryUserAttentionInfoMethord,whereCause,whereCauseValue];
    
    NSURL *requestURL =[NSURL URLWithString:urlStr];
    return requestURL;
}


//查询评价人
//whereCause:查询条件，例如值: where publisherId='10001'
+ (NSURL*) queryUserGoodInfoMethord:(NSString*)whereCause
                         whereCauseValue:(NSString*)whereCauseValue
{
    
    NSString* urlStr =[NSString stringWithFormat:@"%@&%@=%@", kQueryUserGoodInfoMethord,whereCause,whereCauseValue];
    
    NSURL *requestURL =[NSURL URLWithString:urlStr];
    return requestURL;
}


//查询用户发布的通知信息
//whereCause:查询条件，例如值: where publisherId='10001'
+ (NSURL*) queryUserMessageInfoMethord:(NSString*)whereCause
                    whereCauseValue:(NSString*)whereCauseValue
{
    
    NSString* urlStr =[NSString stringWithFormat:@"%@&%@=%@", kQueryUserMessageInfoMethord ,whereCause,whereCauseValue];
    
    NSURL *requestURL =[NSURL URLWithString:urlStr];
    return requestURL;
}


#pragma mark-
#pragma mark NSString 转URL
+ (NSURL*)requestURLWithString:(NSString*)urlStr
{

    NSURL*  returnURL =[NSURL URLWithString:urlStr];
    
    return returnURL;
}
@end
