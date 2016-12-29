//
//  CircleScaleView.m
//  ChartCollection
//
//  Created by anyongxue on 2016/12/28.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "CircleScaleView.h"

@implementation CircleScaleView

@synthesize ctx;

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //画边框圆形
    //背景
//    ctx = UIGraphicsGetCurrentContext();
//
//    CGContextSetRGBStrokeColor(ctx,140/255.0,140/255.0,140/255.0,1.0);//画笔线的颜色
//    
//    CGContextSetLineWidth(ctx, 5.0);//线的宽度
//    
//    //CGContextAddArc(ctx, 100, 20, 15, 0, 2*M_PI, 0); //添加一个圆
//    
//    CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, (self.frame.size.height-10)/2, 0,  2*M_PI, 0);
    
//    CGContextDrawPath(ctx, kCGPathStroke); //绘制路径
    
    
    //1.贝塞尔曲线
    UIBezierPath *bgPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2,self.bounds.size.height / 2) radius:self.bounds.size.height / 2 - 9 / 2 startAngle:-M_PI_2 endAngle:1.5* M_PI clockwise:YES];
    
    UIColor *storkeColor = PNmidGray;
    
    [storkeColor setStroke];
    
    bgPath.lineWidth = 8;
    
    [bgPath stroke];

    //比例显示
    //1.显示比例动画  CABasicAnimation形式
    //[self currentScaleAnimation];
    
    //2.显示比例动画  NSTimer形式
    UIBezierPath *scalePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2,self.bounds.size.height / 2) radius:self.bounds.size.height / 2 - 9 / 2 startAngle:(CGFloat)-M_PI_2 endAngle:(CGFloat)(- M_PI_2 + self.animationTime * 2*M_PI) clockwise:YES];
    
    UIColor *scaleColor = PNFreshGreen;
    
    [scaleColor setStroke];
    
    scalePath.lineWidth = 8;
    
    [scalePath stroke];
}

//当前比例动画  CABasicAnimation形式
- (void)currentScaleAnimation{
    
    UIBezierPath *scalePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2,self.bounds.size.height / 2) radius:self.bounds.size.height / 2 - 9 / 2 startAngle:-M_PI_2 endAngle:(- M_PI_2 + self.currentValue/self.maxValue * 2 * M_PI) clockwise:YES];
    
    //加入cashapelayer
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.path = scalePath.CGPath;
    circleLayer.lineCap       = kCALineCapRound;
    circleLayer.lineWidth = 8;
    circleLayer.frame = self.bounds;
    circleLayer.fillColor = [UIColor clearColor].CGColor;
    circleLayer.strokeColor = PNFreshGreen.CGColor;
    [self.layer addSublayer:circleLayer];
    
    //动画
    CABasicAnimation *baseAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    baseAnima.duration = 2.8;
    baseAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    baseAnima.delegate = self;
    baseAnima.fromValue = [NSNumber numberWithInteger:0];
    baseAnima.toValue = [NSNumber numberWithInteger:1];
    [circleLayer addAnimation:baseAnima forKey:@"strokeEndAnimation"];

}

- (void)startAnimationTimer{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(NSTimerScaleAnimation) userInfo:nil repeats:YES];
}

//当前比例动画  NSTimer形式
- (void)NSTimerScaleAnimation{
    
    self.animationTime = self.animationTime+0.003;
    
    NSLog(@"%f",self.animationTime);
    
    if (self.animationTime <= self.currentValue/self.maxValue) {
        
        [self setNeedsDisplay];
    
    }else{
        
        [self.timer invalidate];
    }

}

- (void)dealloc{
    
    [self.timer invalidate];
}
@end
