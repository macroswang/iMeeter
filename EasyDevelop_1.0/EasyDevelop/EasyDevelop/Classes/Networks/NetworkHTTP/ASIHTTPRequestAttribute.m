//
//  ASIHTTPRequestAttribute.m
//  EasyDevelop
//
//  Created by gyc on 6/22/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "ASIHTTPRequestAttribute.h"

@implementation ASIHTTPRequestAttribute
@synthesize  requestType =_requestType;
@synthesize  cachePolicy         =_cachePolicy;//缓存缓存策略

@synthesize  requestDidFinishSelector =_requestDidFinishSelector;//请求成功后调用方法
@synthesize  requestDidFailSelector   =_requestDidFailSelector;//请求失败后调用方法

@synthesize  diskCachePath       =_diskCachePath;//缓存文件路径

@synthesize  isAllowResume     =_isAllowResume;
@synthesize  isBackDownLoad    =_isBackDownLoad;

@synthesize  destinationFile     =_destinationFile;//下载目标文件
@synthesize  temporaryFile       =_temporaryFile;//下载零时文件

@synthesize  downLoadProgressView =_downLoadProgressView; //下载进度条
@synthesize upLoadProgressView =_upLoadProgressView; //上传精度条
@synthesize isShowAccurateProgress =_isShowAccurateProgress;//是否显示精准进度条（默认为NO，不要设置零时文件）

@synthesize isSynchronous  =_isSynchronous;//是否为同步请求
@synthesize responseEncoding  =_responseEncoding;//设置请求编码（默认为UTF-8）

#pragma mark-
#pragma mark init
- (void)dealloc
{
    
    
    self.diskCachePath        =nil;
    
    self.destinationFile      =nil;
    self.temporaryFile  =nil;
    
    
    self.downLoadProgressView =nil;
    self.upLoadProgressView   =nil;
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        
        //设置默认值
        self.cachePolicy = ASIUseDefaultCachePolicy;
        self.isAllowResume =YES;
        self.isBackDownLoad =YES;
        //下载目录
        self.destinationFile =nil;
        self.temporaryFile   =nil;
        //上传下载精度条
        self.downLoadProgressView =nil;
        self.upLoadProgressView   =nil;
        self.isShowAccurateProgress =NO;
        
        //是否为同步请求
        self.isSynchronous =NO;//默认为异步
        
        self.responseEncoding =NSUTF8StringEncoding;
        
    }
    return self;
}



@end
