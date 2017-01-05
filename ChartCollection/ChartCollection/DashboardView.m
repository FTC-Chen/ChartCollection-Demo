//
//  DashboardView.m
//  ChartCollection
//
//  Created by anyongxue on 2017/1/5.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "DashboardView.h"


#define degreesToRadians(x) (M_PI*(x)/180.0) //把角度转换成PI的方式

static const CGFloat kMarkerRadius = 5.f; // 光标直径

@interface DashboardView ()

@property (nonatomic,assign)CGFloat circelDiameter; //圆直径
@property (nonatomic,strong)CAShapeLayer *bottomLayer; //进度条底色
@property (nonatomic,assign)CGFloat lineWidth; // 弧线宽度
@property (nonatomic,assign)CGFloat startAngle; // 开始角度
@property (nonatomic,assign)CGFloat endAngle; // 结束角度

@property (nonatomic,strong)UIImageView *markImageView; //光标

@property (nonatomic,strong)UILabel *numberLable;//数字label

@end

@implementation DashboardView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor grayColor];
        
        self.circelDiameter = self.frame.size.width-10.f;
        self.lineWidth = 2.f;
        self.startAngle = -200.f;
        self.endAngle = 20.f;

        //调整图片
        self.bgImageView.frame = CGRectMake(5, 6, self.circelDiameter, self.circelDiameter * 2 / 3);
        self.bgImageView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.bgImageView];

        //背景圆环
        [self creatBgCircle];

        //光标
        [self creatMarkImageView];
        
        //添加跳跃数字
        [self creatNumberLabe];
    }

    return self;
}

//背景圆环
- (void)creatBgCircle{
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2,self.bounds.size.height/2) radius:(self.circelDiameter - self.lineWidth)/2 startAngle:degreesToRadians(self.startAngle) endAngle:degreesToRadians(self.endAngle) clockwise:YES];
    
    //背景颜色
    self.bottomLayer = [CAShapeLayer layer];
    self.bottomLayer.frame = self.bounds;
    self.bottomLayer.fillColor = [[UIColor clearColor] CGColor];
    self.bottomLayer.strokeColor = [[UIColor  colorWithRed:206.f / 255.f green:241.f / 255.f blue:227.f/255.f alpha:1.f] CGColor];
    self.bottomLayer.opacity = 0.5;
    self.bottomLayer.lineCap = kCALineCapRound;
    self.bottomLayer.lineWidth = self.lineWidth;
    self.bottomLayer.path = [circlePath CGPath];
    [self.layer addSublayer:self.bottomLayer];
}

- (void)creatMarkImageView{
    
    if (_markImageView) {
        return;
    }
    _markImageView = [[UIImageView alloc] init];
    _markImageView.backgroundColor = [UIColor clearColor];
    _markImageView.layer.backgroundColor = PNFreshGreen.CGColor;
    _markImageView.layer.shadowColor = [UIColor whiteColor].CGColor;
    _markImageView.layer.shadowOffset = CGSizeMake(0, 0);
    _markImageView.layer.shadowRadius = kMarkerRadius*0.5;
    _markImageView.layer.shadowOpacity = 1;
    _markImageView.layer.masksToBounds = NO;
    self.markImageView.layer.cornerRadius = self.markImageView.frame.size.height / 2;
    [self addSubview:self.markImageView];
    _markImageView.frame = CGRectMake(-100, self.frame.size.height-20, kMarkerRadius, kMarkerRadius);
}


- (void)creatNumberLabe{
    
    if (_numberLable) {
        return;
    }

    CGFloat width = self.circelDiameter / 2 + 18;
    CGFloat height = self.circelDiameter / 2;
    CGFloat xPixel = CGRectGetMinX(self.bgImageView.frame)+ (self.bgImageView.frame.size.width - width)*0.5;  //self.circelRadius / 4;
    CGFloat yPixel = self.circelDiameter / 4;
    CGRect labelFrame = CGRectMake(xPixel, yPixel, width, height);

    _numberLable = [[UILabel alloc] initWithFrame:labelFrame];
    _numberLable.backgroundColor = [UIColor clearColor];
    _numberLable.textColor = [UIColor whiteColor];
    _numberLable.textAlignment = NSTextAlignmentCenter;
    _numberLable.font = [UIFont systemFontOfSize:70.f];
//    _numberLable.text = [NSString stringWithFormat:@"%ld",jumpCurrentNO];
    _numberLable.text = @"700";
    [self addSubview:_numberLable];
}



- (UIImageView *)bgImageView {
    
    if (nil == _bgImageView) {
        
        _bgImageView = [[UIImageView alloc] init];
    }
    return _bgImageView;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
