//
//  BaseViewController+BaseViewController.h
//  BaseDemo
//
//  Created by 叶杨杨 on 2017/1/28.
//  Copyright © 2017年 叶杨杨. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController (BaseViewController)<UITableViewDelegate,UITableViewDataSource>
//添加视图
- (void)setUpUI;

//添加表格视图
- (void)setUPTableView;


@end
