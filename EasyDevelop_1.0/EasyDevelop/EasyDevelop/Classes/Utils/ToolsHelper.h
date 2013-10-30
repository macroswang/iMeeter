//
//  ToolsHelper.h
//  EasyDevelop
//
//  Created by gyc on 8/11/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolsHelper : NSObject
#pragma mark-
#pragma mark 图片处理
//等比率缩放
+(UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;
//自定长宽
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;
@end
