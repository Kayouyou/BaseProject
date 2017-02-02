//
//  BaseViewController.m
//  BaseDemo
//
//  Created by 叶杨杨 on 2017/1/28.
//  Copyright © 2017年 叶杨杨. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseViewController+BaseViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setHasTableView:(BOOL)hasTableView{
    
    _hasTableView = hasTableView;
    _hasTableView ? [self setUPTableView]: nil;
}


@end
