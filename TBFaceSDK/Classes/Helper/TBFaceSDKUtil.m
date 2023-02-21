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
    NSBundle *bundle = [self resourceBundle];
    if (@available(iOS 13.0, *)) {
        return [UIImage imageNamed:name inBundle:bundle withConfiguration:nil];
    } else {
        // Fallback on earlier versions
        UIImage *image = [UIImage imageWithContentsOfFile:[bundle pathForResource:name ofType:@"png"]];
        return image;
    }
}

+ (NSBundle *)resourceBundle {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSURL *bundleUrl = [bundle URLForResource:@"BDFaceSDKUI" withExtension:@"bundle"];
    NSBundle *imageBundle = [NSBundle bundleWithURL:bundleUrl];
    return imageBundle;
}

@end
