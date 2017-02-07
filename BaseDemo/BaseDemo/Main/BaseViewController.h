//
//  BaseViewController.h
//  BaseDemo
//
//  Created by 叶杨杨 on 2017/1/28.
//  Copyright © 2017年 叶杨杨. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^RefreshBlock)();

@interface BaseViewController : UIViewController
@property(nonatomic,strong) UITableView *tableView;
@property (nonatomic, copy) RefreshBlock headerRefresh;
@property (nonatomic, copy) RefreshBlock footerRefresh;
@property (nonatomic, assign) BOOL isPullUp;
@property (nonatomic, assign) BOOL hasTableView;
@end
