//
//  HomeViewController.m
//  BaseDemo
//
//  Created by 叶杨杨 on 2017/1/28.
//  Copyright © 2017年 叶杨杨. All rights reserved.
//

#import "HomeViewController.h"
#import "BaseViewController+BaseViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareUI];
    [[self.backButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
       NSLog(@"点击了返回按钮");
       UIViewController *newViewController = (UIViewController *)[[NSClassFromString(@"BaseTestViewController") alloc] init];
       [self.navigationController pushViewController:newViewController animated:YES];
    }];
    
}
- (void)prepareUI{
    self.view.backgroundColor = [UIColor orangeColor];
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame = CGRectMake(0, 0, 40, 30);
    [self.backButton setTitle:@"管理" forState:UIControlStateNormal];
    [self.backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.backButton setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:self.backButton];
    self.navigationItem.leftBarButtonItem = leftItem;
}

//实现数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}



@end
