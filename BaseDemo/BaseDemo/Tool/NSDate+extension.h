//
//  NSDate+extension.h
//  BaseDemo
//
//  Created by 叶杨 on 2017/2/7.
//  Copyright © 2017年 叶杨杨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (extension)
// 格林威治时间转本地时间
+ (NSDate *)convertGMTDatetoLocalDate:(NSDate *)GMTDate;
/**获取本地当前时间*/
+ (NSDate *)getLocalCurrentDate;
/* 日期字符串转换为日期 */
+ (NSDate *)dateWithString:(NSString *)time format:(NSString *)format;
/* 获取day天后的日期(若day为负数,则为|day|天前的日期) */
+ (NSDate *)dateAfterDay:(int)day;
    
@end
