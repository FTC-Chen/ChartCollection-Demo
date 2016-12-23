//
//  CircleChartViewController.m
//  ChartCollection
//
//  Created by anyongxue on 2016/12/23.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "CircleChartViewController.h"

@interface CircleChartViewController ()

@end

@implementation CircleChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    PNCircleChart *circleChart = [[PNCircleChart alloc] initWithFrame:
                                  CGRectMake(0,150.0, SCREEN_WIDTH, 100.0)
                                                                total:@100
                                                              current:@60
                                                            clockwise:YES];
    
    circleChart.backgroundColor = [UIColor clearColor];
    
    [circleChart setStrokeColor:[UIColor clearColor]];
    
    [circleChart setStrokeColorGradientStart:PNLightGreen];
    
    [circleChart strokeChart];
    
    [self.view addSubview:circleChart];
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
