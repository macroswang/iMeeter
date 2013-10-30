//
//  NetworkProgressView.m
//  EasyDevelop
//
//  Created by gyc on 6/22/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "NetworkProgressView.h"

@implementation NetworkProgressView
@synthesize delegate=_delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.delegate =nil;
    }
    return self;
}
-(void)dealloc{
    [super dealloc];
}


#pragma mark-
#pragma mark 下载进度delegate
- (void)request:(ASIHTTPRequest *)request didReceiveBytes:(long long)bytes
{
      DDLogCVerbose(@"已下载%f===是否完成=%i",self.progress*100,request.complete);
      float percent =self.progress*100;
    NSDictionary   *asiUserInfo = request.userInfo;
    NSDictionary   *userInfo =[asiUserInfo objectForKey:@"CLM_USERINFO"];
    
    
    if (self.delegate!=nil&&[self.delegate respondsToSelector:@selector(didReceiveWithPercent:userInfo:)])
    {
        
        //        [self.delegate didReceiveBytesForPercent:(ASIHTTPRequest *)request percent:self.progress*100];
        [self.delegate didReceiveWithPercent:percent userInfo:userInfo];
    }
}

#pragma mark-
#pragma mark 上传进度
- (void)request:(ASIHTTPRequest *)request didSendBytes:(long long)bytes
{
    
    DDLogCVerbose(@"已发送数据了===%f==是否完成==%i",self.progress*100,request.complete);
    float percent =self.progress*100;
    NSDictionary   *asiUserInfo = request.userInfo;
    NSDictionary   *userInfo =[asiUserInfo objectForKey:@"CLM_USERINFO"];
    if (self.delegate!=nil&&[self.delegate respondsToSelector:@selector(didSendWithPercent:userInfo:)])
    {
        
        //        [self.delegate didReceiveBytesForPercent:(ASIHTTPRequest *)request percent:self.progress*100];
        [self.delegate didSendWithPercent:percent userInfo:userInfo];
    }
}
@end
