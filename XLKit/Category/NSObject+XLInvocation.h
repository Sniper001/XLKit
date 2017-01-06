//
// Created by root-sniper on 05/01/2017.
// Copyright (c) 2017 root-sniper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XLInvocation)

- (id)performSelector:(SEL)pSelector withObjects:(NSArray *)objects;
@end