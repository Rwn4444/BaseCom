//
//  UIImage+Tool.h
//  hunhuibaomu
//
//  Created by RWN on 17/3/29.
//  Copyright © 2017年 RWN. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GradientType) {
    GradientTypeTopToBottom = 0,//从上到小
    GradientTypeLeftToRight = 1,//从左到右
    GradientTypeUpleftToLowright = 2,//左上到右下
    GradientTypeUprightToLowleft = 3,//右上到左下
};


@interface UIImage (Tool)

///通过一个颜色返回一张图片
+ (UIImage *)RWNImageWithColor:(UIColor *)color;
///修改图片的颜色
- (UIImage *)RWNChangeImageWithColor:(UIColor *)color;
///修改图片的透明度
- (UIImage *)RWNChangeAlphaOfImageWith:(CGFloat)alpha withImage:(UIImage*)image;
///通过图片的中心点拉伸图片
+ (UIImage *)RWNStretchableImageWithImageName:(NSString *)imageName;
///把图片弄到指定大小
-(UIImage*)RWNScaleToSize:(CGSize)size;
///生成渐变色的图片
+ (UIImage *)RWNGradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize;
///图片置灰
-(UIImage *)RWNChangeGrayImage:(UIImage *)oldImage;
///通过录制的路径获取图片
+(UIImage *)RWNGetVideoImage:(NSURL *)url;
///让图片旋转一定的角度
-(UIImage*)RWNRotateImageWithDegree:(CGFloat)degree;
///
+ (UIImage *)RWNGetRotationImage:(UIImage *)image rotation:(CGFloat)rotation;
@end
