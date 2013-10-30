//
//  ToolsHelper.m
//  EasyDevelop
//
//  Created by gyc on 8/11/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "ToolsHelper.h"

@implementation ToolsHelper
#pragma mark-
#pragma mark 图片处理
//等比率缩放
+(UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize

{
    
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
                                UIGraphicsEndImageContext();
 return scaledImage;
                                
    
}

//自定长宽
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize

{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    return reSizeImage;
    
}
@end
