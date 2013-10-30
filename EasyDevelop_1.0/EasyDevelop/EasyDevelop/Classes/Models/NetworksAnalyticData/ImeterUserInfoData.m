//
//  ImeterUserInfoData.m
//  EasyDevelop
//
//  Created by gyc on 7/13/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "ImeterUserInfoData.h"

@implementation ImeterUserInfoData

@synthesize        imeterUserInfo_channel;//
@synthesize        imeterUserInfo_createTime;//
@synthesize        imeterUserInfo_id;//
@synthesize        imeterUserInfo_machineCode;//
@synthesize        imeterUserInfo_userAge;//
@synthesize        imeterUserInfo_userEmail;//
@synthesize        imeterUserInfo_userId;//
@synthesize        imeterUserInfo_userMobile;//
@synthesize        imeterUserInfo_userName;//
@synthesize        imeterUserInfo_userNick;//
@synthesize        imeterUserInfo_userSex;//
@synthesize        imeterUserInfo_userSignature;//
@synthesize        imeterUserInfo_userAvater;//

#pragma mark-
#pragma mark init
- (void)dealloc
{
    self.imeterUserInfo_channel         =nil;
    self.imeterUserInfo_createTime     =nil;
    self.imeterUserInfo_id             =nil;
    self.imeterUserInfo_machineCode    =nil;
    self.imeterUserInfo_userAge        =nil;
    self.imeterUserInfo_userEmail      =nil;
    self.imeterUserInfo_userId         =nil;
    self.imeterUserInfo_userMobile      =nil;
    self.imeterUserInfo_userName        =nil;
    self.imeterUserInfo_userNick         =nil;
    self.imeterUserInfo_userSex         =nil;
    self.imeterUserInfo_userSignature    =nil;
    self.imeterUserInfo_userAvater     =nil;
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
