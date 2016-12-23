//
//  BarChartViewController.m
//  ChartCollection
//
//  Created by anyongxue on 2016/12/23.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "BarChartViewController.h"
#import "PNBar.h"
#import "PNBarChart.h"
#import "PNChart.h"
#import "PNChartDelegate.h"


static NSNumberFormatter *barChartFormatter;


@interface BarChartViewController ()<PNChartDelegate>

@end

@implementation BarChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //基础性
//    PNBarChart * barChart = [[PNBarChart alloc]initWithFrame:CGRectMake(0,135.0,SCREEN_WIDTH,200.0)];
//    //X轴数据
//    [barChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5"]];
//    //Y轴数据
//    [barChart setYValues:@[@1, @10,@2,@6,@3]];
//    [barChart strokeChart];
//    
//    //加载在视图上
//    [self.view addSubview:barChart];
    
    if (!barChartFormatter){
        barChartFormatter = [[NSNumberFormatter alloc] init];
        barChartFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
        barChartFormatter.allowsFloats = NO;
        barChartFormatter.maximumFractionDigits = 0;
    }

    //柱状图
    PNBarChart *barChart = [[PNBarChart alloc] initWithFrame:CGRectMake(10, 135.0, KScreenWidth, 250)];
   
    barChart.yLabelFormatter = ^(CGFloat yValue){
        
        return [barChartFormatter stringFromNumber:[NSNumber numberWithFloat:yValue]];
    };
    
//    barChart.yMaxValue = 36;
//    barChart.yMinValue = 0;
    
    //x 文字移动到此处
    [barChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5"]];
    
    [barChart setYValues:@[@10.82,@1.88,@6.96,@33.93,@10.82]];
    
    barChart.showChartBorder = YES; // 坐标轴

    barChart.yChartLabelWidth = 20.0;// Y坐标label宽度
    
//    barChart.chartMarginLeft = 30.0;// 左边间隔
//    barChart.chartMarginRight = 10.0;
//    barChart.chartMarginTop = 5.0;
//    barChart.chartMarginBottom = 10.0;

//    barChart.labelMarginTop = 5.0; // X坐标刻度的上边距
//    barChart.labelRowsInSerialMode = 1;

//    //[barChart setYLabels:@[@"",@"",@"10",@"15",@"20",@"25",@"30"]];

    [barChart setStrokeColors:@[PNGreen,PNGreen,PNRed,PNGreen,PNRed,]];

    barChart.isGradientShow = NO; // 立体效果
    barChart.isShowNumbers = NO; // 显示各条状图的数值

    [barChart strokeChart];

    barChart.delegate = self;

    [self.view addSubview:barChart];
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
