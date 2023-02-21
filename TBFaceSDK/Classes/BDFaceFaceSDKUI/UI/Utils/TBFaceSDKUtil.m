//
//  TBFaceSDKUtil.m
//  TBFaceSDK_Example
//
//  Created by 曾鹏展 on 2023/2/17.
//  Copyright © 2023 zpz5789. All rights reserved.
//

#import "TBFaceSDKUtil.h"

@implementation TBFaceSDKUtil

+ (UIImage *)imageNamed:(NSString *)name{
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[self class]] pathForResource:@"TBFaceSDK" ofType:@"bundle"]];
    if (@available(iOS 13.0, *)) {
        return [UIImage imageNamed:name inBundle:bundle withConfiguration:nil];
    } else {
        // Fallback on earlier versions
        UIImage *image = [UIImage imageWithContentsOfFile:[bundle pathForResource:name ofType:@"png"]];
        return image;
    }
}



@end
