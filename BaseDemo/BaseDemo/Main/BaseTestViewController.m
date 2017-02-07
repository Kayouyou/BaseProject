//
//  BaseTestViewController.m
//  BaseDemo
//
//  Created by 叶杨杨 on 2017/1/28.
//  Copyright © 2017年 叶杨杨. All rights reserved.
//

#import "BaseTestViewController.h"

@interface BaseTestViewController ()

@end

@implementation BaseTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"第 %lu 个",self.navigationController.childViewControllers.count];
    [self prepareUI];
}

- (void)prepareUI{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一个" style:UIBarButtonItemStylePlain target:self action:@selector(pushNext)];
}

- (void)pushNext{
    
    BaseTestViewController *testVC = [BaseTestViewController new];
    [self.navigationController pushViewController:testVC animated:YES];
}


@end
