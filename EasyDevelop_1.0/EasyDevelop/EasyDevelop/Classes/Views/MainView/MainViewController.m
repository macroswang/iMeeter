//
//  MainViewController.m
//  EasyDevelop
//
//  Created by gyc on 9/7/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "MainViewController.h"
#import "MainViewCell.h"
#import "PersonCenterController.h"
@interface MainViewController ()
{
   BOOL nibsRegistered ;
}
@end

@implementation MainViewController
@synthesize personCenterController = _personCenterController;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   //init Navigation
    [self initNavigationBar];
    //init view
    nibsRegistered =NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"Cell";
    
    //普通view
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"MainViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:cellIdentifier];
        
        nibsRegistered =YES;
    }
    
    MainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[MainViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }


    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}


#pragma mark-
#pragma mark  导航
- (void) initNavigationBar
{


    //导航
    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1.000];
    //    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0 green:179/255.0 blue:134/255.0 alpha:1];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"topbar.png"] forBarMetrics:UIBarMetricsDefault ];
    
    //    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"home.png" style:UIBarButtonItemStyleBordered target:self action:@selector(showMenu)];
    
    //    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Icon_Home.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    leftButton.frame = CGRectMake(0, 0, 45, 45);
    
    [leftButton setImage:[UIImage imageNamed:@"Icon_Home.png"] forState:UIControlStateNormal];
    
    [leftButton setImage:[UIImage imageNamed:@"Icon_Home.png"] forState:UIControlStateHighlighted];
    
    
    [leftButton addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[[UIBarButtonItem alloc] initWithCustomView:leftButton] autorelease];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
    [rightButton setImage:[UIImage imageNamed:@"Icon_Profile.png"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"Icon_Profile.png"] forState:UIControlStateHighlighted];
    [rightButton addTarget:self action:@selector(showRightMenu) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    [rightButton release];
    self.navigationItem.rightBarButtonItem = rightItem;
    [rightItem release];

    
    UIFont * font=[UIFont fontWithName:@"Zapfino" size:16.0f];
    UIButton *titleLabel = [UIButton buttonWithType:UIButtonTypeCustom];
    [titleLabel setFrame:CGRectMake(0, 10, 150, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];  //设置Label背景透明
    titleLabel.titleLabel.font = [UIFont boldSystemFontOfSize:20];  //设置文本字体与大小
    titleLabel.titleLabel.textColor =  [UIColor colorWithWhite:1.0 alpha:1.000];  //设置文本颜色
    titleLabel.titleLabel.textAlignment = UITextAlignmentCenter;
    titleLabel.titleLabel.font = font;
    [titleLabel setTitle:@"See Ok" forState:UIControlStateNormal];
    [titleLabel addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0 , 150, 44)];
    titleView.backgroundColor=[UIColor clearColor];
    [titleView addSubview:titleLabel];
    self.navigationItem.titleView = titleView;
    [titleView release];//release titleView
    
//    UIButton* titleButton =[[UIButton alloc] initWithFrame:CGRectMake(10, 0, 320, 30)];
//    titleButton.titleLabel.text =@"See Ok";
//    UIFont * font=[UIFont fontWithName:@"Brush Script Std" size:18.0f];
//    titleButton.titleLabel.font =font;
//    self.navigationItem.titleView = titleButton;
////    [self.navigationItem.titleView addSubview:titleButton];
//    [titleButton release];
    // Uncomment the following line to preserve selection between presentations.
    //     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//   self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)showMenu
{
    if (_menu.isOpen)
        return [_menu close];
    
    // Sample icons from http://icons8.com/download-free-icons-for-ios-tab-bar
    //
    
    REMenuItem *homeItem = [[REMenuItem alloc] initWithTitle:@"首页"
                                                    subtitle:@""
                                                       image:[UIImage imageNamed:@"Icon_Home"]
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          NSLog(@"Item: %@", item);
                                                      }];
    
    REMenuItem *exploreItem = [[REMenuItem alloc] initWithTitle:@"广场"
                                                       subtitle:@""
                                                          image:[UIImage imageNamed:@"Icon_Explore"]
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             NSLog(@"Item: %@", item);
                                                         }];
    
    REMenuItem *activityItem = [[REMenuItem alloc] initWithTitle:@"消息"
                                                        subtitle:@""
                                                           image:[UIImage imageNamed:@"Icon_Activity"]
                                                highlightedImage:nil
                                                          action:^(REMenuItem *item) {
                                                              NSLog(@"Item: %@", item);
                                                          }];
    
    REMenuItem *profileItem = [[REMenuItem alloc] initWithTitle:@"个人中心"
                                                          image:[UIImage imageNamed:@"Icon_Profile"]
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             NSLog(@"Item: %@", item);
                                                             if (_personCenterController==nil) {
                                                                 _personCenterController = [[PersonCenterController alloc]initWithNibName:@"PersonCenterController.xib" bundle:nil];
                                                             }
                                                         }];
    
    homeItem.tag = 0;
    exploreItem.tag = 1;
    activityItem.tag = 2;
    profileItem.tag = 3;
    
    _menu = [[REMenu alloc] initWithItems:@[homeItem, exploreItem, activityItem, profileItem]];
    _menu.cornerRadius = 4;
    _menu.shadowColor = [UIColor blackColor];
    _menu.shadowOffset = CGSizeMake(0, 1);
    _menu.shadowOpacity = 1;
    _menu.imageOffset = CGSizeMake(5, -1);
    
    [_menu showFromNavigationController:self.navigationController];
}

- (void)showRightMenu
{
    NSLog(@"点击了相机图标");
}
#pragma mark -

@end
