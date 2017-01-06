//
// Created by root-sniper on 05/01/2017.
// Copyright (c) 2017 root-sniper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XLSwizzle)

+ (void)swizzleMethod:(Class)cls origSel:(SEL)origSEL newSel:(SEL)newSEL;

- (void)swizzleClass:(Class)cls;
@end