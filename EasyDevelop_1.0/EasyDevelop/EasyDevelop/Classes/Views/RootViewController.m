//
//  RootViewController.m
//  EasyDevelop
//
//  Created by gyc on 7/1/13.
//  Copyright (c) 2013 gyc. All rights reserved.
//

#import "RootViewController.h"
#import "UIImageView+WebCache.h"
@interface RootViewController ()

@end

@implementation RootViewController

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
    UIImageView *imageView =[[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)]autorelease];
    [imageView setImageWithURL:[NSURL URLWithString:@"http://f.hiphotos.baidu.com/album/w%3D310%3Bq%3D75/sign=271d6575d6ca7bcb7d7bc12e8e321a5e/7e3e6709c93d70cf6ed4f6bbf9dcd100baa12b5d.jpg"]  placeholderImage:[UIImage imageNamed:@"Spades_Ace.png"]];
    [self.view  addSubview:imageView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
