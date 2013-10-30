//
//  NetworkASIHTTPRequest.h
//  EasyDevelop
//
//  Created by gyc on 6/22/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequestAttribute.h"
@interface NetworkASIHTTPRequest : NSObject

@property(nonatomic,assign) id  delegate;
#pragma mark-
#pragma mark 方法
//init
+(id)initWithDelegate:(id)delegate;
//ASIHTTPRequest请求数据（GET）
- (void) requestWithASIHTTPRequest:(NSURL*)requestURL
                  requestAttribute:(ASIHTTPRequestAttribute*)requestAttribute
                          userInfo:(NSDictionary*)userInfo;
//ASIHttpRequest-发送数据(post)
-(void)sendDataWithASIFormDataRequest:(NSURL*)requestURL
                     requestAttribute:(ASIHTTPRequestAttribute*)requestAttribute
                           keyForText:(NSMutableDictionary*)keyForText
                           keyForFile:(NSMutableDictionary*)keyForFile
                             userInfo:(NSDictionary*)userInfo;
//文件下载
-(void)downLoadFileWithASIHTTPRequest:(NSURL*)requestURL
                     requestAttribute:(ASIHTTPRequestAttribute*)requestAttribute
                             userInfo:(NSDictionary*)userInfo;
@end
