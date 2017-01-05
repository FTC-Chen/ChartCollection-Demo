//
//  ColorProtocol.h
//  ChartCollection
//
//  Created by anyongxue on 2017/1/4.
//  Copyright © 2017年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ColorProtocol <NSObject>

//作用:专门用来声明一大堆方法. (不能声明属性,也不能实现方法,只能用来写方法的声明).

//-只要某个类遵守了这个协议.就相当于拥有这个协议中的所有的方法声明.

/*
 类是单继承. 但是协议可以多遵守
 
 1个类只能有1个父类
 但是1个类可以同时遵守多个个协议.
 */

//协议可以遵守另外1个协议,并且可以遵守多个协议


//协议可以继承另外1个协议. A 协议 继承了 B协议. 那么A协议中不仅有自己的方法的声明,还有B协议中的方法的声明

//如果有1个类遵守了A协议，那么这个类就拥有了, A、B协议中的所有的方法的声明.

//协议可以继承另外1个协议. A 协议 继承了 B协议. 那么A协议中不仅有自己的方法的声明,还有B协议中的方法的声明.

- (void)changeColor;

- (void)changeRGBcolor;

@optional

- (void)changeAllColor;


@end
