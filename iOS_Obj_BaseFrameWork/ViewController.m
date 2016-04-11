//
//  ViewController.m
//  iOS_Obj_BaseFrameWork
//
//  Created by Mr nie on 16/3/15.
//  Copyright © 2016年 程序猿:NiePlus   博客地址:http://nieplus.blog.com. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加导航右侧按钮
    [self setViewControllerRightButtonItem];
}

#pragma mark - 添加导航右侧按钮
- (void)setViewControllerRightButtonItem
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"share" hightImage:@"share" target:self action:@selector(toShareViewcontroller)];
}

- (void)toShareViewcontroller
{
    SecondViewController *vc = [[SecondViewController alloc] init];
    [vc.view setBackgroundColor:[UIColor grayColor]];
    [vc.navigationItem setTitle:@"SecondViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
