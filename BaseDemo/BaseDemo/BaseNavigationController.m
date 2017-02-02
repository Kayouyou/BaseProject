//
//  BaseNavigationController.m
//  BaseDemo
//
//  Created by 叶杨杨 on 2017/1/28.
//  Copyright © 2017年 叶杨杨. All rights reserved.
//

#import "BaseNavigationController.h"
#import "BaseViewController.h"
@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor darkGrayColor]}];
    self.navigationBar.tintColor = [UIColor darkGrayColor];
}

//重写push方法，做一些全局的处理。
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    //1,隐藏tabbar,判断一下是否是栈底
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        if ([viewController isKindOfClass:[BaseViewController class]]) {
            
            NSString *title = self.childViewControllers.count == 1  ? self.childViewControllers[0].title : @"返回";
            viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        }
    }
    
    
    [super pushViewController:viewController animated:animated];
}

- (void)back{
    
    [self popViewControllerAnimated:YES];
}

@end
