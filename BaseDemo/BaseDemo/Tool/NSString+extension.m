//
//  NSString+extension.m
//  BaseDemo
//
//  Created by 叶杨 on 2017/2/7.
//  Copyright © 2017年 叶杨杨. All rights reserved.
//

#import "NSString+extension.h"

static NSMutableDictionary *_bitHexDic;
static NSMutableDictionary *_tenHexDic;
static NSMutableDictionary *_bitQDic;

@implementation NSString (extension)

+ (NSString *)binaryToDecimal:(NSString *)binary {
    
    NSUInteger decimal = 0;
    
    for (NSInteger index = 0; index < binary.length; index++) {
        
        double num = [[binary substringWithRange:(NSRange){binary.length - index - 1, 1}] doubleValue];
        decimal +=  num * pow(2, index);
        
    }
    
    return [NSString stringWithFormat:@"%ld", (long)decimal];
    
}

+ (NSString *)binaryToQ:(NSString *)binary {
        
        return [self decimalToQ:[[self binaryToDecimal:binary] integerValue]];
        
}
    
+ (NSString *)binaryToHex:(NSString *)binary {
    
    return [self decimalToHex:[[self binaryToDecimal:binary] integerValue]];
    
}

+ (NSString *)qToBinary:(NSString *)q {
    
    NSMutableString *str = [NSMutableString stringWithString:@""];
    NSUInteger count = q.length;
    
    for (NSInteger index = 0; index < count; index++) {
        
        NSString *appendStr = [[self bitQDic] objectForKey:[q substringWithRange:(NSRange){index, 1}]];
        
        if(index == 0) {
            
            appendStr = [NSString stringWithFormat:@"%ld", (long)[appendStr integerValue]];
            
        }
        
        [str appendString:appendStr];
        
    }
    
    return str;
    
}
    
+ (NSString *)qToDecimal:(NSString *)q {
    
    return [self binaryToDecimal:[self qToBinary:q]];
    
}
    
+ (NSString *)qToHex:(NSString *)q {
    
    return [self binaryToHex:[self qToBinary:q]];
    
}
    
+ (NSString *)decimalToBinary:(NSUInteger)tmpid {
    
    return [self tenToOtherWithNum:tmpid system:2];
    
}
    
+ (NSString *)decimalToQ:(NSUInteger)tmpid {
    
    return [self tenToOtherWithNum:tmpid system:8];
    
}
    
+ (NSString *)decimalToHex:(NSUInteger)tmpid {
    
    NSMutableString *str = [NSMutableString stringWithString:@""];
    
    while (tmpid) {
        
        [str insertString:[[self tenHexDic] objectForKey:[NSString stringWithFormat:@"%ld", (long)(tmpid % 16)]] atIndex:0];
        tmpid /= 16;
        
    }
    
    return str;
    
}
    
+ (NSString *)hexToDecimal:(NSString *)hex {
    
    return [self binaryToDecimal:[self hexToBinary:hex]];
    
}
    

#pragma mark - 内部使用方法
    
+ (NSMutableDictionary *)bitHexDic {
    
    if(_bitHexDic == nil) {
        
        NSMutableDictionary *hex = [[NSMutableDictionary alloc] initWithCapacity:16];
        
        [hex setObject:@"0000" forKey:@"0"];
        
        [hex setObject:@"0001" forKey:@"1"];
        
        [hex setObject:@"0010" forKey:@"2"];
        
        [hex setObject:@"0011" forKey:@"3"];
        
        [hex setObject:@"0100" forKey:@"4"];
        
        [hex setObject:@"0101" forKey:@"5"];
        
        [hex setObject:@"0110" forKey:@"6"];
        
        [hex setObject:@"0111" forKey:@"7"];
        
        [hex setObject:@"1000" forKey:@"8"];
        
        [hex setObject:@"1001" forKey:@"9"];
        
        [hex setObject:@"1010" forKey:@"A"];
        
        [hex setObject:@"1011" forKey:@"B"];
        
        [hex setObject:@"1100" forKey:@"C"];
        
        [hex setObject:@"1101" forKey:@"D"];
        
        [hex setObject:@"1110" forKey:@"E"];
        
        [hex setObject:@"1111" forKey:@"F"];
        
        _bitHexDic = hex;
    }
    
    return _bitHexDic;
    
}
    
