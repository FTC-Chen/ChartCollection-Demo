//
//  UIColor+HexColor.h
//  ChartCollection
//
//  Created by anyongxue on 2017/1/3.
//  Copyright © 2017年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

//每种原色有256种深度(0x 00--0x ff)
///组合起来，就是256^3种颜色（0x 00,00,00--0x ff,ff,ff）

#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]

#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

//宏定义
#define HexColor(HexValue,alphaValue) [UIColor colorWithRed:((float)((HexValue & 0xFF0000) >> 16))/255.0 green:((float)((HexValue & 0xFF00) >> 8))/255.0 blue:((float)(HexValue & 0xFF))/255.0 alpha:alphaValue]

@interface UIColor (HexColor)

+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;



+ (UIColor *)colorWithHex:(long)hexColor;

+ (UIColor *)colorWithHex:(long)hexColor alpha:(CGFloat)alpha;

@end
