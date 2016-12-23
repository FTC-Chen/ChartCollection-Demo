//
//  LineChartViewController.m
//  ChartCollection
//
//  Created by anyongxue on 2016/12/23.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "LineChartViewController.h"
#import "PNLineChart.h"
#import "PNLineChartData.h"
#import "PNLineChartDataItem.h"


@interface LineChartViewController ()

@end

@implementation LineChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    PNLineChart * lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(5, 135.0, self.view.bounds.size.width, 250.0)];
    // 设置X坐标的刻度
    [lineChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5"]];
    
    // 是否显示坐标轴
    lineChart.showCoordinateAxis = YES;
    
    lineChart.yGridLinesColor = [UIColor clearColor];

    lineChart.showYGridLines = YES;
    
    //y轴最大值与最小值
    lineChart.yFixedValueMax = 300.0;
    lineChart.yFixedValueMin = 0.0;

    // 格式化Y坐标
    //lineChart.yLabelFormat = @"%1.1f";

    //平滑曲线
    //lineChart.showSmoothLines = YES;
    
    // Line Chart No.1
    NSArray * data01Array = @[@2, @160.1, @126.4, @262.2, @186.2];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.color = PNFreshGreen;
    data01.itemCount = lineChart.xLabels.count;
    //data01.dataTitle = @"Alpha";
    //data01.alpha = 0.3f;
    //显示拐点样式
    //data01.inflexionPointStyle = PNLineChartPointStyleCircle;
    data01.getData = ^(NSUInteger index) {
    
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    //Line Chart No.2
    NSArray * data02Array = @[@20.1, @180.1, @26.4, @202.2, @126.2];
    PNLineChartData *data02 = [PNLineChartData new];
    data02.color = PNTwitterColor;
    data02.itemCount = lineChart.xLabels.count;
    data02.getData = ^(NSUInteger index) {
    CGFloat yValue = [data02Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    
    lineChart.chartData = @[data01,data02];

    [lineChart strokeChart];

    [self.view addSubview:lineChart];
    
    // 标志样式
    data01.dataTitle = @"分数一";
    data02.dataTitle = @"分数二";
    
    lineChart.legendStyle = PNLegendItemStyleStacked;
    lineChart.legendFont = [UIFont systemFontOfSize:14];
    lineChart.legendFontColor = [UIColor grayColor];
    
    // 标示所在的View
    UIView *legend = [lineChart getLegendWithMaxWidth:0];
    [legend setFrame:CGRectMake(KScreenWidth-100,104,100,100)];
    
    [self.view addSubview:legend];
}


/**
 * Callback method that gets invoked when the user taps on the chart line.
 */
//- (void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex; // 折线图点击方法

/**
 * Callback method that gets invoked when the user taps on a chart line key point.
 */
//- (void)userClickedOnLineKeyPoint:(CGPoint)point
//                        lineIndex:(NSInteger)lineIndex
//                       pointIndex:(NSInteger)pointIndex; // 折线图点击方法,能知道点击的是第几个点

/**
 * Callback method that gets invoked when the user taps on a chart bar.
 */
//- (void)userClickedOnBarAtIndex:(NSInteger)barIndex; // 图表的点击方法


//- (void)userClickedOnPieIndexItem:(NSInteger)pieIndex;

//- (void)didUnselectPieItem;



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