+ (NSMutableDictionary *)tenHexDic {
    
    if(_tenHexDic == nil) {
        
        NSMutableDictionary *hex = [[NSMutableDictionary alloc] initWithCapacity:16];
        
        [hex setObject:@"0" forKey:@"0"];
        
        [hex setObject:@"1" forKey:@"1"];
        
        [hex setObject:@"2" forKey:@"2"];
        
        [hex setObject:@"3" forKey:@"3"];
        
        [hex setObject:@"4" forKey:@"4"];
        
        [hex setObject:@"5" forKey:@"5"];
        
        [hex setObject:@"6" forKey:@"6"];
        
        [hex setObject:@"7" forKey:@"7"];
        
        [hex setObject:@"8" forKey:@"8"];
        
        [hex setObject:@"9" forKey:@"9"];
        
        [hex setObject:@"A" forKey:@"10"];
        
        [hex setObject:@"B" forKey:@"11"];
        
        [hex setObject:@"C" forKey:@"12"];
        
        [hex setObject:@"D" forKey:@"13"];
        
        [hex setObject:@"E" forKey:@"14"];
        
        [hex setObject:@"F" forKey:@"15"];
        
        _tenHexDic = hex;
        
    }
    
    return _tenHexDic;
    
}
    
+ (NSMutableDictionary *)bitQDic {
    
    if(_bitQDic == nil) {
        
        NSMutableDictionary *hex = [[NSMutableDictionary alloc] initWithCapacity:8];
        
        [hex setObject:@"000" forKey:@"0"];
        
        [hex setObject:@"001" forKey:@"1"];
        
        [hex setObject:@"010" forKey:@"2"];
        
        [hex setObject:@"011" forKey:@"3"];
        
        [hex setObject:@"100" forKey:@"4"];
        
        [hex setObject:@"101" forKey:@"5"];
        
        [hex setObject:@"110" forKey:@"6"];
        
        [hex setObject:@"111" forKey:@"7"];
        
        _bitQDic = hex;
        
    }
    
    return _bitQDic;
    
}
    
+ (NSString *)tenToOtherWithNum:(NSUInteger)num system:(NSUInteger)system {
    
    NSMutableString *str = [NSMutableString stringWithString:@""];
    
    while (num) {
        
        [str insertString:[NSString stringWithFormat:@"%ld", (long)(num % system)] atIndex:0];
        num /= system;
        
    }
    
    return str;
    
}
  
+ (NSString *)pinxCreator:(NSString *)pan withPinv:(NSString *)pinv {
    
    if (pan.length != pinv.length) {
        
        return nil;
    }
    const char *panchar = pan.UTF8String;
    const char *pinvchar = pinv.UTF8String;
    
    NSString *temp = [NSString string];
    
    for (int i = 0; i < pan.length; i++) {
        
        int panValue = [self charToint:panchar[i]];
        int pinvValue = [self charToint:pinvchar[i]];
        
        temp = [temp stringByAppendingString:[NSString stringWithFormat:@"%X", panValue ^ pinvValue]];
        
    }
    
    return temp;
    
}
    
+ (int)charToint:(char)tempChar {
    
    if (tempChar >= '0' && tempChar <='9') {
        
        return tempChar - '0';
        
    } else if (tempChar >= 'A' && tempChar <= 'F') {
        
        return tempChar - 'A' + 10;
    }
    return 0;
}
    
