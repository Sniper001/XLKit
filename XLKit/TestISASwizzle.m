//
// Created by root-sniper on 06/01/2017.
// Copyright (c) 2017 root-sniper. All rights reserved.
//

#import "TestISASwizzle.h"

@implementation TestISASwizzle

- (void)sayHello {
    NSLog(@"say hello to TestISASwizzle first");
    [super sayHello];
}
@end