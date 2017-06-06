//
//  ViewController.m
//  test
//
//  Created by SunnyZhang on 2017/6/5.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self testString];
    
    [self testMutableString];
    
    NSLog(@"123");
    NSLog(@"123");
    
}


/** 测试NSString 内存地址 copy */
-(void)testString{
    NSString *a1 = @"123";
    NSLog(@"---- a1 指针内存地址：%p,指针所指向对象的地址：%p \n",&a1,a1);
    NSString *b1= a1;
    NSLog(@"---- b1 指针内存地址：%p,指针所指向对象的地址：%p \n",&b1,b1);
    NSString *a1Copy = [a1 copy];
    NSLog(@"---- a1Copy 指针内存地址：%p,指针所指向对象的地址：%p \n",&a1Copy,a1Copy);
}

/** 测试 NSMutableString 内存地址 copy */
-(void)testMutableString{
    
    NSMutableString *c1 = [[NSMutableString alloc] initWithString:@"12345678"];
    NSLog(@"---- c1 指针内存地址：%p,指针所指向对象的地址：%p \n",&c1,c1);
    
    NSMutableString *c2 = c1;
     NSLog(@"---- c2 指针内存地址：%p,指针所指向对象的地址：%p \n",&c2,c2);
    
    NSString *c1Copy = [c1 copy];
    NSLog(@"---- c1Copy 指针内存地址：%p,指针所指向对象的地址：%p \n",&c1Copy,c1Copy);
    
    NSString *c1Mucopy = [c1 mutableCopy];
    NSLog(@"---- c1Mucopy 指针内存地址：%p,指针所指向对象的地址：%p \n",&c1Mucopy,c1Mucopy);
    
    [c1 appendString:@"0000"];
    NSLog(@"c1=%@,c1Copy=%@,c1Mucopy=%@,c2=%@",c1,c1Copy,c1Mucopy,c2 );
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
