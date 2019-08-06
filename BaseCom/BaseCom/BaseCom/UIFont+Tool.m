//
//  UIFont+Tool.m
//  BaseCom
//
//  Created by RWN on 2019/8/6.
//  Copyright © 2019年 RWN. All rights reserved.
//

#import "UIFont+Tool.h"

@implementation UIFont (Tool)

+ (UIFont *)RWNFontOfSize:(CGFloat)fontSize{
    
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize];
    return font ? font:[UIFont systemFontOfSize:fontSize];
    
}

+ (UIFont *)RWNBoldFontOfSize:(CGFloat)fontSize{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize];
    return font ? font:[UIFont systemFontOfSize:fontSize];
}

@end
