//
//  SecondViewController.m
//  iOS_Obj_BaseFrameWork
//
//  Created by Mr nie on 16/4/11.
//  Copyright © 2016年 程序猿:NiePlus   博客地址:http://nieplus.blog.com. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ThirdViewController *VC = [[ThirdViewController alloc] init];
    [VC.navigationItem setTitle:@"ThirdViewController"];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
