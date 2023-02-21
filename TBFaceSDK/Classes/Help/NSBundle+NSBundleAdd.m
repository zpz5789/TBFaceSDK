//
//  NSBundle+NSBundleAdd.m
//  FaceSDKSample_IOS
//
//  Created by 曾鹏展 on 2023/2/20.
//  Copyright © 2023 Baidu. All rights reserved.
//

#import "NSBundle+NSBundleAdd.h"
#import "NSObject+PAITSwizzle.h"
#import "BDFaceLog.h"

@implementation NSBundle (NSBundleAdd)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL oldSel = @selector(pathForResource:ofType:);
        SEL newSel = @selector(tbpathForResource:ofType:);
        pait_swizzleInstanceMethodImplementation([NSBundle class], oldSel, newSel);
    });
}

- (NSString *)tbpathForResource:(NSString *)name ofType:(NSString *)ext {
    NSBundle *bundle = [NSBundle mainBundle];
    if (self == bundle && [name isEqualToString:@"com.baidu.idl.face.model.faceSDK.bundle"]) {
        NSBundle *bundle = [NSBundle bundleForClass:[BDFaceLog class]];
        NSLog(@"bundle path is %@", [bundle pathForResource:name ofType:ext]);
        NSString *path = [self tbpathForResource:name ofType:ext];
        NSLog(@"path is %@", path);
        NSLog(@"狗头找到了name is : %@", name);
        return [bundle tbpathForResource:name ofType:ext];

    }
     else if (self == bundle && [name isEqualToString:@"com.baidu.idl.face.live.action.image.bundle"]) {
         NSBundle *bundle = [NSBundle bundleForClass:[BDFaceLog class]];
         NSLog(@"bundle path is %@", [bundle pathForResource:name ofType:ext]);
         NSString *path = [self tbpathForResource:name ofType:ext];
         NSLog(@"path is %@", path);
         NSLog(@"狗头找到了name is : %@", name);
        return [bundle tbpathForResource:name ofType:ext];
    } else if (self == bundle && [name isEqualToString:@"com.baidu.idl.face.faceSDK.bundle"]) {
        NSBundle *bundle = [NSBundle bundleForClass:[BDFaceLog class]];
        NSLog(@"bundle path is %@", [bundle pathForResource:name ofType:ext]);
        NSString *path = [self tbpathForResource:name ofType:ext];
        NSLog(@"path is %@", path);
        NSLog(@"狗头找到了name is : %@", name);
        return [bundle tbpathForResource:name ofType:ext];
    }
    

    return [self tbpathForResource:name ofType:ext];
}

@end
