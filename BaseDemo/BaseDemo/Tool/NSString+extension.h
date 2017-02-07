//
//  NSString+extension.h
//  BaseDemo
//
//  Created by 叶杨 on 2017/2/7.
//  Copyright © 2017年 叶杨杨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonDigest.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import <SystemConfiguration/SystemConfiguration.h>

@interface NSString (extension)

/** 判断字符串是否为整形 */
+(BOOL)isPureInt:(NSString *)string;
/** 判断字符串是否为浮点型  */
+(BOOL)isPureFloat:(NSString *)string;
    /**
     *  返回分隔成两段的字符串，前后字体大小颜色均可不同
     *
     *  @param editStr     要编辑的字符串
     *  @param placeNumber 分割点
     *  @param precedFont  前面部分的字体大小
     *  @param precedColor 前面部分的字体颜色
     *  @param backFont    后面部分的字体大小
     *  @param backColor   后面部分的字体颜色
     *
     *  @return 编辑完成的字符串
     */
+(NSMutableAttributedString *)editString:(NSString *)editStr CarvePlace:(int)placeNumber PrecedFont:(CGFloat)precedFont PrecedColor:(UIColor *)precedColor BackFont:(CGFloat)backFont BackColor:(UIColor *)backColor;
    
#pragma mark - 常用进制转换
    
/* 二进制 -> 十进制 */
+ (NSString *)binaryToDecimal:(NSString *)binary;
/* 二进制 -> 八进制 */
+ (NSString *)binaryToQ:(NSString *)binary;
/* 二进制 -> 十六进制 */
+ (NSString *)binaryToHex:(NSString *)binary;
/* 八进制 -> 二进制 */
+ (NSString *)qToBinary:(NSString *)q;
/* 八进制 -> 十进制 */
+ (NSString *)qToDecimal:(NSString *)q;
/* 八进制 -> 十六进制 */
+ (NSString *)qToHex:(NSString *)q;
/* 十进制 -> 二进制 */
+ (NSString *)decimalToBinary:(NSUInteger)tmpid;
/* 十进制 -> 八进制 */
+ (NSString *)decimalToQ:(NSUInteger)tmpid;
/* 十进制 -> 十六进制 */
+ (NSString *)decimalToHex:(NSUInteger)tmpid;
/* 十六进制 -> 二进制 */
+ (NSString *)hexToBinary:(NSString *)hex;
/* 十六进制 -> 八进制 */
+ (NSString *)hexToQ:(NSString *)hex;
/* 十六进制 -> 十进制 */
+ (NSString *)hexToDecimal:(NSString *)hex;
/* 对两个相等长度的字符串进行异或运算 */
+ (NSString *)pinxCreator:(NSString *)pan withPinv:(NSString *)pinv;
/* 十六进制字节流转十六进制字符串 */
+ (NSString *)hexDataToHexString:(NSData *)hex;
/* 日期转换为日期字符串 */
+ (NSString *)dateToDateString:(NSDate *)date;
/* 十六进制GBK字符串转普通字符串 */
+ (NSString *)hexGBKStringToNormalString:(NSString *)string;
/* 截取字符串中间部分 */
+ (NSString *)interceptMiddleString:(NSString *)string head:(NSUInteger)head andTail:(NSUInteger)tail;
/* 十六进制ASCII字符串转普通字符串 */
+ (NSString *)hexASCIIStringToNormalString:(NSString *)string;    
/* 十六进制字符串转十进制字符串 */
+ (NSString *)hexStringToDecimalString:(NSString *)string;
/* 十六进制字符串转十六进制字节流 */
+ (NSData *)hexStringToHexData:(NSString *)hex;
#pragma mark - 加密
+ (NSString *)sha1:(NSString *)input;
+ (NSString *)hmac:(NSString *)plaintext withKey:(NSString *)key;
+ (NSString *)md5:(NSString *)str;
+ (NSString *)md55:(NSString *)str;

#pragma mark - 时间转换
    
/* 获取当前时间 */
+ (NSString *)getCurrentTime;
/* 获取时间戳 */
+ (NSString *)getTimeInterval;
/* 根据秒数获取本地时间日期 */
+ (NSString *)timeFormatted:(NSInteger)totalSeconds;
/* 根据时间日期获取时间戳 */
+ (NSTimeInterval)getSecondsWithDate:(NSDate *)date;
/* 根据生日获取年龄 */
+ (NSString *)getAgeWithBirthday:(NSString *)birthday;
/* 计算某个时间点距离当前时间的时间差 */
+ (NSString *)CalculationTimeWith:(NSString *)stime;

/* 获取当前年份 */
+ (NSString *)getCurrentYear;
/* 获取当前月份 */
+ (NSString *)getCurrentMonth;
/* 获取毫秒数 */
+ (NSString *)getCurrentMillisecond;
    
    
    
#pragma mark - url转换，json转换
    
/* EncodeUrl */
+ (NSString *)encodeUrl:(NSString *)url;
/* DecodeUrl */
+ (NSString *)decodeUrl:(NSString *)url;
/* NSDictionary转为base64字符串 */
+ (NSString *)getBase64StringWithDictionary:(NSDictionary *)dic;
/* JsonEncapsulate */
+ (NSString *)jsonEncapsulateWithDictionary:(NSDictionary *)dict;
+ (NSString *)jsEncapsulateWithDictionary:(NSDictionary *)dict;
    
/* 根据完整的电话号码获取缩略的电话号码 */
+ (NSString *)getThumbnailMobileWithCompleteMobile:(NSString *)mobile;
    
#pragma mark - 获取设备系统版本
+ (NSString *)systemVersion;

#pragma mark - 获取文档路径 
+ (NSString *)getDocumentPath;
    
#pragma mark - 获取WiFi名称
+ (NSString *)getWifiSSID;

#pragma mark - 判断字符串为空
+ (BOOL)isBlankString:(NSString *)str;
    
@end
