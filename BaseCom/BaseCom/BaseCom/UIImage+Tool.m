//
//  UIImage+Tool.m
//  hunhuibaomu
//
//  Created by RWN on 17/3/29.
//  Copyright © 2017年 RWN. All rights reserved.
//

#import "UIImage+Tool.h"
#import <AVFoundation/AVFoundation.h>
#import<QuartzCore/QuartzCore.h>
#import<Accelerate/Accelerate.h>

@implementation UIImage (Tool)


//改变图片颜色
+ (UIImage *)RWNImageWithColor:(UIColor *)color {
    
    return [self imageWithColor:color size:CGSizeMake(1, 1)];
    
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 *  重新绘制图片
 *
 *  @param color 填充色
 *
 *  @return UIImage
 */
- (UIImage *)RWNChangeImageWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}



- (UIImage *)RWNChangeAlphaOfImageWith:(CGFloat)alpha withImage:(UIImage*)image
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextSetAlpha(ctx, alpha);
    
    CGContextDrawImage(ctx, area, image.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}




+ (UIImage *)RWNStretchableImageWithImageName:(NSString *)imageName{
    
    // 加载图片
    UIImage *image = [UIImage imageNamed:imageName];
    // 设置左边端盖宽度
    NSInteger leftCapWidth = image.size.width * 0.5;
    // 设置上边端盖高度
    NSInteger topCapHeight = image.size.height * 0.5;
    
    UIImage *newImage = [image stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
    
    return newImage;
    
}


-(UIImage*)RWNScaleToSize:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

+ (UIImage *)RWNGradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize {
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(imgSize, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start;
    CGPoint end;
    switch (gradientType) {
        case GradientTypeTopToBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        case GradientTypeLeftToRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, 0.0);
            break;
        case GradientTypeUpleftToLowright:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, imgSize.height);
            break;
        case GradientTypeUprightToLowleft:
            start = CGPointMake(imgSize.width, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        default:
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}

-(UIImage *)RWNChangeGrayImage:(UIImage *)oldImage
{
    
    int bitmapInfo = kCGImageAlphaNone;
    int width = oldImage.size.width;
    int height = oldImage.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate (nil,
                                                  width,
                                                  height,
                                                  8,
                                                  0,
                                                  colorSpace,
                                                  bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    if (context == NULL) {
        return nil;
    }
    CGContextDrawImage(context,
                       CGRectMake(0, 0, width, height), oldImage.CGImage);
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    return grayImage;
}

+(UIImage *)RWNGetVideoImage:(NSURL *)url{
    
    NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
    AVURLAsset *urlAsset = [[AVURLAsset alloc] initWithURL:url options:options];
    AVAssetImageGenerator *generator = [AVAssetImageGenerator assetImageGeneratorWithAsset:urlAsset];
    generator.appliesPreferredTrackTransform = YES;
    generator.maximumSize = CGSizeMake(98, 98);
    CGImageRef imageRef = [generator copyCGImageAtTime:CMTimeMake(10, 10) actualTime:NULL error:nil];
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    return image;
    
}


-(UIImage*)RWNRotateImageWithDegree:(CGFloat)degree{
        
        //将image转化成context
        //获取图片像素的宽和高
        size_t width =  self.size.width * self.scale;
        size_t height = self.size.height * self.scale;
        
        //颜色通道为8 因为0-255 经过了8个颜色通道的变化
        //每一行图片的字节数 因为我们采用的是ARGB/RGBA 所以字节数为 width * 4
        size_t bytesPerRow =width * 4;
        //图片的透明度通道
        CGImageAlphaInfo info =kCGImageAlphaPremultipliedFirst;
        CGContextRef context = CGBitmapContextCreate(nil, width, height, 8, bytesPerRow, CGColorSpaceCreateDeviceRGB(), kCGBitmapByteOrderDefault|info);
        
        if (!context) {
            return nil;
        }
        //将图片渲染到图形上下文中
        CGContextDrawImage(context, CGRectMake(0, 0, width, height), self.CGImage);
        
        //旋转context
        uint8_t* data =(uint8_t*) CGBitmapContextGetData(context);
        //旋转欠的数据
        vImage_Buffer src = { data,height,width,bytesPerRow};
        //旋转后的数据
        vImage_Buffer dest= { data,height,width,bytesPerRow};
        
        //背景颜色
        Pixel_8888  rbackColor = {0,0,0,0};
        //填充颜色
        vImage_Flags flags = kvImageBackgroundColorFill;
        
        vImageRotate_ARGB8888(&src, &dest, nil, degree * M_PI/180.f, rbackColor, flags);
        
        //将conetxt转换成image
        CGImageRef imageRef = CGBitmapContextCreateImage(context);
        UIImage  * rotateImage =[UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
        
        return  rotateImage;
    }

+ (UIImage *)RWNGetRotationImage:(UIImage *)image rotation:(CGFloat)rotation {
    
    CIImage *ciImage = [[CIImage alloc] initWithImage:image];
    CIFilter *filter = [CIFilter filterWithName:@"CIAffineTransform" keysAndValues:kCIInputImageKey, ciImage, nil];
    
    [filter setDefaults];
    CGAffineTransform transform = CATransform3DGetAffineTransform([self RWNRotateTransform:CATransform3DIdentity clockwise:NO angle:rotation]);
    [filter setValue:[NSValue valueWithBytes:&transform objCType:@encode(CGAffineTransform)] forKey:@"inputTransform"];
    
    //根据滤镜设置图片
    CIContext *context = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer : @(NO)}];
    CIImage *outputImage = [filter outputImage];
    CGImageRef cgImage = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *result = [UIImage imageWithCGImage:cgImage];
    
    CGImageRelease(cgImage);
    
    return result;
}

+ (CATransform3D)RWNRotateTransform:(CATransform3D)initialTransform clockwise:(BOOL)clockwise angle:(CGFloat)angle {
    
    CGFloat arg = angle*M_PI / 180.0f;
    if(!clockwise){
        arg *= -1;
    }
    //进行形变
    CATransform3D transform = initialTransform;
    transform = CATransform3DRotate(transform, arg, 0, 0, 1);
    CGFloat _flipState1 = 0;
    CGFloat _flipState2 = 0;
    transform = CATransform3DRotate(transform, _flipState1*M_PI, 0, 1, 0);
    transform = CATransform3DRotate(transform, _flipState2*M_PI, 1, 0, 0);
    
    return transform;
}


@end
