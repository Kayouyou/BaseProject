//
//  BaseTabBarViewController+BaseTabBarViewController.h
//  BaseDemo
//
//  Created by 叶杨杨 on 2017/1/28.
//  Copyright © 2017年 叶杨杨. All rights reserved.
//

#import "BaseTabBarViewController.h"

//分割主控制器的代码块
@interface BaseTabBarViewController (BaseTabBarViewController)

- (void)addMiddleButton;

//设置子控制器
- (void)setUpChildController;

//利用字典创建子控制器
- (UIViewController *)controllerWithDict:(NSDictionary *)dict;

@end
