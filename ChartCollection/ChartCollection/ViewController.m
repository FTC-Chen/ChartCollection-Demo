//
//  ViewController.m
//  ChartCollection
//
//  Created by anyongxue on 2016/12/19.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "ViewController.h"
#import "LineChartViewController.h"
#import "BarChartViewController.h"
#import "CircleChartViewController.h"
#import "PieChartViewController.h"
#import "ScatterChartViewController.h"
#import "RadarChartViewController.h"
#import "CountingLabelViewController.h"
#import "InternetReachViewController.h"
#import "LineAndCircleViewController.h"
#import "ColorTestViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) UITableView *chartTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建tableView
    [self.view addSubview:self.chartTableView];

}


- (UITableView *)chartTableView{
    
    if (!_chartTableView) {
        
        _chartTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStylePlain];
        
        [_chartTableView setDelegate:self];
        
        [_chartTableView setDataSource:self];
        
        [_chartTableView setTableFooterView:[UIView new]];
    
        _chartTableView.backgroundColor = KVIEWBGColor;
    }
    
    return _chartTableView;
}


#pragma mark - TabelViewDelegate && DataSoure -
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 11;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cell01";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if (indexPath.row == 0) {
        
        cell.textLabel.text = @"线形图";
    
    }else if (indexPath.row == 1){
    
        cell.textLabel.text = @"柱状图";
        
    }else if (indexPath.row == 2){
        
        cell.textLabel.text = @"圆圈进度图";
        
    }else if (indexPath.row == 3){
        
        cell.textLabel.text = @"饼形图";
        
    }else if (indexPath.row == 4){
        
        cell.textLabel.text = @"点状分布图";
        
    }else if (indexPath.row == 5){
        
        cell.textLabel.text = @"无线电图";
        
    }else if (indexPath.row == 6){
        
        cell.textLabel.text = @"UICountingLabel使用";
        
    }else if (indexPath.row == 7){
        
        cell.textLabel.text = @"网络监测";
        
    }else if (indexPath.row == 8){
        
        cell.textLabel.text = @"条形/圆圈进度";
        
    }else if (indexPath.row == 9){
        
        cell.textLabel.text = @"颜色测试";
        
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        //线形图
        LineChartViewController *lineChart = [[LineChartViewController alloc] init];
        
        [self.navigationController pushViewController:lineChart animated:YES];
    
    }else if (indexPath.row==1){
        //柱状图
        BarChartViewController *barChart = [[BarChartViewController alloc] init];
        
        [self.navigationController pushViewController:barChart animated:YES];
    
    }else if (indexPath.row==2){
        //圆圈进度图
        CircleChartViewController *cirChart = [[CircleChartViewController alloc] init];
        
        [self.navigationController pushViewController:cirChart animated:YES];
   
    }else if (indexPath.row==3){
        //圆圈进度图
        PieChartViewController *pirChart = [[PieChartViewController alloc] init];
        
        [self.navigationController pushViewController:pirChart animated:YES];
    
    }else if (indexPath.row==4){
        //点状分布图
        ScatterChartViewController *scaChart = [[ScatterChartViewController alloc] init];
        
        [self.navigationController pushViewController:scaChart animated:YES];
    
    }else if (indexPath.row==5){
        //点状分布图
        RadarChartViewController *radaChart = [[RadarChartViewController alloc] init];
        
        [self.navigationController pushViewController:radaChart animated:YES];
    
    }else if (indexPath.row==6){
        //点状分布图
        CountingLabelViewController *countVC = [[CountingLabelViewController alloc] init];
        
        [self.navigationController pushViewController:countVC animated:YES];
   
    }else if (indexPath.row==7){
        //点状分布图
        InternetReachViewController *interReachVC = [[InternetReachViewController alloc] init];
        
        [self.navigationController pushViewController:interReachVC animated:YES];
    
    }else if (indexPath.row==8){
        //线形与圆形进度图
        LineAndCircleViewController *lineAndCirVC = [[LineAndCircleViewController alloc] init];
        
        [self.navigationController pushViewController:lineAndCirVC animated:YES];
    
    }else if (indexPath.row==9){
        //颜色测试
        ColorTestViewController *colorTestVC = [[ColorTestViewController alloc] init];
        
        [self.navigationController pushViewController:colorTestVC animated:YES];
    }

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
