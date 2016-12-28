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
    ctx = UIGraphicsGetCurrentContext();

//    CGContextSetRGBStrokeColor(ctx,140/255.0,140/255.0,140/255.0,1.0);//画笔线的颜色
//    
//    CGContextSetLineWidth(ctx, 5.0);//线的宽度
//    
//    //CGContextAddArc(ctx, 100, 20, 15, 0, 2*M_PI, 0); //添加一个圆
//    
//    CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, (self.frame.size.height-10)/2, 0,  2*M_PI, 0);
//    
//    CGContextDrawPath(ctx, kCGPathStroke); //绘制路径
    
    
    //贝塞尔曲线
    UIBezierPath *bgPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2,self.bounds.size.height / 2) radius:self.bounds.size.height / 2 - 6 / 2 startAngle:-M_PI_2 endAngle:1.5 * M_PI clockwise:YES];
    
    UIColor *storkeColor = PNmidGray;
    
    [storkeColor setStroke];
    
    bgPath.lineWidth = 5;
    
    [bgPath stroke];
    
    
    //比例显示
    //显示比例动画
    //[self currentScaleAnimation];
    
}

//当前比例
- (void)currentScaleAnimation{
    
    [UIView animateWithDuration:1.8 animations:^{
        
        CGContextSetRGBStrokeColor(ctx,77.0/255.0,196.0/255.0,122.0/255.0,1.0);//比例显示颜色
        
        CGContextSetLineWidth(ctx, 5.0);//线的宽度
        
        //CGContextAddArc(ctx, 100, 20, 15, 0, 2*M_PI, 0); //添加一个圆
        
        CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, (self.frame.size.height-10)/2, (3/2*M_PI),(3/2*M_PI + 2*M_PI), 1);//最后参数,clockwise, 0是逆,1是顺
        
        CGContextDrawPath(ctx, kCGPathStroke); //绘制路径
       
    }];
    
}

@end
