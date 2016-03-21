# iOS_Obj_BaseFrameWork
##iOS基础框架



本基础框架主要包括UITabBarController，UINavigationController和UIBarButtonItem类的扩展。主要解决子视图创建过多，封装带有UINavigationController的子视图创建，然后添加到UITabBarController的ChildViewController视图中。针对UITabBarController的UITabBarItem的字体大小，颜色设置。

一.继承UITabBarController创建的NPTabBarController
1.设置tabbar上面的字体样式

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

2.导航子视图封装

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

二.继承UINavigationController创建NPNavigationController
1.重写-(void)pushVewController:(UIViewConntroller*)viewCOntroller animated:(Bool)animated方法

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

三.添加UIBarButtonItem的类扩展UIBarButtonItem＋NPBarbutton,创建UIbarbuttonItem类方法
1.UIbarbuttonItem类方法

    /**
     *创建一个UIBarbuttonItem 类方法，这个方法是类方法创建一个按钮，传入的参数：image正常显示的图片，hightImage高亮情况下显示的图片，target用的对象，action点击的行为。
     */
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



以上为基础框架主要实现，还有一些不足，手势滑动返回没有写到，欢迎大家一起fork！


作者：NiePlus
qq技术交流群：193996724  

推广MarkDown语法链接：http://www.jianshu.com/p/7cc9c26e8b7a 作者：大毛集团

