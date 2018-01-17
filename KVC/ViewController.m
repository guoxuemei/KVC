//
//  ViewController.m
//  KVC
//
//  Created by guoxmei on 2018/1/16.
//  Copyright © 2018年 huayang. All rights reserved.
//

#import "ViewController.h"

@implementation Model

- (instancetype)initWithName:(NSString *)name price:(CGFloat)price amount:(NSInteger)amount hobbies:(NSArray *)hobbies {
    self = [super init];
    if (self) {
        _name = name;
        _price = price;
        _amount = amount;
        _hobbies = hobbies;
    }
    return self;
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Model *m1 = [[Model alloc] initWithName:@"aaa" price:12.5 amount:5 hobbies:@[@"骑马",@"摔跤",@"滑雪"]];
    Model *m2 = [[Model alloc] initWithName:@"bbb" price:1.5 amount:1 hobbies:@[@"琴",@"棋",@"书",@"画"]];
    Model *m3 = [[Model alloc] initWithName:@"aaa" price:10 amount:6 hobbies:@[@"偷东西"]];
    Model *m4 = [[Model alloc] initWithName:@"ddd" price:6.66 amount:7 hobbies:@[@"iOS 编程",@"画"]];
    
    Model *m5 = [[Model alloc] initWithName:@"ccc" price:1999 amount:9 hobbies:@[@"排球",@"羽毛球",@"书"]];
    Model *m6 = [[Model alloc] initWithName:@"fff" price:0 amount:1 hobbies:@[@"游泳"]];
    NSArray *array1 = [[NSArray alloc] initWithObjects:m1,m2,m3,m4, nil];
    NSArray *array2 = [[NSArray alloc] initWithObjects:m5,m6, nil];
    
    /************* Aggregation Operators 聚合运算符,会得到一个NSNumber *************/
    //amount求和
    NSNumber *sum = [array1 valueForKeyPath:[NSString stringWithFormat:@"@%@.amount",NSSumKeyValueOperator]];
    NSLog(@"sum = %@",sum);
    
    //price求平均值
    NSNumber *avg = [array1 valueForKeyPath:@"@avg.price"];
    NSLog(@"avg = %@",avg);
    
    // price求最大值
    NSNumber *max = [array1 valueForKeyPath:@"@max.price"];
    NSLog(@"max = %@",max);
    
    // amount求最小值
    NSNumber *min = [array1 valueForKeyPath:@"@min.amount"];
    NSLog(@"min = %@",min);
    
    //求数组数量,这是唯一不需要 right key path 的 operator
    NSNumber *count = [array1 valueForKeyPath:@"@count"];
    NSLog(@"count = %@",count);
    
    /*************** Array Operators 得到某个属性的所有值的数组 ***************/
    //name 去重后的数组 @[NSString]
    NSArray *distinctNameObjects = [array1 valueForKeyPath:@"@distinctUnionOfObjects.name"];
    NSLog(@"distinctNameObjects = %@",distinctNameObjects);
    
    //price 不去重的数组,即所有的 price 值的数组 @[NSNumber]
    NSArray *priceObjects = [array1 valueForKeyPath:@"@unionOfObjects.price"];
    NSLog(@"priceObjects = %@",priceObjects);
    
    //hobbies 不去重的数组,即所有的 hobbies 值的数组 @[NSArray]
    NSArray *hobbiesObjects = [array1 valueForKeyPath:@"@unionOfObjects.hobbies"];
    NSLog(@"hobbiesObjects = %@",hobbiesObjects);
    
    /*************** Nesting Operators 对集合中的集合的元素操作符 ***************/
    NSArray *bigArray = [[NSArray alloc] initWithObjects:array1,array2, nil];

    //获取所有 name 属性的所有值,去重,其数据类型为 @[NSString];
    NSArray *distinctNameArray = [bigArray valueForKeyPath:@"@distinctUnionOfArrays.name"];
    NSLog(@"distinctNameArray = %@",distinctNameArray);
    
    //获取所有 hobbies 属性的所有值,其数据类型为 @[NSArray];
    NSArray *hobbiesArray = [bigArray valueForKeyPath:@"@unionOfArrays.hobbies"];
    NSLog(@"hobbiesArray = %@",hobbiesArray);
    
    //考虑下面的用法,对比一下上面hobbiesArray获得的内容 取到的是 array1 所有 hobbies 所包含的全部元素
    NSArray *hobbiesArray2 = [array1 valueForKeyPath:@"@unionOfArrays.hobbies"];
    NSLog(@"hobbiesArray2 = %@",hobbiesArray2);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
