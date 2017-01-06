//
// Created by root-sniper on 06/01/2017.
// Copyright (c) 2017 root-sniper. All rights reserved.
//

#import "TestISAOrign.h"

@implementation TestISAOrign
- (void)sayHello {
    NSLog(@"say hello to TestISAOrign");
}

- (void)sayHello:(NSString *)name des:(NSString *)des {
    NSLog(@"say hello to TestISAOrign name:%@, %@", name, des);
}
@end