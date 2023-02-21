//
//  NSObject+PAITSwizzle.h
//  PingAnGoodHelper
//
//  Created by 宋绍鹏(产险总部科技中心线上系统团队车商保险平台组) on 2021/11/24.
//  Copyright © 2021 平安产险科技中心. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 交换某个类的两个实例方法
/// @param cls  要交换的类
/// @param originSelector 原方法
/// @param swizzledSelector 要交换的方法
void pait_swizzleInstanceMethodImplementation(Class cls, SEL originSelector, SEL swizzledSelector);

/// 交换某个类的两个类方法
/// @param cls 要交换的类
/// @param originSelector 原方法
/// @param swizzledSelector 要交换的方法
void pait_swizzleClassMethodImplementation(Class cls, SEL originSelector, SEL swizzledSelector);


/// 用于方法交换，可以使用NSObject分类或直接使用👆的方法
@interface NSObject (PAITSwizzle)

/// 交换实例方法
/// @param originSelector  原方法
/// @param swizzledSelector 要交换的方法
+ (void)pait_swizzleInstanceMethodImplementation:(SEL)originSelector withSEL:(SEL)swizzledSelector;

/// 交换类方法
/// @param originSelector 原方法
/// @param swizzledSelector 要交换的方法
+ (void)pait_swizzleClassMethodImplementation:(SEL)originSelector withSEL:(SEL)swizzledSelector;


@end

NS_ASSUME_NONNULL_END
