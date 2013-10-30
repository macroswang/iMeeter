//
//  PersonSettingViewController.m
//  EasyDevelop
//
//  Created by macros wang on 13-9-7.
//  Copyright (c) 2013年 gyc. All rights reserved.
//

#import "PersonSettingViewController.h"
#import "UITableViewCell+CellShadows.h"

@interface PersonSettingViewController ()

@end

@implementation PersonSettingViewController
@synthesize optionCell;
@synthesize optionNib;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    UITableView *tview = [[[UITableView alloc] initWithFrame:CGRectMake(16, 146, 290, 255) style:UITableViewStyleGrouped]autorelease];
    [tview setDelegate:self];
    [tview setDataSource:self];
    [tview setScrollEnabled:NO];
    tview.backgroundView = nil;
    tview.window.backgroundColor = [UIColor colorWithRed:1.00f green:0.91f blue:0.82f alpha:1.00f];
    [self.view addSubview:tview];
    self.optionNib = [UINib nibWithNibName:@"OptionTableViewCell" bundle:nil];
    [tview registerNib:self.optionNib forCellReuseIdentifier:@"OptionCellIdentifier"];
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"个人设置";
    // Do any additional setup after loading the view.
    [self drawTableView];
}
-(void)drawTableView{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    int section = indexPath.section;
    int row = indexPath.row;
    static NSString *CellIdentifier = @"OptionCellIdentifier";
    
    optionCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (optionCell == nil)
    {
        optionCell = [[[OptionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]autorelease];
    }
        
        switch (section) {
            case 0:
                switch (row) {
                    case 0:
                        optionCell.title =  @"性别";
                        optionCell.content = @"男";
                        break;
                    case 1:
                        optionCell.title =  @"个性签名";
                        optionCell.content = @"给我一支烟，让所有烦恼都能过往如云烟";
                        break;
                    case 2:
                        optionCell.title =  @"你的位置";
                        optionCell.content = @"重庆市 巴南区";
                    default:
                        break;
                }
                break;
            case 1:
                if(row == 0)
                {
                    optionCell.title =  @"邮箱";
                    optionCell.content = @"6052571@qq.com";
                }else{
                    optionCell.title =  @"SeeOK账号";
                    optionCell.content = @"585858";
                }
                break;
            default:
                break;
        }
    return optionCell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidUnload{
    [self setOptionCell:nil];
    [self setOptionNib:nil];
}
-(void)dealloc{
    [super dealloc];
    [optionNib release];
    [optionCell release];
}
@end
