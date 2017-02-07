//
//  NSDate+extension.m
//  BaseDemo
//
//  Created by 叶杨 on 2017/2/7.
//  Copyright © 2017年 叶杨杨. All rights reserved.
//

#import "NSDate+extension.h"

@implementation NSDate (extension)

+ (NSDate *)convertGMTDatetoLocalDate:(NSDate *)GMTDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *gmtDateStr = [dateFormatter stringFromDate:GMTDate];
    NSTimeZone *gmt = [NSTimeZone systemTimeZone];
    
    [dateFormatter setTimeZone:gmt];
    
    NSDate *GMTTime = [dateFormatter dateFromString:gmtDateStr];
    
    NSTimeZone *tz = [NSTimeZone localTimeZone];
    //    NSLog(@"%@",tz);
    NSInteger seconds = [tz secondsFromGMTForDate: GMTTime];
    //    NSLog(@"%ld",(long)seconds);
    //    NSLog(@"%@",[NSDate dateWithTimeInterval: seconds sinceDate: GMTTime]);
    return [NSDate dateWithTimeInterval: seconds sinceDate: GMTTime];
    
}
    
+ (NSDate *)getLocalCurrentDate {
    // 设置系统时区为本地时区
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    // 计算本地时区与 GMT 时区的时间差
    NSInteger interval = [zone secondsFromGMT];
    // 在 GMT 时间基础上追加时间差值，得到本地时间
    NSDate *currentDate = [[NSDate date] dateByAddingTimeInterval:interval];
    return currentDate;
}
    /**
     *  根据时间字符串和格式转换成日期
     *
     *  @param time   时间字符串
     *  @param format 日期格式
     *
     *  @return 日期
     */
+ (NSDate *)dateWithString:(NSString *)time format:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    // 设置系统时区为本地时区
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    // 计算本地时区与 GMT 时区的时间差
    NSInteger interval = [zone secondsFromGMT];
    NSDate *date = [inputFormatter dateFromString:time];
    // 在 GMT 时间基础上追加时间差值，得到本地时间
    date = [date dateByAddingTimeInterval:interval];
    return date;
}
    /**
     *  获取day天后的日期(若day为负数,则为|day|天前的日期)
     *
     *  @param day 时间间隔
     *
     *  @return    日期
     */
    
+ (NSDate *)dateAfterDay:(int)day {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:day];
    
    return [calendar dateByAddingComponents:components toDate:[NSDate date] options:0];
    
}
    
@end
