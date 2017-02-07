//
//  UILabel+extension.h
//  BaseDemo
//
//  Created by 叶杨 on 2017/2/7.
//  Copyright © 2017年 叶杨杨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (extension)

// 获取label的高度
+(float)getLabelHeight:(float)width fontSize:(float)fontSize text:(NSString*)text;
    
//计算label宽度
+(float)getLabelWidth:(float)height fontSize:(float)fontSize text:(NSString *)text;

@end
