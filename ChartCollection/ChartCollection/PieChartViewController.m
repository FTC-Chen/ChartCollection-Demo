//
//  PieChartViewController.m
//  ChartCollection
//
//  Created by anyongxue on 2016/12/23.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "PieChartViewController.h"

@interface PieChartViewController ()

@end

@implementation PieChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 数据
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:10 color:PNLightGreen
                           description:@"other"],
                       [PNPieChartDataItem dataItemWithValue:20 color:PNRed description:@"WWDC"],
                       [PNPieChartDataItem dataItemWithValue:40 color:PNPinkGrey description:@"GOOG I/O"],
                       ];
    // 初始化
    PNPieChart *pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake(SCREEN_WIDTH /2.0 - 100, 135, 200.0, 200.0) items:items];
    pieChart.descriptionTextColor = [UIColor whiteColor];
    pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:11.0];
    pieChart.descriptionTextShadowColor = [UIColor clearColor]; // 阴影颜色
    pieChart.showAbsoluteValues = NO; // 显示实际数值(不显示比例数字)
    pieChart.showOnlyValues = YES; // 只显示数值不显示内容描述
    
    [pieChart strokeChart];
     [self.view addSubview:pieChart];
    //pieChart.innerCircleRadius = 0;
    
    //标注
    pieChart.legendStyle = PNLegendItemStyleStacked; // 标注排放样式
    pieChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    
    UIView *legend = [pieChart getLegendWithMaxWidth:200];
    [legend setFrame:CGRectMake(130, 350, legend.frame.size.width, legend.frame.size.height)];
    [self.view addSubview:legend];
    
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
