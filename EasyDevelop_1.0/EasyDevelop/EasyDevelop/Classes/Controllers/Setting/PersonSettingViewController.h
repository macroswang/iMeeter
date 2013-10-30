//
//  PersonSettingViewController.h
//  EasyDevelop
//
//  Created by macros wang on 13-9-7.
//  Copyright (c) 2013年 gyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionTableViewCell.h"
@interface PersonSettingViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
}
@property (nonatomic, retain) OptionTableViewCell *optionCell;
@property (nonatomic, retain) UINib *optionNib;
@end
