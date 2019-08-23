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
- (NSString *)RWNMd5;
///通过时间格式转换时间
-(NSString *)RWNTimeExchangeWithDateFormat:(NSString *)dateFormat;


#pragma mark ---- 类方法 ----
///获取当前时间
+(NSString *)RWNTimeNowWithDateFormat:(NSString *)dateFormat;
///获取当前时间戳
+(long long)RWNGetNowTimeInterval;
///计算时间间隔
+(NSString *)RWNTimeIntervalToNow:(long long)date;
///检查字符串是否为空
+ (BOOL)RWNCheckForNull:(NSString *)checkString;
///转换时间
+(NSString*)RWNChangeToTimeWithCount:(NSInteger)count;
///获取随机字符串
+(NSString *)RWNGetRandomStr;
///是否包含中文
+ (BOOL)RWNHasChinese:(NSString *)str;
///身份证校验
+ (BOOL)RWNValidateIDCardNumber:(NSString *)value;
///emoji去除
+(NSString *)RWNDisable_emoji:(NSString *)text;
/*
 声明：包含大写/小写/数字/特殊字符
 两种以下密码强度低
 两种密码强度中
 大于两种密码强度高
 密码强度标准根据需要随时调整
 */
//判断是否包含
+ (NSString*)RWNJudgePasswordStrength:(NSString*) _password;


@end

NS_ASSUME_NONNULL_END
