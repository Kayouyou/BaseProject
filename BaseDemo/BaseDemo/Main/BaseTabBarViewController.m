//
//  BaseTabBarViewController.m
//  BaseDemo
//
//  Created by 叶杨杨 on 2017/1/28.
//  Copyright © 2017年 叶杨杨. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "BaseTabBarViewController+BaseTabBarViewController.h"
@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildController];
    [self addMiddleButton];
    @weakify(self);
    [[self.middleBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
    @strongify(self)
        
    }];
    
}

//设置支持横竖屏，设置支持的方向之后，当前的控制器及子控制器都会遵守这个方向
//如果播放视频，通常是modal展现的！也就是present的形式
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - 多余按钮懒加载
- (UIButton *)middleBtn{
    
    if (_middleBtn == nil) {
        
        _middleBtn = [[UIButton alloc] init];
    }
    _middleBtn.backgroundColor = [UIColor redColor];
    //伪代码
    return _middleBtn;
}







@end
