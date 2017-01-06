//
//  ViewController.m
//  XLKit
//
//  Created by root-sniper on 05/01/2017.
//  Copyright © 2017 root-sniper. All rights reserved.
//

#import "ViewController.h"
#import "TestISAOrign.h"
#import "NSObject+XLSwizzle.h"
#import "NSObject+XLInvocation.h"
#import "TestISASwizzle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testISA];
    [self testInvocation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testISA {
    TestISAOrign *orign = [TestISAOrign new];
    [orign sayHello];
    [orign swizzleClass:[TestISASwizzle class]];
    [orign sayHello];
}

- (void)testInvocation {
    TestISAOrign *orign = [TestISAOrign new];
    [orign performSelector:@selector(sayHello:des:)
               withObjects:@[@"Tony", @"nice to meet you!"]];
}
@end
