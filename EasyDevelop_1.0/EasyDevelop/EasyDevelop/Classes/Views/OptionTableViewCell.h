//
//  UIVodTableViewCell.h
//  CLM
//
//  Created by macros on 13-4-29.
//  Copyright (c) 2013年 MMIKU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptionTableViewCell : UITableViewCell
@property (retain, nonatomic)   IBOutlet UILabel *labContent;
@property (retain, nonatomic)     IBOutlet UILabel *labTitle;

@property (copy, nonatomic) NSString *content;
@property (copy, nonatomic) NSString *title;
@end
