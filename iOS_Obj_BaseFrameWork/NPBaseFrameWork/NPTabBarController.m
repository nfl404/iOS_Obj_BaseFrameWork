//
//  NPTabBarController.m
//  iOS_Obj_BaseFrameWork
//
//  Created by Mr nie on 16/3/15.
//  Copyright © 2016年 程序猿:NiePlus   博客地址:http://nieplus.blog.com. All rights reserved.
//

#import "NPTabBarController.h"
#import "NPNavigationController.h"
#import "ViewController.h"

@interface NPTabBarController ()

@end

@implementation NPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置tabbar上面的字 setTitleTextAttributes
    [self setTabBarTitleAttributesStyle];
    
    //初始化子视图1,2,3
    [self setChildVC:[[ViewController alloc]init] title:@"1号" image:@"" selectImgage:@""];
    [self setChildVC:[[UIViewController alloc]init] title:@"2号" image:@"" selectImgage:@""];
    [self setChildVC:[[UIViewController alloc]init] title:@"3号" image:@"" selectImgage:@""];
    
}

#pragma mark - 设置tabbar上面的字 setTitleTextAttributes
- (void)setTabBarTitleAttributesStyle
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    //通常字体大小
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    //通常字体颜色
    attrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    NSMutableDictionary *selectAttrs = [NSMutableDictionary dictionary];
    //选中字体大小
    selectAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    //选中字体颜色
    selectAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    //UI_APPEARANCE_SELECTOR 外观
    UITabBarItem *item = [UITabBarItem appearance];
    //tabbar通常字体样式
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    //tabbar选中字体样式
    [item setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
}

#pragma mark - 导航子视图封装
- (void)setChildVC:(UIViewController *)ChildVC title:(NSString *)title image:(NSString *)image selectImgage:(NSString *)selectImage {
    
    //注意视图层级关系，最上边时UINavigationController，创建一个视图即给一个UINavigationController
    NPNavigationController *nav = [[NPNavigationController alloc] initWithRootViewController:ChildVC];
    //子视图显示在UITabbarController上显示的tabbar标题
    nav.tabBarItem.title = title;
    //子视图显示在UITabbarController上未选中tabbar的图片
    nav.tabBarItem.image = [UIImage imageNamed:image];
    //子视图显示在UITabbarController上选中tabbar的图片
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    //子视图背景颜色
    nav.view.backgroundColor = [UIColor grayColor];
    //注意标题显示是子视图的标题，非UINavigationController
    ChildVC.navigationItem.title = title;
    //添加子视图
    [self addChildViewController:nav];
    
}
#pragma mark - 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
