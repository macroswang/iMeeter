//
//  MainViewCell.h
//  EasyDevelop
//
//  Created by gyc on 9/7/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIButton *btnUserHead;//用户头像

@property (retain, nonatomic) IBOutlet UILabel *userNameLabel;//用户名
@property (retain, nonatomic) IBOutlet UILabel *pulishLabel;//发布时间

@property (retain, nonatomic) IBOutlet UILabel *userIdiograph;//评论
@property (retain, nonatomic) IBOutlet UILabel *commentNameLabel;//评论人名字
@property (retain, nonatomic) IBOutlet UILabel *numComment;//评论数
@property (retain, nonatomic) IBOutlet UILabel *numDing;//赞过个数
@property (retain, nonatomic) IBOutlet UIButton *btnSeeComment;//查看评论
@property (retain, nonatomic) IBOutlet UIButton *btnSeeDing;//查看赞过的人
@property (retain, nonatomic) IBOutlet UIButton *btnComment;//评论
@property (retain, nonatomic) IBOutlet UIButton *btnMore;//跟多

@property (retain, nonatomic) IBOutlet UIButton *btnDing;//顶
@property (retain, nonatomic) IBOutlet UIButton *btnPublishImage;//发布的图片

@end
