//
//  HallViewController.m
//  EasyDevelop
//
//  Created by gyc on 9/8/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "HallViewController.h"
#import "TMQuiltView.h"
#import "TMPhotoQuiltViewCell.h"

@interface HallViewController ()<TMQuiltViewDataSource,TMQuiltViewDelegate>
{
  
}
@property (nonatomic, retain) NSMutableArray *images;
@property (nonatomic, retain)  TMQuiltView *qtmquitView;
@end

@implementation HallViewController
@synthesize images = _images;
@synthesize  qtmquitView=_qtmquitView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.qtmquitView = [[TMQuiltView alloc] initWithFrame:CGRectZero];
	self.qtmquitView .delegate = self;
    self.qtmquitView .dataSource = self;
    self.qtmquitView .autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
   self.view =  self.qtmquitView;
    
    [self initNavigationBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)images
{
    if (!_images)
	{
        NSMutableArray *imageNames = [NSMutableArray array];
        for(int i = 0; i < 10; i++) {
            [imageNames addObject:[NSString stringWithFormat:@"%d.jpg", i % 10 + 1]];
        }
        _images = [imageNames retain];
    }
    return _images;
}


- (UIImage *)imageAtIndexPath:(NSIndexPath *)indexPath {
    return [UIImage imageNamed:[self.images objectAtIndex:indexPath.row]];
}



#pragma mark - TMQuiltViewDataSource

- (NSInteger)quiltViewNumberOfCells:(TMQuiltView *)quiltView {
     return [self.images count];
}

- (TMQuiltViewCell *)quiltView:(TMQuiltView *)quiltView cellAtIndexPath:(NSIndexPath *)indexPath {
    TMPhotoQuiltViewCell *cell = (TMPhotoQuiltViewCell *)[quiltView dequeueReusableCellWithReuseIdentifier:@"PhotoCell"];
    if (!cell) {
        cell = [[[TMPhotoQuiltViewCell alloc] initWithReuseIdentifier:@"PhotoCell"] autorelease];
    }
    
    cell.photoView.image = [self imageAtIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"%@", @"美女"];
  
    return cell;
}



#pragma mark- TMQuiltViewDelegate

- (void)quiltView:(TMQuiltView *)quiltView didSelectCellAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"你选中了%i个",indexPath.row);
}

// Must return a number of column greater than 0. Otherwise a default value is used.
- (NSInteger)quiltViewNumberOfColumns:(TMQuiltView *)quiltView
{
    
    return 2;

}

// Must return margins for all the possible values of TMQuiltViewMarginType. Otherwise a default value is used.
- (CGFloat)quiltViewMargin:(TMQuiltView *)quilView marginType:(TMQuiltViewMarginType)marginType
{
    return 10.0f;
}

// Must return the height of the requested cell
- (CGFloat)quiltView:(TMQuiltView *)quiltView heightForCellAtIndexPath:(NSIndexPath *)indexPath
{
   return [self imageAtIndexPath:indexPath].size.height / [self quiltViewNumberOfColumns:quiltView];
}

#pragma mark-
#pragma mark  导航
- (void) initNavigationBar
{
    
    
    //导航
    self.view.backgroundColor = [UIColor blackColor];
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
                                                    subtitle:@"Return to Home Screen"
                                                       image:[UIImage imageNamed:@"Icon_Home"]
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          NSLog(@"Item: %@", item);
                                                      }];
    
    REMenuItem *exploreItem = [[REMenuItem alloc] initWithTitle:@"Explore"
                                                       subtitle:@"Explore 47 additional options"
                                                          image:[UIImage imageNamed:@"Icon_Explore"]
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             NSLog(@"Item: %@", item);
                                                         }];
    
    REMenuItem *activityItem = [[REMenuItem alloc] initWithTitle:@"Activity"
                                                        subtitle:@"Perform 3 additional activities"
                                                           image:[UIImage imageNamed:@"Icon_Activity"]
                                                highlightedImage:nil
                                                          action:^(REMenuItem *item) {
                                                              NSLog(@"Item: %@", item);
                                                          }];
    
    REMenuItem *profileItem = [[REMenuItem alloc] initWithTitle:@"Profile"
                                                          image:[UIImage imageNamed:@"Icon_Profile"]
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             NSLog(@"Item: %@", item);
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
