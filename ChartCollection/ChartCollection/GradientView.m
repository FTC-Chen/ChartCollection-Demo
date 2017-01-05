//
//  GradientView.m
//  ChartCollection
//
//  Created by anyongxue on 2017/1/5.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "GradientView.h"
#import "UIColor+HexColor.h"

#define HEXCOLOR(hexColor) [UIColor colorWithHex:hexColor]

@interface GradientView ()

@property (nonatomic,strong)NSArray *topColorArray;
@property (nonatomic,strong)NSArray *centerColorArray;
@property (nonatomic,strong)NSArray *bottomColorArray;

@property (nonatomic,strong)CAGradientLayer * gradientLayer;

@end

@implementation GradientView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        //创建颜色数组
        [self creatColors];
        
        //创建gradientLayer 渐变layer
        [self.layer addSublayer:self.gradientLayer];

    }
    
    return self;
}

//创建数组
- (void)creatColors{
    
    self.topColorArray = @[HEXCOLOR(0xff2a01),HEXCOLOR(0xec1f41),
                           HEXCOLOR(0xff2a01),HEXCOLOR(0xff5801),
                           HEXCOLOR(0xf15916),HEXCOLOR(0xf57d0c),
                           HEXCOLOR(0xdba337),HEXCOLOR(0xdbd034),
                           HEXCOLOR(0xffad01),HEXCOLOR(0xe5df1f),
                           HEXCOLOR(0x5ec36d),HEXCOLOR(0x5fc36d),
                           HEXCOLOR(0x69bff3),HEXCOLOR(0x17afc0),
                           HEXCOLOR(0x108ef2)];
    
    self.centerColorArray = @[HEXCOLOR(0xF5311E),HEXCOLOR(0xf0418d),
                              HEXCOLOR(0xf66042),HEXCOLOR(0xffab3a),
                              HEXCOLOR(0xf87b43),HEXCOLOR(0xf6960b),
                              HEXCOLOR(0xe9c34f),HEXCOLOR(0xe6d733),
                              HEXCOLOR(0xf8d423),HEXCOLOR(0xe2ec3c),
                              HEXCOLOR(0x30cb9a),HEXCOLOR(0x82d273),
                              HEXCOLOR(0x2adbbd),HEXCOLOR(0x19c5b5),
                              HEXCOLOR(0x4baef3)];
    
    self.bottomColorArray = @[HEXCOLOR(0xf3735a),HEXCOLOR(0xf14ea9),
                              HEXCOLOR(0xf3735a),HEXCOLOR(0xffcf53),
                              HEXCOLOR(0xfa814c),HEXCOLOR(0xf7a20a),
                              HEXCOLOR(0xf7e568),HEXCOLOR(0xf6e232),
                              HEXCOLOR(0xf6e12f),HEXCOLOR(0xe0f956),
                              HEXCOLOR(0x1bcfae),HEXCOLOR(0x92d975),
                              HEXCOLOR(0x05ec9d),HEXCOLOR(0x1acfaf),
                              HEXCOLOR(0x69bdf4)];
}

- (CAGradientLayer *)gradientLayer{
    
    if (_gradientLayer == nil) {
        
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = self.bounds;
        //取出颜色
        UIColor *topColor = self.topColorArray[0];
        UIColor *centerColor = self.centerColorArray[0];
        UIColor *bottomColor = self.bottomColorArray[0];
        //颜色分配
        gradientLayer.colors = [NSArray arrayWithObjects:
                                (__bridge id)[bottomColor CGColor],
                                (__bridge id)[centerColor CGColor],
                                (__bridge id)[topColor CGColor],nil];
        //颜色分割线
        gradientLayer.locations = @[@0.3, @0.7, @1 ];
        
        // 起始点
        gradientLayer.startPoint = CGPointMake(0.5, 1);
        
        // 结束点
        gradientLayer.endPoint   = CGPointMake(0.5, 0);
        
        _gradientLayer = gradientLayer;
    }

    return _gradientLayer;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
