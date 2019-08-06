//
//  NSString+Tool.h
//  BaseCom
//
//  Created by RWN on 2019/8/6.
//  Copyright © 2019年 RWN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Tool)

#pragma mark ---- 实例方法 ----
///md5加密
- (NSString *)md5;
///通过时间格式转换时间
-(NSString *)RwnTimeExchangeWithDateFormat:(NSString *)dateFormat;


#pragma mark ---- 类方法 ----
///获取当前时间
+(NSString *)RwnTimeNowWithDateFormat:(NSString *)dateFormat;
///获取当前时间戳
+(long long)RWNGetNowTimeInterval;
///计算时间间隔
+(NSString *)timeIntervalToNow:(long long)date;
///检查字符串是否为空
+ (BOOL)checkForNull:(NSString *)checkString;
///转换时间
+(NSString*)changeToTimeWithCount:(NSInteger)count;
///获取随机字符串
+(NSString *)getRandomStr;
///是否包含中文
+ (BOOL)hasChinese:(NSString *)str;
///身份证校验
+ (BOOL)validateIDCardNumber:(NSString *)value;
///emoji去除
+(NSString *)disable_emoji:(NSString *)text;
/*
 声明：包含大写/小写/数字/特殊字符
 两种以下密码强度低
 两种密码强度中
 大于两种密码强度高
 密码强度标准根据需要随时调整
 */
//判断是否包含
+ (NSString*) judgePasswordStrength:(NSString*) _password;


@end

NS_ASSUME_NONNULL_END