+ (NSString *)hexDataToHexString:(NSData *)hex {
    
    NSUInteger len = hex.length;
    
    char *ch = (char *)hex.bytes;
    
    NSMutableString *hexString = [NSMutableString string];
    
    for (NSUInteger i = 0; i < len; i++ ) {
        
        [hexString appendString:[NSString stringWithFormat:@"%0.2hhx", ch[i]]];
        
    }
    
    return hexString;
    
}
    
+ (NSString *)dateToDateString:(NSDate *)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [dateFormatter stringFromDate:date];
    
}
    
+ (NSString *)hexGBKStringToNormalString:(NSString *)string {
    
    NSData *hexGBKData = [self hexStringToHexData:string];
    
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    return [[NSString alloc] initWithData:hexGBKData encoding:gbkEncoding];
    
}
 
+ (NSData *)hexStringToHexData:(NSString *)hex {
    
    unsigned long len = hex.length / 2;
    unsigned char *buf = malloc(len);
    unsigned char *whole_byte = buf;
    
    char byte_chars[3] = {'\0','\0','\0'};
    
    int i;
    
    for (i=0; i < hex.length / 2; i++) {
        
        byte_chars[0] = [hex characterAtIndex:i*2];
        byte_chars[1] = [hex characterAtIndex:i*2+1];
        *whole_byte = strtol(byte_chars, NULL, 16);
        
        whole_byte++;
        
    }
    
    NSData *data = [NSData dataWithBytes:buf length:len];
    free(buf);
    
    return data;
    
}
    
+ (NSString *)interceptMiddleString:(NSString *)string head:(NSUInteger)head andTail:(NSUInteger)tail {
    
    NSUInteger location = head;
    
    NSUInteger length = string.length - head - tail;
    
    return [string substringWithRange:NSMakeRange(location, length)];
    
}
    
+ (NSString *)hexASCIIStringToNormalString:(NSString *)string {
    
    NSMutableString *resultString = [NSMutableString string];
    
    for (int i = 0; i < string.length / 2; i++) {
        
        char ch1 = [string characterAtIndex:i * 2];
        char ch2 = [string characterAtIndex:i * 2 + 1];
        
        NSString *item = [NSString stringWithFormat:@"%c", [self hexToDecimal:[NSString stringWithFormat:@"%c%c", ch1, ch2]].intValue];
        
        [resultString appendString:item];
        
    }
    
    return resultString;
    
}
    
+ (NSString *)hexStringToDecimalString:(NSString *)string {
    
    NSMutableString *resultString = [NSMutableString string];
    
    for (int i = 0; i < string.length / 2; i++) {
        
        char ch1 = [string characterAtIndex:i * 2];
        char ch2 = [string characterAtIndex:i * 2 + 1];
        
        NSString *item = [self hexToDecimal:[NSString stringWithFormat:@"%c%c", ch1, ch2]];
        
        [resultString appendString:item];
        
    }
    
    return [NSString stringWithFormat:@"%d", resultString.intValue];
}

#pragma mark - 常用加密方法
    
+ (NSString *)sha1:(NSString *)input {
    
    const char *ptr = [input UTF8String];
    
    int i = 0;
    int len = (int)strlen(ptr);
    Byte byteArray[len];
    
    while (i!=len) {
        unsigned eachChar = *(ptr + i);
        unsigned low8Bits = eachChar & 0xFF;
        byteArray[i] = low8Bits;
        i++;
    }
    
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(byteArray, len, digest);
    
    NSMutableString *hex = [NSMutableString string];
    for (int i=0; i<20; i++) {
        [hex appendFormat:@"%02x", digest[i]];
    }
    NSString *immutableHex = [NSString stringWithString:hex];
    
    return immutableHex;
    
}
    
