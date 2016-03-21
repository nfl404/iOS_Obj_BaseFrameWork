//
//  UIBarButtonItem+NPBarbutton.h
//  iOS_Obj_BaseFrameWork
//
//  Created by Mr nie on 16/3/16.
//  Copyright © 2016年 程序猿:NiePlus   博客地址:http://nieplus.blog.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (NPBarbutton)

/**
 *创建一个UIBarbuttonItem 类方法，这个方法是类方法创建一个按钮，传入的参数：image正常显示的图片，hightImage高亮情况下显示的图片，target用的对象，action点击的行为。
 */
+ (instancetype)itemWithImage:(NSString *)image hightImage:(NSString *)hightImage target:(id)target action:(SEL)action;

@end
