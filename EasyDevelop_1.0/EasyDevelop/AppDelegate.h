//
//  AppDelegate.h
//  EasyDevelop
//
//  Created by gyc on 6/22/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EasyExampleTest;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    EasyExampleTest* exampleTest;
}

#pragma mark-
#pragma mark Methord
@property (strong, nonatomic) UIWindow *window;


@end
