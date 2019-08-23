//
//  UIColor+Tool.h
//  BaseCom
//
//  Created by RWN on 2019/8/6.
//  Copyright © 2019年 RWN. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Tool)

/**
 * 16进制颜色(html颜色值)字符串转为UIColor
 */
+(UIColor *)RWNHexStringToColor: (NSString *) stringToConvert;

/**
 *  16进制颜色(html颜色值)字符串转为UIColor
 *
 *  @param stringToConvert 16进制颜色
 *  @param alpha           透明度
 *
 *  @return UIColor
 */
+(UIColor *)RWNHexStringToColor: (NSString *) stringToConvert andAlph:(CGFloat)alpha;


@end

NS_ASSUME_NONNULL_END
