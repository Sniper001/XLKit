//
// Created by root-sniper on 05/01/2017.
// Copyright (c) 2017 root-sniper. All rights reserved.
//

#import "NSObject+XLSwizzle.h"
#import <objc/runtime.h>

@implementation NSObject (XLSwizzle)

/**
 * 方法替换
 */
+ (void)swizzleMethod:(Class)cls origSel:(SEL)origSEL newSel:(SEL)newSEL {
    Method origMethod = class_getInstanceMethod(cls, origSEL);
    Method newMethod = nil;
    if (!origMethod) {
        //不是类方法,是实例方法
        origMethod = class_getClassMethod(cls, origSEL);
        if (!origMethod) {
            return;
        }
        newMethod = class_getClassMethod(cls, newSEL);
        if (!newMethod) {
            return;
        }
    } else {
        //类方法替换
        newMethod = class_getInstanceMethod(cls, newSEL);
        if (!newMethod) {
            return;
        }
    }

    // cls中不存在origSEL对应方法实现则添加成功,否则失败
    if (class_addMethod(cls, origSEL, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
        class_replaceMethod(cls, newSEL, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, newMethod);
    }
}

/**
 * isa-swizzle
 */
- (void)swizzleClass:(Class)cls {
    //确保要替换的类和之前类大小一样,不能添加任何属性和方法
    NSAssert(class_getInstanceSize([self class]) == class_getInstanceSize(cls), @"Classes must be the same size to swizzle.");

    //设置当前对象为某个替换类
    object_setClass(self, cls);
}
@end