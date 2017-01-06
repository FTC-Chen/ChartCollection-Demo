//
//  DashboardView.m
//  ChartCollection
//
//  Created by anyongxue on 2017/1/5.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "DashboardView.h"


#define degreesToRadians(x) (M_PI*(x)/180.0) //把角度转换成PI的方式

static const CGFloat kMarkerRadius = 5.f; //光标直径
static const CGFloat kTimerInterval = 0.03;
static const NSInteger MaxNumber = 1000;
static const CGFloat kFastProportion = 0.9;

@interface DashboardView ()

@property (nonatomic,assign)CGFloat circelDiameter; //圆直径
@property (nonatomic,strong)CAShapeLayer *bottomLayer; //进度条底色
@property (nonatomic,assign)CGFloat lineWidth; // 弧线宽度
@property (nonatomic,assign)CGFloat startAngle; // 开始角度
@property (nonatomic,assign)CGFloat endAngle; // 结束角度

@property (nonatomic,strong)UIImageView *markImageView; //光标

@property (nonatomic,strong)UILabel *numberLable;//数字label

@property (nonatomic,assign)NSInteger beginNum; //开始数字
@property (nonatomic,assign)NSInteger jumpCurrentNum;
@property (nonatomic,assign)NSInteger endNum;//结束数字//
@property (nonatomic,assign)CGFloat percent; //百分比
@property (nonatomic,assign)NSInteger intervalNum;//

@property (nonatomic,assign)CGFloat animationTime;//动画时间

@property (nonatomic, strong) NSTimer * fastTimer;
@property (nonatomic, strong) NSTimer * slowTimer;

@end

@implementation DashboardView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
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
    _markImageView.layer.backgroundColor = PNDeepGreen.CGColor;
    _markImageView.layer.shadowColor = [UIColor whiteColor].CGColor;
    _markImageView.layer.shadowOffset = CGSizeMake(0, 0);
    _markImageView.layer.shadowRadius = kMarkerRadius*0.5;
    _markImageView.layer.shadowOpacity = 1;
    _markImageView.layer.masksToBounds = NO;
    self.markImageView.layer.cornerRadius = self.markImageView.frame.size.height / 2;
    [self addSubview:self.markImageView];
    _markImageView.frame = CGRectMake(0, self.bounds.size.height-20, kMarkerRadius, kMarkerRadius);
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
    _numberLable.text = [NSString stringWithFormat:@"%ld",_jumpCurrentNum];
//    _numberLable.text = @"700";
    [self addSubview:_numberLable];
}


- (void)refreshFromStartNum:(NSString *)startNum toEndNum:(NSString *)endNum{
    
    _beginNum = 0;//[startNO integerValue];
    _jumpCurrentNum = 0;//[startNO integerValue];
    _endNum = [endNum integerValue];
    
    _percent = _endNum * 100 / MaxNumber;
    
    NSInteger diffValue = _endNum - _beginNum;//差值
    
    if (diffValue <= 0) {
        
        return;
    }
    if (diffValue < 100) {
        
        _intervalNum = 5;
        
    } else if (diffValue < 300) {
        
        _intervalNum = 15;
        
    } else if (diffValue <= MaxNumber) {
        
        _intervalNum = 10;
    }
    
    NSLog(@"数字间隔：%ld",_intervalNum);
    
    //跳跃数字处理
    [self setupNumnberChange];
    
    //光标
    [self createAnimationWithStartAngle:degreesToRadians(self.startAngle)
                               endAngle:degreesToRadians(self.startAngle + 220 * _percent / 100)];
}

//跳跃数字处理
- (void)setupNumnberChange{

     _animationTime = _percent * kTimerInterval;
    
    self.fastTimer = [NSTimer timerWithTimeInterval:kTimerInterval*kFastProportion target:self selector:@selector(fastTimerAction) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:_fastTimer forMode:NSRunLoopCommonModes];
    
    //时间间隔 = （总时间 - 快时间间隔*变化次数）/ 再次需要变化的次数
    
    //快时间
    NSInteger fastEndNO = _endNum * kFastProportion;
    
    NSInteger fastJump = fastEndNO/_intervalNum;//每一次跳转多少
    
    if (fastJump %_intervalNum ) {
        
        fastJump++;
        
        fastEndNO += _intervalNum;
    }
    
    CGFloat fastTTime = fastJump * kTimerInterval * kFastProportion;
    
    //剩余应跳动次数
    NSInteger changNO = _endNum - fastEndNO;
    
    NSInteger endJump = changNO / _intervalNum + changNO % _intervalNum;
    
    //慢时间间隔
    NSTimeInterval slowInterval = (_animationTime - fastTTime) / endJump;
    
    self.slowTimer = [NSTimer timerWithTimeInterval:slowInterval
                                             target:self
                                           selector:@selector(slowTimerAction)
                                           userInfo:nil
                                            repeats:YES];

    [[NSRunLoop currentRunLoop] addTimer:_slowTimer forMode:NSRunLoopCommonModes];
    
    [_fastTimer setFireDate:[NSDate distantFuture]];//关闭
    
    [_slowTimer setFireDate:[NSDate distantFuture]];//关闭
}

#pragma mark 加速定时器触发事件
- (void)fastTimerAction {
    
    //超过最大即停止运行计时器
    if (_jumpCurrentNum >= _endNum) {
        
        [self.fastTimer invalidate];
        
        return;
    }
    
    //超过比例 当前比例为0.9 即停止快速 开启慢速
    if (_jumpCurrentNum >= _endNum*kFastProportion) {
        
        [self.fastTimer invalidate];
        
        [self.slowTimer setFireDate:[NSDate distantPast]];//开启
        //关闭  ［time setFireDate:[NSDate  distantFunture]］
        return;
    }
    
    [self commonTimerAction];
}


#pragma mark 减速定时器触发事件
- (void)slowTimerAction {
    
    if (_jumpCurrentNum >= _endNum) {
        
        [self.slowTimer invalidate];
        
        return;
    }
    
    [self commonTimerAction];
}

#pragma mark 计时器共性事件 - lable赋值 背景颜色变化
- (void)commonTimerAction {
    
    if (_jumpCurrentNum % 100 == 0 && _jumpCurrentNum != 0) {
    
        NSInteger colorIndex = _jumpCurrentNum / 100;

        dispatch_async(dispatch_get_main_queue(), ^{
           
            if (self.TimerBlock) {
               
                self.TimerBlock(colorIndex);
            }
        });
        
    }

    NSInteger changeValueBy = _endNum - _jumpCurrentNum;
    
    if (changeValueBy/10 < 1) {
    
        _jumpCurrentNum++;
    
    }else{
    
        //NSInteger changeBy = changeValueBy / 10;
        _jumpCurrentNum += _intervalNum;
    }

     _numberLable.text = [NSString stringWithFormat:@"%ld",_jumpCurrentNum];

}

#pragma mark - Animation
- (void)createAnimationWithStartAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle { // 光标动画
    
    //启动定时器
    [_fastTimer setFireDate:[NSDate distantPast]];
    
    // 设置动画属性
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.duration = _percent * kTimerInterval;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    pathAnimation.repeatCount = 1;
    
    // 设置动画路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, self.frame.size.width / 2, self.frame.size.height / 2, (self.circelDiameter - kMarkerRadius / 2) / 2, startAngle, endAngle, 0);
    pathAnimation.path = path;
    CGPathRelease(path);
    
    [self.markImageView.layer addAnimation:pathAnimation forKey:@"moveMarker"];
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
