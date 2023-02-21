//
//  TBFaceSDKUtil.h
//  TBFaceSDK_Example
//
//  Created by 曾鹏展 on 2023/2/17.
//  Copyright © 2023 zpz5789. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBFaceSDKUtil : NSObject
/// 加载bundle中资源图片
+ (UIImage *)imageNamed:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
