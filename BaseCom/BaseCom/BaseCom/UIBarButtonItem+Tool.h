//
//  UIBarButtonItem+Tool.h
//  BaseCom
//
//  Created by RWN on 2019/8/6.
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

///获取barBtn
+(instancetype)RWN_BarButnWithFrame:(CGRect)frame
                              title:(nullable NSString*)title
                         titleColor:(nullable UIColor *)titleColor
                              image:(nullable UIImage *)image
                               font:(nullable UIFont *)font
                             Target:(id)target
                             action:(SEL)action
                          direction:(RWNBar)direction;

///获取只有文字的barBtn
+(instancetype)RWN_BarButnWithFrame:(CGRect)frame
                              title:(NSString*)title
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                             Target:(id)target
                             action:(SEL)action
                        direction:(RWNBar)direction;

///获取只有文字的barBtn，不用写frame
+(instancetype)RWN_BarButnWithtitle:(NSString*)title
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                             Target:(id)target
                             action:(SEL)action
                          direction:(RWNBar)direction;

///获取只有文字的barBtn，不用写frame,没有点击事件
+(instancetype)RWN_BarButnWithtitle:(NSString*)title
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                          direction:(RWNBar)direction;

///获取只有文字的barBtn，不用写frame,没有点击事件,默认居中
+(instancetype)RWN_BarButnWithtitle:(NSString*)title
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font;

 ///获取只有图片的barBtn
+(instancetype)RWN_BarButnWithFrame:(CGRect)frame
                              image:(UIImage *)image
                             Target:(id)target
                             action:(SEL)action
                          direction:(RWNBar)direction;

///获取只有图片的barBtn，不用写frame
+(instancetype)RWN_BarButnWithimage:(UIImage *)image
                             Target:(id)target
                             action:(SEL)action
                          direction:(RWNBar)direction;

///获取只有图片的barBtn，不用写frame,没有点击事件
+(instancetype)RWN_BarButnWithimage:(UIImage *)image
                          direction:(RWNBar)direction;


///获取只有图片的barBtn，不用写frame,没有点击事件,默认居中
+(instancetype)RWN_BarButnWithimage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
