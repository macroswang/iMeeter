//
//  NetworkProgressView.h
//  EasyDevelop
//
//  Created by gyc on 6/22/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
//下载进度条
@protocol DownLoadProgressViewDelegate <NSObject>
@optional
-(void) didReceiveBytesForPercent:(ASIHTTPRequest *)request percent:(float)percent;
-(void) didReceiveWithPercent:(float)percent  userInfo:(NSDictionary*)userInfo;
@end

//上传进度条
@protocol UpLoadProgressViewDelegate <NSObject>
@optional
-(void) didSendBytesForPercent:(ASIHTTPRequest *)request percent:(float)percent;
-(void) didSendWithPercent:(float)percent  userInfo:(NSDictionary*)userInfo;
@end


@interface NetworkProgressView : UIProgressView<ASIProgressDelegate>
//delegate
@property(nonatomic ,assign) id  delegate;

@end
