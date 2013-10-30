//
//  MainViewCell.m
//  EasyDevelop
//
//  Created by gyc on 9/7/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "MainViewCell.h"

@implementation MainViewCell

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

- (void)dealloc {
    
    [_userNameLabel release];
    [_pulishLabel release];
    
    [_userIdiograph release];
    [_commentNameLabel release];
    [_numComment release];
    [_numDing release];
    [_btnSeeComment release];
    [_btnSeeDing release];
    [_btnMore release];
    [_btnComment release];
    [_btnDing release];
    [_btnUserHead release];
    [_btnPublishImage release];
    [super dealloc];
}
@end
