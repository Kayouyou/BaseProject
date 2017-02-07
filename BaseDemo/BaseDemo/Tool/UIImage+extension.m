//
//  UIImage+extension.m
//  BaseDemo
//
//  Created by 叶杨 on 2017/2/7.
//  Copyright © 2017年 叶杨杨. All rights reserved.
//

#import "UIImage+extension.h"

@implementation UIImage (extension)

    
+ (UIImage *)imageWithColor:(UIColor *)color {
        
        CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect);
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image;
}

@end
