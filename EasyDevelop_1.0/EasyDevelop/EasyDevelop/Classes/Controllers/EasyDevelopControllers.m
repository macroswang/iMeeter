//
//  EasyDevelopControllers.m
//  EasyDevelop
//
//  Created by gyc on 7/2/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "EasyDevelopControllers.h"
#import "RootViewController.h"
#import "LoadingViewController.h"
#import "LoginViewController.h"
#import "MainViewController.h"
#import "PersonSettingViewController.h"
#import "PersonCenterController.h"
#import "HallViewController.h"
@implementation EasyDevelopControllers

static EasyDevelopControllers* _sharedEasyDevelopControllersInstance  =nil;
#pragma mark -
#pragma mark 初始化
- (void)dealloc
{
    _sharedEasyDevelopControllersInstance = nil;
    [super dealloc];
}

+(id)alloc
{
	NSAssert(_sharedEasyDevelopControllersInstance == nil, @"Attempted to allocate a second instance of a singleton.");
	return [super alloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
+(id) allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if (_sharedEasyDevelopControllersInstance == nil)
        {
            _sharedEasyDevelopControllersInstance= [super allocWithZone:zone];
            return _sharedEasyDevelopControllersInstance;
        }
    }
    return nil;
}
//init
+(EasyDevelopControllers*)sharedEasyDevelopControllers
{
    @synchronized(self)
    {
        if (!_sharedEasyDevelopControllersInstance) {
            _sharedEasyDevelopControllersInstance = [[EasyDevelopControllers alloc] init];
        }
        
        return _sharedEasyDevelopControllersInstance;
    }
}
#pragma mark -
#pragma mark RootViewController
- (RootViewController *)rootViewController
{
    return [[[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil]autorelease];
}

- (UINavigationController *)navigationRootViewController
{
    UINavigationController* baseNavigationController =  [[[UINavigationController alloc]
             initWithRootViewController:[self rootViewController]]autorelease];
    
     return  baseNavigationController;
}
#pragma mark -
#pragma mark LoadingViewController
- (LoadingViewController *)loadingViewController
{
    return [[[LoadingViewController alloc] initWithNibName:@"LoadingViewController" bundle:nil]autorelease];
}

- (UINavigationController *)navigationLoadingViewController
{
    UINavigationController* baseNavigationController = [[[UINavigationController alloc]
             initWithRootViewController:[self loadingViewController]]autorelease];
     return  baseNavigationController;
}
#pragma mark-
#pragma mark LoginViewController
- (LoginViewController *)loginViewController
{
    return [[[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil]autorelease];
}

- (UINavigationController *)navigationLoginViewController
{
    UINavigationController* baseNavigationController =[[[UINavigationController alloc]
             initWithRootViewController:[self loginViewController]]autorelease];
    
   
    return  baseNavigationController;
}
#pragma mark-
#pragma mark MainViewController
- (MainViewController *)mainViewController
{
    return [[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil]autorelease];
}

- (UINavigationController *)navigationMainViewController
{
    UINavigationController* baseNavigationController = [[[UINavigationController alloc]
                                                         initWithRootViewController:[self mainViewController]]autorelease];
    [baseNavigationController setNavigationBarHidden:NO animated:NO];
    return  baseNavigationController;
}


#pragma mark-


#pragma mark-
#pragma mark MainViewController
- (PersonSettingViewController *)personSettingViewController
{
    return [[[PersonSettingViewController alloc] initWithNibName:@"PersonSettingViewController" bundle:nil]autorelease];
}

- (UINavigationController *)navigationPersonSettingViewController
{
    UINavigationController* baseNavigationController = [[[UINavigationController alloc]
                                                         initWithRootViewController:[self personSettingViewController]]autorelease];
    [baseNavigationController setNavigationBarHidden:YES animated:NO];
    return  baseNavigationController;
}


#pragma mark-
#pragma mark HallViewController
- (HallViewController *)hallViewController
{
    return [[[HallViewController alloc] initWithNibName:@"HallViewController" bundle:nil]autorelease];
}

- (UINavigationController *)navigationHallViewController
{
    UINavigationController* baseNavigationController = [[[UINavigationController alloc]
                                                         initWithRootViewController:[self hallViewController]]autorelease];
    [baseNavigationController setNavigationBarHidden:NO animated:NO];
    return  baseNavigationController;
}

#pragma mark-
#pragma mark MainViewController
- (PersonCenterController *)personCenterController
{
    return [[[PersonCenterController alloc] initWithNibName:@"PersonCenterController" bundle:nil]autorelease];
}

- (UINavigationController *)navigationPersonCenterController
{
    UINavigationController* baseNavigationController = [[[UINavigationController alloc]
                                                         initWithRootViewController:[self personCenterController]]autorelease];
    [baseNavigationController setNavigationBarHidden:YES animated:NO];
    return  baseNavigationController;
}


#pragma mark-
@end
