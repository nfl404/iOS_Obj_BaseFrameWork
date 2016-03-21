//
//  NPNavigationController.m
//  iOS_Obj_BaseFrameWork
//
//  Created by Mr nie on 16/3/16.
//  Copyright © 2016年 程序猿:NiePlus   博客地址:http://nieplus.blog.com. All rights reserved.
//

#import "NPNavigationController.h"

@interface NPNavigationController ()

@end

@implementation NPNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //判断self.childViewControllers是不是拿到所有子控制器，self.childViewControllers.count为0时，只有子控制器，干掉返回按钮
    if (self.childViewControllers.count > 0) {
        //自定义返回按钮
        UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置title:返回
        [returnBtn setTitle:@"返回" forState:UIControlStateNormal];
        //正常下image
        [returnBtn setImage:[UIImage imageNamed:@"black"] forState:UIControlStateNormal];
        //高亮下image
        [returnBtn setImage:[UIImage imageNamed:@"grat"] forState:UIControlStateHighlighted];
        //正常下title颜色
        [returnBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //高亮下title颜色
        [returnBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        //设置按钮位置大小,注意这里位置无效果
        [returnBtn setFrame:CGRectMake(0, 0, 70, 20)];
        //按钮内部对齐
        [returnBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        //设置图片内部位置
        [returnBtn setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        //添加点击事件
        [returnBtn addTarget:self action:@selector(returnBtnClick) forControlEvents:UIControlEventTouchUpInside];
        //当视图推送时隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        //自定义push视图的leftBarButtonItem
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:returnBtn];
    }
    //子控制器通过这个方法推送视图
    [super pushViewController:viewController animated:animated];
}

- (void)returnBtnClick
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
