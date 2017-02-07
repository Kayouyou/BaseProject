//
//  UILabel+extension.m
//  BaseDemo
//
//  Created by 叶杨 on 2017/2/7.
//  Copyright © 2017年 叶杨杨. All rights reserved.
//

#import "UILabel+extension.h"

@implementation UILabel (extension)
#pragma mark - 获取label的高度
   
+(float)getLabelHeight:(float)width fontSize:(float)fontSize text:(NSString*)text{
  
    CGSize labelsize = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    float labelHeight = labelsize.height;
    return labelHeight;
}

+(float)getLabelWidth:(float)height fontSize:(float)fontSize text:(NSString *)text{
    
    CGSize labelsize = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    float labelWidth = labelsize.width;
    return labelWidth;
    
}

@end
