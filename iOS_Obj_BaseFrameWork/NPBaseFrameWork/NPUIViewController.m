//
//  NPUIViewController.m
//  iOS_Obj_BaseFrameWork
//
//  Created by Mr nie on 16/4/11.
//  Copyright © 2016年 程序猿:NiePlus   博客地址:http://nieplus.blog.com. All rights reserved.
//

#import "NPUIViewController.h"

@implementation NPUIViewController

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    //代理置空，否则会闪退
    if ([self.navigationController       respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //开启iOS7的滑动返回效果
    if ([self.navigationController   respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        //只有在二级页面生效
        if ([self.navigationController.viewControllers count] == 2) {
            self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
        }
    }
}


@end