// SHA256加密
+ (NSString *)hmac:(NSString *)plaintext withKey:(NSString *)key
    {
        const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
        const char *cData = [plaintext cStringUsingEncoding:NSASCIIStringEncoding];
        unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
        CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
        NSData *HMACData = [NSData dataWithBytes:cHMAC length:sizeof(cHMAC)];
        const unsigned char *buffer = (const unsigned char *)[HMACData bytes];
        NSMutableString *HMAC = [NSMutableString stringWithCapacity:HMACData.length * 2];
        for (int i = 0; i < HMACData.length; ++i){
            [HMAC appendFormat:@"%02x", buffer[i]];
        }
        
        return HMAC;
    }
    
//md5 32位 加密 （小写）
+ (NSString *)md5:(NSString *)str {
    
    const char *cStr = [str UTF8String];
    unsigned char result[32];
    CC_MD5( cStr, strlen(cStr), result );
    return [NSString stringWithFormat:@"xxxxxxxxxxxxxxxx",
            result[0],result[1],result[2],result[3],
            result[4],result[5],result[6],result[7],
            result[8],result[9],result[10],result[11],
            result[12],result[13],result[14],result[15],
            result[16], result[17],result[18], result[19],
            result[20], result[21],result[22], result[23],
            result[24], result[25],result[26], result[27],
            result[28], result[29],result[30], result[31]];
    
}
    
