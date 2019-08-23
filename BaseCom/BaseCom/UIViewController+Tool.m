//
//  UIViewController+Tool.m
//  BaseCom
//
//  Created by RWN on 2019/8/9.
//  Copyright © 2019年 RWN. All rights reserved.
//

#import "UIViewController+Tool.h"
#import <objc/runtime.h>
@implementation UIViewController (Tool)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //获得系统的两个方法
        SEL systemWill = @selector(viewWillAppear:);
        Method  systemWillMethod = class_getInstanceMethod([self class], systemWill);
        //获得自己的两个方法
        SEL rwnWill    =@selector(RWNViewWillAppear:);
        Method  rwnWillMethod = class_getInstanceMethod([self class], rwnWill);
        //首先动态添加方法，实现是被交换的方法，返回值表示添加成功还是失败
        BOOL success = class_addMethod(self, systemWill, method_getImplementation(rwnWillMethod), method_getTypeEncoding(rwnWillMethod));
        if (success) {
            //如果成功，说明类中不存在这个方法的实现
            //将被交换方法的实现替换到这个并不存在的实现
            class_replaceMethod(self, rwnWill, method_getImplementation(systemWillMethod), method_getTypeEncoding(systemWillMethod));
        }else{
            //否则，交换两个方法的实现
            method_exchangeImplementations(systemWillMethod, rwnWillMethod);
        }
        
    });
    
    
}


//自己的方法
-(void)RWNViewWillAppear:(BOOL)animated{
    
    //这时候调用自己，看起来像是死循环
    //但是其实自己的实现已经被替换了
    [self RWNViewWillAppear:animated];
//    NSString *name=[NSString stringWithUTF8String:object_getClassName(self)];
    
    
}


@end
