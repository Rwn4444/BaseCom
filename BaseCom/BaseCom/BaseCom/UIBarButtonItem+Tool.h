//
//  UIBarButtonItem+Tool.h
//  BaseCom
//
//  Created by mac on 2019/8/6.
//  Copyright © 2019年 RWN. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    RWNBarMiddle,
    RWNBarLeft,
    RWNBarRight,
} RWNBar;

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (Tool)

+(instancetype)RWN_BarButnWithFrame:(CGRect)frame
                              title:(nullable NSString*)title
                         titleColor:(nullable UIColor *)titleColor
                              image:(nullable UIImage *)image
                               font:(nullable UIFont *)font
                             Target:(id)target
                             action:(SEL)action
                          direction:(RWNBar)direction;


+(instancetype)RWN_BarButnWithFrame:(CGRect)frame
                              title:(NSString*)title
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                             Target:(id)target
                             action:(SEL)action;


+(instancetype)RWN_BarButnWithFrame:(CGRect)frame
                              image:(UIImage *)image
                             Target:(id)target
                             action:(SEL)action
                          direction:(RWNBar)direction;

@end

NS_ASSUME_NONNULL_END
