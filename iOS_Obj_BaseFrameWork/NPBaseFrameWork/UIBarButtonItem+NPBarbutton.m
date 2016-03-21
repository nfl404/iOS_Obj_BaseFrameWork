//
//  UIBarButtonItem+NPBarbutton.m
//  iOS_Obj_BaseFrameWork
//
//  Created by Mr nie on 16/3/16.
//  Copyright © 2016年 程序猿:NiePlus   博客地址:http://nieplus.blog.com. All rights reserved.
//

#import "UIBarButtonItem+NPBarbutton.h"

@implementation UIBarButtonItem (NPBarbutton)

+ (instancetype)itemWithImage:(NSString *)image hightImage:(NSString *)hightImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:hightImage] forState:UIControlStateNormal];
    //btnsize 是北京图片的大小
    CGSize btnsize = btn.currentBackgroundImage.size;
    //设置btn的frame
    [btn setFrame:CGRectMake(0, 0, btnsize.width, btnsize.height)];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:btn];
}

@end
