//
//  AnalyticData.m
//  EasyDevelop
//
//  Created by gyc on 6/22/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "AnalyticData.h"
#import "JSONKit.h"
@implementation AnalyticData
static AnalyticData* _sharedAnalyticData  =nil;
#pragma mark -
#pragma mark 初始化
- (void)dealloc
{
    _sharedAnalyticData = nil;
    [super dealloc];
}

+(id)alloc
{
	NSAssert(_sharedAnalyticData == nil, @"Attempted to allocate a second instance of a singleton.");
	return [super alloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
+(id) allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if (_sharedAnalyticData == nil)
        {
            _sharedAnalyticData= [super allocWithZone:zone];
            return _sharedAnalyticData;
        }
    }
    return nil;
}
//init
+(AnalyticData*)sharedAnalyticData
{
    @synchronized(self)
    {
        if (!_sharedAnalyticData) {
            _sharedAnalyticData = [[AnalyticData alloc] init];
        }
        
        return _sharedAnalyticData;
    }
}
#pragma mark -
#pragma mark analyData
-(NSDictionary*)analyticReturnDataWithNSDictionary:(NSString*)jsonString
{
    
    
    NSDictionary *result = [jsonString  objectFromJSONString];
    
    return result;
    
}

-(NSArray*)analyticReturnDataWithNSArray:(NSString*)jsonString
{
    
    
    NSArray *result = [jsonString  objectFromJSONString];
    
    return result;
    
}
#pragma mark-
#pragma mark 判断服务器是否请求成功
//判断服务器请求返回参数
-(BOOL)serverResult:(NSString*)jsonString
{
    DDLogCVerbose(@"服务器请求返回:%@",jsonString);
    NSDictionary* result  =[self analyticReturnDataWithNSDictionary:jsonString];
    
    BOOL isSuccess =NO;
    
    if (result) {
        isSuccess = [[result objectForKey:@"isSuccess"] boolValue];
    }

    
    return isSuccess;
    
}

//服务器返回消息
-(NSString*)serverResultMessage:(NSString*)jsonString
{

    NSDictionary* result  =[self analyticReturnDataWithNSDictionary:jsonString];
    
    NSString* serverMessage =[result objectForKey:@"retMsg"];
    DDLogCInfo(@"服务器请求信息:%@",serverMessage);
    return serverMessage;
    
}



#pragma mark-
#pragma mark Test
//只能返回对象
- (NSNumber*) analyticForTest:(NSString*)jsonString
{
    DDLogCVerbose(@"测试数据返回成功");
    BOOL isSuccess =YES;
    
    
    return [NSNumber numberWithBool:isSuccess];

}

#pragma mark-
#pragma mark 用户的基本信息
//查询用户的基本信息
- (NSMutableArray*)queryImeterUserInfoData:(NSString*)jsonString
{
  
    NSDictionary* result  =[self analyticReturnDataWithNSDictionary:jsonString];
    NSArray *resultContent =[result objectForKey:@"result"];
    NSMutableArray* resultArray =[NSMutableArray arrayWithCapacity:1];
    for (int numResult=0; numResult<[resultContent count]; numResult++)
    {
        NSDictionary *resultInfo = [resultContent  objectAtIndex:numResult];
        ImeterUserInfoData* infoData =[[ImeterUserInfoData alloc] autorelease];
        
       infoData.imeterUserInfo_channel       =[resultInfo objectForKey:@"channel"];
        infoData.imeterUserInfo_createTime       =[resultInfo objectForKey:@"createTime"];
        infoData.imeterUserInfo_id       =[resultInfo objectForKey:@"id"];
        infoData.imeterUserInfo_machineCode       =[resultInfo objectForKey:@"machineCode"];
        infoData.imeterUserInfo_userAge      =[resultInfo objectForKey:@"userAge"];
        infoData.imeterUserInfo_userAvater       =[resultInfo objectForKey:@"userAvater"];
        infoData.imeterUserInfo_userId      =[resultInfo objectForKey:@"userId"];
        infoData.imeterUserInfo_userMobile       =[resultInfo objectForKey:@"userMobile"];
        infoData.imeterUserInfo_userName       =[resultInfo objectForKey:@"userName"];
        infoData.imeterUserInfo_userNick      =[resultInfo objectForKey:@"userNick"];
        infoData.imeterUserInfo_userSex       =[resultInfo objectForKey:@"userSex"];
        infoData.imeterUserInfo_userSignature       =[resultInfo objectForKey:@"userSignature"];

        
        
        //add array
        [resultArray addObject:infoData];
        
    }
            NSLog(@"resultContent==%@",resultContent);

    return resultArray;
}

@end
