//
//  NSObject+PAITSwizzle.m
//  PingAnGoodHelper
//
//  Created by 宋绍鹏(产险总部科技中心线上系统团队车商保险平台组) on 2021/11/24.
//  Copyright © 2021 平安产险科技中心. All rights reserved.
//

#import "NSObject+PAITSwizzle.h"
#import <objc/runtime.h>

void pait_swizzleInstanceMethodImplementation(Class cls, SEL originSelector, SEL swizzledSelector)
{
    if (!cls) return;

    Method originalMethod = class_getInstanceMethod(cls, originSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);

    BOOL didAddMethod =  class_addMethod(cls,
                                         originSelector,
                                         method_getImplementation(swizzledMethod),
                                         method_getTypeEncoding(swizzledMethod));

    if (didAddMethod) {
        class_replaceMethod(cls,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        class_replaceMethod(cls,
                            swizzledSelector,
                            class_replaceMethod(cls,
                                                originSelector,
                                                method_getImplementation(swizzledMethod),
                                                method_getTypeEncoding(swizzledMethod)),
                            method_getTypeEncoding(originalMethod));
        // 用此方法引起未知崩溃，原因待查
        // method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

void pait_swizzleClassMethodImplementation(Class cls, SEL originSelector, SEL swizzledSelector)
{
    if (!cls) return;

    Class metacls = objc_getMetaClass(NSStringFromClass(cls).UTF8String);

    Method originalMethod = class_getClassMethod(cls, originSelector);
    Method swizzledMethod = class_getClassMethod(cls, swizzledSelector);

    BOOL didAddMethod = class_addMethod(metacls,
                                        originSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(metacls,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));

    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


@implementation NSObject (PAITSwizzle)

+ (void)pait_swizzleInstanceMethodImplementation:(SEL)originSelector withSEL:(SEL)swizzledSelector {
    Class class = [self class];
    pait_swizzleInstanceMethodImplementation(class, originSelector, swizzledSelector);
}

+ (void)pait_swizzleClassMethodImplementation:(SEL)originSelector withSEL:(SEL)swizzledSelector {
    Class class = [self class];
    pait_swizzleClassMethodImplementation(class, originSelector, swizzledSelector);
}

@end
