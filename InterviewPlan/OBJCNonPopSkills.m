//
//  OBJCNonPopSkills.m
//  InterviewPlan
//
//  Created by Mike on 15-5-22.
//  Copyright (c) 2015年 Mike. All rights reserved.
//

#import "OBJCNonPopSkills.h"


@interface OBJCNonPopSkills()

//[objc]readonly属性支持扩展的写法
@property (nonatomic, copy)NSArray *friends;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, assign) double result;

@end

@implementation OBJCNonPopSkills

#pragma mark - objc最短的方法声明


//返回值的- (TYPE)如果不写括号，编译器默认认为是- (id)类型:
- init {
    //等价于 - (id)init {}
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

//参数如果不写类型默认也是id类型:
- (void)foo:arg {
    //等价于 - (void)foo:(id)arg
}

//有多参数时方法名和参数提示语可以为空
- (void):(id)arg1 :(id)arg2 {
    //省略前 - (void)foo:(id)arg1 bar:(id)arg2
}

//最短的函数可以写成这样
- _ {
    //等价于 - (id)_;
    return nil;
}

- :_ {
    
    //等价于 - (id) :(id)_
    return nil;
}

//PS: 方法名都没的方法只能靠performSelector来调用了，selector是":"



#pragma mark - 【C】结构体的初始化

- (void)struckInit {
    
//    CGRect rect1 = {1, 2, 3, 4}; //{1, 2, 3, 4}
    
//    CGRect rect2 = {.origin.x = 5, .size = {10, 10}}; //{5, 0, 10, 10}
    
    
//    CGRect rect3 = {1, 2};//{1, 2, 0, 0}
}

#pragma mark - [C]三元条件表达式的两元使用

- (void)ternaryConditionE {
//    三元条件表达式?:是C中唯一一个三目运算符，用来替代简单的if-else语句，同时也是可以两元使用的：
    
//    NSString *inputString = @"test";
//    NSString *testString = inputString ? : @"default";
    //等价于
//    NSString *testString = inputString ? inputString : @"default";
}


#pragma mark - [C]数组的下标初始化

- (void)cArrayInit {
    
//    const int numbers[] = {
//        [1] = 3,
//        [2] = 2,
//        [3] = 1,
//        [5] = 12306
//    };//{0, 3, 2, 1, 0, 12306}
    
//    这个特性可以用来做枚举值和字符串的映射
    
    typedef NS_ENUM(NSInteger, XXType) {
        XXType1,
        XXType2
    };
    
//    const NSString *XXTypeNameMapping[] = {
//        [XXType1] = @"Type1",
//        [XXType2] = @"Type2"
//    };
}

#pragma mark - [objc]可变参数类型的block

- (void)mutableParaTypeBlcok {

    void(^block1)(void);
    void(^block2)(int a);
    void(^block3)(NSNumber *a, NSString *b);
    
    void(^block)(); // 返回值为void，参数可变的block
    
    block = block1;
    block = block2;
    block = block3;
    
    block(1);//对应上面的block2
    block(@1, @"stirng"); //对应上面的block3
    block(@2); //对应上面的block3 ，第二个参数是nil
    
    
    
}


//block的主调和回调之间可以通过约定来决定block回传回来的参数是什么，有几个。如一个对网络层的调用：
- (void)requestDataWithApi:(NSInteger)api block:(void(^)())block {
    if (api == 0) {
        block(1, 2);
    }
    else if (api == 1) {
        block(@"1", @2, @[@"3", @"4", @"5"]);
    }
}

- (void)callRequestBlock {
    [self requestDataWithApi:0 block:^(NSInteger a, NSInteger b){
        //...
    }];
    
    [self requestDataWithApi:1 block:^(NSString *a, NSNumber *b, NSArray *c){
        //...
    }];
}



#pragma mark - [C]小括号内联复合表达式

- (void)innerLinkCombineE {
    
    self.backgroundView = ({
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor redColor];
        view.alpha = 0.8;
        view;
    });
    
    self.result = ({
        double result = 0;
        for (int i = 0; i <= M_2_PI; i+= M_PI_4) {
            result += sin(i);
        }
        
        result;
    });
}

@end