//md5 16位加密 （大写）
+ (NSString *)md55:(NSString *)str {
    
    const char *cStr = [str UTF8String];
    
    unsigned char result[16];
    
    CC_MD5( cStr, strlen(cStr), result );
    
    return [NSString stringWithFormat:
            @"%02X-%02X-%02X-%02X-%02X-%02X-%02X-%02X-%02X-%02X-%02X-%02X-%02X-%02X-%02X-%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
    
}
    
+ (NSString *)getTimeInterval {
        
        return [NSString stringWithFormat:@"%.f", [[NSDate date] timeIntervalSince1970] * 1000];
}
   
+ (NSString *)jsonEncapsulateWithDictionary:(NSDictionary *)dict {
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
}
    
+ (NSString *)jsEncapsulateWithDictionary:(NSDictionary *)dict {
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
}
    
+ (NSString *)encodeUrl:(NSString *)url {
    
    return [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
}
    
+ (NSString *)decodeUrl:(NSString *)url {
    
    return [url stringByRemovingPercentEncoding];
    
}
+ (NSString*)getBase64StringWithDictionary:(NSDictionary*)dict {
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    return [jsonData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
}
+ (NSString *)getCurrentTime {
    
    NSDate *now = [NSDate date];
    
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [dateformatter stringFromDate:now];
    
}
+ (NSString *)timeFormatted:(NSInteger)totalSeconds
{
    
        NSDate  *localeDate = [NSDate dateWithTimeIntervalSince1970:totalSeconds];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
        NSString *strDate = [dateFormatter stringFromDate:localeDate];
        
        return strDate;
}
    
+ (NSTimeInterval)getSecondsWithDate:(NSDate *)date
{
        //    // 设置系统时区为本地时区
        NSTimeZone *zone = [NSTimeZone systemTimeZone];
        //    // 计算本地时区与 GMT 时区的时间差
        NSInteger interval = [zone secondsFromGMT];
        //    // 在 GMT 时间基础上追加时间差值，得到本地时间
        date = [date dateByAddingTimeInterval:-interval];
        NSTimeInterval timeStamp= [date timeIntervalSince1970];
        return timeStamp;
}
+ (NSString *)getAgeWithBirthday:(NSString *)birthday {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDate *now = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *birth = [dateFormatter dateFromString:birthday];
    
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponents = [calendar components:unitFlags fromDate:birth toDate:now options:0];
    
    if ([dateComponents year] > 0) {
        return [NSString stringWithFormat:@"%ld", (long)[dateComponents year]];
    } else {
        return @"0";
    }
    
}

+ (BOOL)isBlankString:(NSString *)str{
    
    if (str == nil) {
        return YES;
    }
    
    if (str == NULL) {
        return YES;
    }
    
    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] ==0) {
        return  YES;
    }
    
    return NO;
}

+ (NSString *)getThumbnailMobileWithCompleteMobile:(NSString *)mobile {
    
    return [NSString stringWithFormat:@"%@%@%@", [mobile substringToIndex:3], @"****", [mobile substringFromIndex:7]];
    
}
+ (NSString *)systemVersion {
    
    return [UIDevice currentDevice].systemVersion;
    
}
+ (NSString *)getDocumentPath {
    
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    
}
+ (NSString *)getWifiSSID{
    
    NSArray *ifs = (__bridge id)CNCopySupportedInterfaces();
    id info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info && [info count]) {
            break;
        }
    }
    NSDictionary *dctySSID = (NSDictionary *)info;
    NSString *ssid = [[dctySSID objectForKey:@"SSID"] lowercaseString];
    return ssid;
}
+ (NSString *)CalculationTimeWith:(NSString *)stime
    {
        
        NSDate *nowDate = [NSDate date];
        NSDateFormatter *dateFomatter = [[NSDateFormatter alloc] init];
        dateFomatter.dateFormat = @"yyyy-MM-dd HH:mm:ss.0";
        // 截止时间字符串格式
        NSString *expireDateStr = stime;
        // 当前时间字符串格式
        NSString *nowDateStr = [dateFomatter stringFromDate:nowDate];
        // 截止时间data格式
        NSDate *expireDate = [dateFomatter dateFromString:expireDateStr];
        // 当前时间data格式
        nowDate = [dateFomatter dateFromString:nowDateStr];
        // 当前日历
        NSCalendar *calendar = [NSCalendar currentCalendar];
        // 需要对比的时间数据
        NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
        // 对比时间差
        NSDateComponents *dateCom = [calendar components:unit fromDate:nowDate toDate:expireDate options:0];
        NSLog(@"%ld-%ld-%ld-%ld",(long)dateCom.day,(long)dateCom.hour,dateCom.minute,dateCom.second);
        NSString *timeStr = [NSString stringWithFormat:@"%ld天%ld小时%ld分",dateCom.day,dateCom.hour,dateCom.minute];
        
        return timeStr;
}
+ (NSString *)getCurrentYear{
    
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    return [NSString stringWithFormat:@"%ld",(long)[dateComponent year]];
}
+ (NSString *)getCurrentMonth{
    
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    return [NSString stringWithFormat:@"%ld",(long)[dateComponent month]];
}
+ (NSString *)getCurrentMillisecond{
    
    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000;
    
    return [NSString stringWithFormat:@"%ld",(long)recordTime];
}
+(BOOL)isPureInt:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}
    
// 判断字符串是否为浮点型
+(BOOL)isPureFloat:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}
    
//返回分隔成两段的字符串，前后字体大小颜色均可不同
+(NSMutableAttributedString *)editString:(NSString *)editStr CarvePlace:(int)placeNumber PrecedFont:(CGFloat)precedFont PrecedColor:(UIColor *)precedColor BackFont:(CGFloat)backFont BackColor:(UIColor *)backColor{
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:editStr];
    UIFont *font1 = [UIFont systemFontOfSize:precedFont];
    UIFont *font2 = [UIFont systemFontOfSize:backFont];
    [attrString addAttribute:NSFontAttributeName value:font1 range:NSMakeRange(0,placeNumber)];
    [attrString addAttribute:NSForegroundColorAttributeName value:precedColor range:NSMakeRange(0, 4)];
    [attrString addAttribute:NSFontAttributeName value:font2 range:NSMakeRange(placeNumber,editStr.length - placeNumber)];
    [attrString addAttribute:NSForegroundColorAttributeName value:backColor range:NSMakeRange(placeNumber,editStr.length - placeNumber)];
    
    return attrString;
}
    
@end
