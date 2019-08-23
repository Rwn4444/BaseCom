//
//  UIButton+Tool.h
//  BaseCom
//
//  Created by RWN on 2019/8/6.
//  Copyright © 2019年 RWN. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, RWNButtonEdgeInsetsStyle) {
    RWNButtonEdgeInsetsStyleTop, // image在上，label在下
    RWNButtonEdgeInsetsStyleLeft, // image在左，label在右
    RWNButtonEdgeInsetsStyleBottom, // image在下，label在上
    RWNButtonEdgeInsetsStyleRight // image在右，label在左
};

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Tool)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)RWNLayoutButtonWithEdgeInsetsStyle:(RWNButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
