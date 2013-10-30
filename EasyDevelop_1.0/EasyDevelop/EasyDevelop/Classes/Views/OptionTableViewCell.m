//
//  UIVodTableViewCell.m
//  CLM
//
//  Created by macros on 13-4-29.
//  Copyright (c) 2013年 MMIKU. All rights reserved.
//

#import "OptionTableViewCell.h"

@implementation OptionTableViewCell
@synthesize labTitle;
@synthesize labContent;
@synthesize title;
@synthesize content;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setTitle:(NSString *)_title{
    if (![_title isEqualToString:title]) {
        title = [_title copy];
        self.labTitle.text = title;
    }
    labTitle.text = _title;
}
-(void)setContent:(NSString *)_content{
    if (![_content isEqual:content]) {
        content = [_content copy];
        self.labContent.text = content;
    }
}
- (void)dealloc {
    [labTitle release];
    [labContent release];
    [super dealloc];
}
@end
