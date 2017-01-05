//
//  ColorDelegateViewController.h
//  ChartCollection
//
//  Created by anyongxue on 2017/1/4.
//  Copyright © 2017年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorTestViewController.h"

//Block内部能够读取外部局部变量的值。
//但我们需要改变这个变量的值时，我们需要给它附加上__block修饰符。

//传值用block  返回值类型-block变量名-形参列表


//  返回值类型(^block变量名)(形参列表) = ^(形参列表) {
//  };


//block的格式：
//a：Block的返回值类型，可以为空(void);
//b：Block对象名称，可以理解为变量名；
//^：块的语法标记，声明b为一个Block对象;  "脱字符"
//c：第一个参数类型
//d：第二个参数类型
//name1，name2：参数名;
//{}：Block代码块的主题部分。


//  block变量名(实参);
typedef void (^SendValueBlock)(NSString *);

typedef void (^ChangeColorBlock)(id);

//传值用代理
@protocol sendValueBackDelegate <NSObject>

- (void)sendValue:(NSString *)value;

@end

@interface ColorDelegateViewController : UIViewController<changeColorDelegate>

@property (nonatomic,weak)id <sendValueBackDelegate> valueBackDelegate;

@property (nonatomic,copy)SendValueBlock block;

@property (nonatomic,copy)ChangeColorBlock colorBlock;

@end
