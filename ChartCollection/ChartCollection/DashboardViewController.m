//
//  DashboardViewController.m
//  ChartCollection
//
//  Created by anyongxue on 2017/1/5.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "DashboardViewController.h"
#import "GradientView.h"
#import "DashboardView.h"

@interface DashboardViewController ()

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建一个渐变色View
    GradientView *gradView = [[GradientView alloc] initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight-64)];
    
    [self.view addSubview:gradView];
    
    
    //创建表盘view
    DashboardView *dashView = [[DashboardView alloc] initWithFrame:CGRectMake(30, 130, KScreenWidth-60, KScreenWidth-60)];
    dashView.bgImageView.image = [UIImage imageNamed:@"backgroundImage@2x"];
    [self.view addSubview:dashView];
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
