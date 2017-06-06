# 代码测试深拷贝 浅拷贝
***
## 原因
以前只是知道 一个对象copy了之后，再改变copy之后的值，就不会影响原来的值，一直对深copy，浅copy 的原理 不太清楚。但是面试的时候 面试官总是要问深copy 浅copy 的原理，只好自己实现下了。

## 介绍
主要测试 NSString 和 NSMutableString

## 1.测试 NSString

废话少说 上代码
``` 
/** 测试NSString 内存地址 copy */
-(void)testString{
    NSString *a1 = @"123";
    NSLog(@"---- a1 指针内存地址：%p,指针所指向对象的地址：%p \n",&a1,a1);
    NSString *b1= a1;
    NSLog(@"---- b1 指针内存地址：%p,指针所指向对象的地址：%p \n",&b1,b1);
    NSString *a1Copy = [a1 copy];
    NSLog(@"---- a1Copy 指针内存地址：%p,指针所指向对象的地址：%p \n",&a1Copy,a1Copy);
}
 ```
输出结果
```
2017-06-06 11:11:32.411 test[20279:7298589] ---- a1 指针内存地址：0x7fff57ddda58,指针所指向对象的地址：0x107e22068 
2017-06-06 11:11:32.411 test[20279:7298589] ---- b1 指针内存地址：0x7fff57ddda50,指针所指向对象的地址：0x107e22068 
2017-06-06 11:11:47.762 test[20279:7298589] ---- a1Copy 指针内存地址：0x7fff57ddda48,指针所指向对象的地址：0x107e22068 
(lldb) 
```
截图说明

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/2384741-50df43b8adb1da56.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

结论说明
***
`
NSString 无论是 重新赋值(=),还是 copy，他们指向的对象的地址 都是相同的，所以NSString 的copy 是浅copy。
`



##  2. 测试 NSMutableString

测试代码
```
/** 测试 NSMutableString 内存地址 copy */
-(void)testMutableString{
    
    NSMutableString *c1 = [[NSMutableString alloc] initWithString:@"12345678"];
    NSLog(@"---- c1 指针内存地址：%p,指针所指向对象的地址：%p \n",&c1,c1);
    
    NSString *c1Copy = [c1 copy];
    NSLog(@"---- c1Copy 指针内存地址：%p,指针所指向对象的地址：%p \n",&c1Copy,c1Copy);
    
    NSString *c1Mucopy = [c1 mutableCopy];
    NSLog(@"---- c1Mucopy 指针内存地址：%p,指针所指向对象的地址：%p \n",&c1Mucopy,c1Mucopy);
    
    [c1 appendString:@"0000"];
    NSLog(@"c1=%@,c1Copy=%@,c1Mucopy=%@",c1,c1Copy,c1Mucopy );
}
```

输出结果
```
2017-06-06 11:22:04.314 test[20398:7351851] ---- c1 指针内存地址：0x7fff5250ca58,指针所指向对象的地址：0x608000074c80 
2017-06-06 11:22:04.314 test[20398:7351851] ---- c2 指针内存地址：0x7fff5250ca50,指针所指向对象的地址：0x608000074c80 
2017-06-06 11:22:04.314 test[20398:7351851] ---- c1Copy 指针内存地址：0x7fff5250ca48,指针所指向对象的地址：0xa007a87dcaecc2a8 
2017-06-06 11:22:04.315 test[20398:7351851] ---- c1Mucopy 指针内存地址：0x7fff5250ca40,指针所指向对象的地址：0x608000074f80 
2017-06-06 11:22:07.489 test[20398:7351851] c1=123456780000,c1Copy=12345678,c1Mucopy=12345678,c2=123456780000
```

截图说明

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/2384741-992e9f10e7cbc622.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

结论说明
***
`
1.NSMutableString 赋值(=) ,原对象值改变，赋值后的对象也会改变，指针指向对象的地址 相同。
2.copy，mutableCopy 原对象值改变 ，copy，mutableCopy 后的值都不会改变，且 指针指向对象的地址不同，是 深 copy。
`


### 后续
测试代码地址： https://github.com/lizhi0123/TestCopyAddress


要是有什么不同的见解 或疑问 ，请留言。
