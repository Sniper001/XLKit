//
// Created by root-sniper on 05/01/2017.
// Copyright (c) 2017 root-sniper. All rights reserved.
//

#import "NSObject+XLInvocation.h"

@implementation NSObject (XLInvocation)

/**
 * 方法转发
 */
- (id)performSelector:(SEL)pSelector withObjects:(NSArray *)objects {

    //根据selector创建签名对象
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:pSelector];

    //判断是否有方法
    if (signature == nil) {
        return nil;
    }

    //创建invocation对象
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = pSelector;

    //invocation第一个参数是self, 第二个是_cmd
    NSInteger argsCount = signature.numberOfArguments - 2;

    // 取最小值防止越界
    NSInteger objectsCount = objects.count;
    NSInteger count = MIN(argsCount, objectsCount);

    for (int i = 0; i < count; i++) {
        NSObject *obj = objects[i];
        if ([obj isKindOfClass:[NSNull class]]) {
            obj = nil;
        }
        [invocation setArgument:&obj atIndex:i + 2];
    }

    //调用invocation对象
    [invocation invoke];
    id res = nil;
    if (signature.methodReturnLength != 0) {
        [invocation getReturnValue:&res];
    }
    return res;
}
@end