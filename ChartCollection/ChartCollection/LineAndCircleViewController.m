//
//  LineAndCircleViewController.m
//  ChartCollection
//
//  Created by anyongxue on 2016/12/27.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "LineAndCircleViewController.h"
#import "LineScaleView.h"
#import "CircleScaleView.h"

@interface LineAndCircleViewController ()

@end

@implementation LineAndCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor = [UIColor whiteColor];
    
    //此部分我写完后单拿出来建立项目,方便别人下载,地址为:
    //https://github.com/FTCcheV/LineAndCircleScaleView.git
    
    //条形比例显示
    LineScaleView *lineView = [[LineScaleView alloc]initWithFrame:CGRectMake(10, 150, KScreenWidth-20, 27)];
    //设置背景色
    lineView.bgView.backgroundColor = PNmidGray;
    lineView.scaleView.backgroundColor = PNFreshGreen;
    //设置显示比例
    lineView.maxValue = 100;
    lineView.currentValue = 80;
    [self.view addSubview:lineView];
    
    //1 增加显示效果label
    UILabel *currentLabel = [[UILabel alloc] initWithFrame:CGRectMake((CGRectGetWidth(lineView.frame)-120)/2, (CGRectGetHeight(lineView.frame)-24)/2, 120, 24)];
    currentLabel.backgroundColor = [UIColor clearColor];
    currentLabel.text = @"可用额度:8000";
    currentLabel.textColor = [UIColor whiteColor];
    currentLabel.textAlignment = NSTextAlignmentCenter;
    currentLabel.font = [UIFont systemFontOfSize:16];
    [lineView addSubview:currentLabel];
    
    //2
    UILabel *allLabel = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth-135, CGRectGetMaxY(lineView.frame)+15, 120, 24)];
    allLabel.backgroundColor = [UIColor clearColor];
    allLabel.text = @"总额度:12000";
    allLabel.textColor = TextColor;
    allLabel.textAlignment = NSTextAlignmentRight;
    allLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:allLabel];

    //3
    UIView *tableLine = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(allLabel.frame)+50, KScreenWidth-20, 0.6)];
    tableLine.backgroundColor = tableLineColor;
    [self.view addSubview:tableLine];

    
    //圆圈比例显示
    CircleScaleView *circleView = [[CircleScaleView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(tableLine.frame)+60, KScreenWidth-20, 160)];
    circleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:circleView];

    circleView.maxValue=100;
    circleView.currentValue =80;
    
    [circleView startAnimationTimer];
    
    //1.增加显示label
    UILabel *scaleLabel = [[UILabel alloc] initWithFrame:CGRectMake((CGRectGetWidth(circleView.frame)-120)/2, (CGRectGetHeight(circleView.frame)-24)/2, 120, 24)];
    scaleLabel.backgroundColor = [UIColor clearColor];
    scaleLabel.text = @"可用额度:8000";
    scaleLabel.textColor = TextColor;
    scaleLabel.textAlignment = NSTextAlignmentCenter;
    scaleLabel.font = [UIFont systemFontOfSize:16];
    [circleView addSubview:scaleLabel];
    
    
    //2.
    UILabel *allScaleLabel = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth-135, CGRectGetMaxY(circleView.frame)+15, 120, 24)];
    allScaleLabel.backgroundColor = [UIColor clearColor];
    allScaleLabel.text = @"总额度:12000";
    allScaleLabel.textColor = TextColor;
    allScaleLabel.textAlignment = NSTextAlignmentRight;
    allScaleLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:allScaleLabel];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
