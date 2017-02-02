//
//  BaseViewController+BaseViewController.m
//  BaseDemo
//
//  Created by 叶杨杨 on 2017/1/28.
//  Copyright © 2017年 叶杨杨. All rights reserved.
//

#import "BaseViewController+BaseViewController.h"
#import "MJRefresh.h"
@implementation BaseViewController (BaseViewController)

- (void)setUpUI{
    self.isPullUp = NO;
    self.hasTableView = NO;
    self.view.backgroundColor = [UIColor redColor];
    self.automaticallyAdjustsScrollViewInsets = NO;//取消缩进20个高度
}

//添加表格视图
- (void)setUPTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.contentInset  = UIEdgeInsetsMake(64, 0, 49, 0);
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{

        if (self.headerRefresh) {
            self.headerRefresh();
        }
        [self.tableView.mj_header endRefreshing];
    }];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
    
        if (self.footerRefresh) {
            self.footerRefresh();
        }
        [self.tableView.mj_footer endRefreshing];
    }];
}

//设置表格代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [[UITableViewCell alloc]init];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger lastRow = indexPath.row;
    NSInteger lastSection = tableView.numberOfSections - 1;
    if (lastRow < 0 || lastSection < 0) {
        return;
    }
    NSInteger rows = [tableView numberOfRowsInSection:lastSection];
    if (lastRow == (rows -1) && !self.isPullUp) {
        self.isPullUp = YES;
        NSLog(@"上拉刷新");
        if (self.footerRefresh) {
            self.footerRefresh();
        }
    }
    
}



@end
