//
//  BaseTabBarViewController+BaseTabBarViewController.m
//  BaseDemo
//
//  Created by 叶杨杨 on 2017/1/28.
//  Copyright © 2017年 叶杨杨. All rights reserved.
//

#import "BaseTabBarViewController+BaseTabBarViewController.h"
#import "BaseNavigationController.h"
@implementation BaseTabBarViewController (BaseTabBarViewController)
//添加第五个按钮
- (void)addMiddleButton{
    [self.tabBar addSubview:self.middleBtn];
    NSInteger count = self.childViewControllers.count;
    float w = self.tabBar.bounds.size.width / count  - 1;
    //正数向内  负数向外
    self.middleBtn.frame = CGRectInset(self.tabBar.bounds, 2 * w, 0);
}

//设置子控制器
- (void)setUpChildController{
    
    NSArray *arr = @[@{@"clsName":@"HomeViewController",@"imgName":@"index-icon-car-press",@"title":@"首页"},@{@"clsName":@"MineViewController",@"imgName":@"index-icon-home-press",@"title":@"我的"}];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in arr) {
        [arrayM addObject:[self controllerWithDict:dict]];
    }
    self.viewControllers = arrayM;
}

//利用字典创建子控制器
- (UIViewController *)controllerWithDict:(NSDictionary *)dict{
    //1,取得字典内容
    NSString *clsName = dict[@"clsName"];
    NSString *imgName = dict[@"imgName"];
    NSString *title   = dict[@"title"];
    //2,创建控制器
    UIViewController *newViewController = (UIViewController *)[[NSClassFromString(clsName) alloc] init];
    newViewController.title = title;
    newViewController.tabBarItem.image = [UIImage imageNamed:imgName];
    newViewController.tabBarItem.selectedImage = [[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//渲染
    [newViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateHighlighted];
    [newViewController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
    BaseNavigationController*nav=[[BaseNavigationController alloc]initWithRootViewController:newViewController];
    
    return nav;
}
@end
