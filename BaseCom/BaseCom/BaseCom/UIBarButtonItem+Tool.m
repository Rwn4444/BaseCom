//
//  UIBarButtonItem+Tool.m
//  BaseCom
//
//  Created by RWN on 2019/8/6.
//  Copyright © 2019年 RWN. All rights reserved.
//

#import "UIBarButtonItem+Tool.h"

@implementation UIBarButtonItem (Tool)

+(instancetype)RWN_BarButnWithFrame:(CGRect)frame
                              title:(nullable NSString*)title
                         titleColor:(nullable UIColor *)titleColor
                              image:(nullable UIImage *)image
                               font:(nullable UIFont *)font
                             Target:(id)target
                             action:(SEL)action
                          direction:(RWNBar)direction{
    
    UIButton *barButton = [self getCustomeBtnWithFrame:frame title:title titleColor:titleColor image:image font:font Target:target action:action direction:direction];
    UIBarButtonItem *barButtonItem =[[UIBarButtonItem alloc] initWithCustomView:barButton];
    return barButtonItem;
    
}



///获取只有文字的barBtn
+(instancetype)RWN_BarButnWithFrame:(CGRect)frame
                              title:(NSString*)title
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                             Target:(id)target
                             action:(SEL)action
                          direction:(RWNBar)direction{
    
    return [UIBarButtonItem RWN_BarButnWithFrame:frame title:title titleColor:titleColor image:nil font:font Target:target action:action direction:direction];
    
}

///获取只有文字的barBtn，不用写frame
+(instancetype)RWN_BarButnWithtitle:(NSString*)title
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                             Target:(id)target
                             action:(SEL)action
                          direction:(RWNBar)direction{
    
    return [UIBarButtonItem RWN_BarButnWithFrame:CGRectMake(0, 0, 60, 44) title:title titleColor:titleColor image:nil font:font Target:target action:action direction:direction];
    
}

///获取只有文字的barBtn，不用写frame,没有点击事件
+(instancetype)RWN_BarButnWithtitle:(NSString*)title
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font
                          direction:(RWNBar)direction{
    
    return [UIBarButtonItem RWN_BarButnWithFrame:CGRectMake(0, 0, 60, 44) title:title titleColor:titleColor image:nil font:font Target:nil action:nil direction:direction];

}

///获取只有文字的barBtn，不用写frame,没有点击事件,默认居中
+(instancetype)RWN_BarButnWithtitle:(NSString*)title
                         titleColor:(UIColor *)titleColor
                               font:(UIFont *)font{
    
    return [UIBarButtonItem RWN_BarButnWithFrame:CGRectMake(0, 0, 60, 44) title:title titleColor:titleColor image:nil font:font Target:nil action:nil direction:RWNBarMiddle];

}

///获取只有图片的barBtn
+(instancetype)RWN_BarButnWithFrame:(CGRect)frame
                              image:(UIImage *)image
                             Target:(id)target
                             action:(SEL)action
                          direction:(RWNBar)direction{
    
    return [UIBarButtonItem RWN_BarButnWithFrame:frame title:nil titleColor:nil image:image font:nil Target:target action:action direction:direction];
    
}

///获取只有图片的barBtn，不用写frame
+(instancetype)RWN_BarButnWithimage:(UIImage *)image
                             Target:(id)target
                             action:(SEL)action
                          direction:(RWNBar)direction{
    
    return [UIBarButtonItem RWN_BarButnWithFrame:CGRectMake(0, 0, 60, 44) title:nil titleColor:nil image:image font:nil Target:target action:action direction:direction];

}

///获取只有图片的barBtn，不用写frame,没有点击事件
+(instancetype)RWN_BarButnWithimage:(UIImage *)image
                          direction:(RWNBar)direction{
    
    return [UIBarButtonItem RWN_BarButnWithFrame:CGRectMake(0, 0, 60, 44) title:nil titleColor:nil image:image font:nil Target:nil action:nil direction:direction];

    
}


///获取只有图片的barBtn，不用写frame,没有点击事件,默认居中
+(instancetype)RWN_BarButnWithimage:(UIImage *)image{
    
    return [UIBarButtonItem RWN_BarButnWithFrame:CGRectMake(0, 0, 60, 44) title:nil titleColor:nil image:image font:nil Target:nil action:nil direction:RWNBarMiddle];

    
}


+(UIButton *)getCustomeBtnWithFrame:(CGRect)frame
                              title:(nullable NSString*)title
                         titleColor:(nullable UIColor *)titleColor
                              image:(nullable UIImage *)image
                               font:(nullable UIFont *)font
                             Target:(nullable id)target
                             action:(nullable SEL)action
                          direction:(RWNBar)direction{
    
    UIButton *barButton = [[UIButton alloc]initWithFrame:frame];
    if (title) {
        [barButton setTitle:title forState:UIControlStateNormal];
    }
    if (font) {
        barButton.titleLabel.font = font;
    }
    if (titleColor) {
        [barButton setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (target) {
        [barButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    if (image) {
        [barButton setImage:image forState:UIControlStateNormal];
    }
    if (direction == RWNBarLeft) {
        barButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        barButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }else if (direction == RWNBarRight){
        barButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20);
    }
    //    barButton.backgroundColor = [UIColor blackColor];
    return barButton;
}


@end
