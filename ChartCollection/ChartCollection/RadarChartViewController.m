//
//  RadarChartViewController.m
//  ChartCollection
//
//  Created by anyongxue on 2016/12/23.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "RadarChartViewController.h"

@interface RadarChartViewController ()
@property (nonatomic) PNRadarChart *radarChart;
@end

@implementation RadarChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //此图demo很多
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *items = @[[PNRadarChartDataItem dataItemWithValue:3 description:@"Art"],
                       [PNRadarChartDataItem dataItemWithValue:2 description:@"Math"],
                       [PNRadarChartDataItem dataItemWithValue:8 description:@"Sports"],
                       [PNRadarChartDataItem dataItemWithValue:5 description:@"Literature"],
                       [PNRadarChartDataItem dataItemWithValue:4 description:@"Other"],
                       ];
    self.radarChart = [[PNRadarChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 300.0) items:items valueDivider:1];
    [self.radarChart strokeChart];
    
    [self.view addSubview:self.radarChart];
    
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
