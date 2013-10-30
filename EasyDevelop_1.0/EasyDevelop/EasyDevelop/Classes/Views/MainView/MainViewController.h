//
//  MainViewController.h
//  EasyDevelop
//
//  Created by gyc on 9/7/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REMenu.h"
@class PersonCenterController;
@interface MainViewController : UITableViewController{
    
}
@property (strong, nonatomic) PersonCenterController *personCenterController;
@property (strong, nonatomic) REMenu *menu;
@end
