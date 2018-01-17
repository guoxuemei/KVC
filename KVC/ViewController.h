//
//  ViewController.h
//  KVC
//
//  Created by guoxmei on 2018/1/16.
//  Copyright © 2018年 huayang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Model: NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, assign) CGFloat   price;
@property(nonatomic, assign) NSInteger amount;
@property(nonatomic, strong) NSArray  *hobbies;

@end

@interface ViewController : UIViewController

@end

