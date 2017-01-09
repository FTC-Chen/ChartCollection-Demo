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
#import "DashboardViewController.h"
#import "LocalNotiViewController.h"
#import "TouchIDViewController.h"

#import "AppDelegate.h"

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
    
    return 13;
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
        
    }else if (indexPath.row == 10){
        
        cell.textLabel.text = @"表盘动画";

    }else if (indexPath.row == 11){
        
        cell.textLabel.text = @"本地推送通知/角标";
    
    }else if (indexPath.row == 12){
        
        cell.textLabel.text = @"TouchID";
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
    
    }else if (indexPath.row==10){
        //颜色测试
        DashboardViewController *dashboardVC = [[DashboardViewController alloc] init];
        
        [self.navigationController pushViewController:dashboardVC animated:YES];
    
    }else if (indexPath.row==11){
        //本地推送与角标
        LocalNotiViewController *localNotiVC = [[LocalNotiViewController alloc] init];
        
        [self.navigationController pushViewController:localNotiVC animated:YES];
   
    }else if (indexPath.row==12){
        //touchID与角标
        TouchIDViewController *touchIDVC = [[TouchIDViewController alloc] init];
        
        [self.navigationController pushViewController:touchIDVC animated:YES];
    }
    
}

- (IBAction)StartNotification:(id)sender {
    
    NSLog(@"开启推送");

    // 1.创建通知
    UILocalNotification *localNotification1 = [[UILocalNotification alloc] init];
    
    // 2.设置通知的必选参数
    // 设置通知显示的内容
    localNotification1.alertBody = @"本地推送通知测试";
    
    // 设置通知的发送时间
    localNotification1.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    
    //其它设置--------------
    // 设置时区跟随手机系统时区
    localNotification1.timeZone = [NSTimeZone defaultTimeZone];
    
    // 设置通知的重复周期(最低一分钟)
    //localNotification1.repeatInterval = kCFCalendarUnitMinute;
    
    localNotification1.repeatInterval = kCFCalendarUnitMinute;//0为不重复
    
    // 设置锁屏状态下, "滑动XXX"
    localNotification1.hasAction = YES;
    localNotification1.alertAction = @"这里设置的是清扫部分";//??无效果
    
    // 当通知进入锁屏界面时, 滑动通知, 打开APP时, 弹出的启动界面
    // 注意: 现在这个属性, 没有反应!!!!
    localNotification1.alertLaunchImage = @"countingLabel.png";
    
    // 设置通知的弹框标题
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.2) {
        localNotification1.alertTitle = @"本地推送";
    }
    
    // 推送声音
    localNotification1.soundName = UILocalNotificationDefaultSoundName;
    
    //通知传值
    localNotification1.userInfo = @{@"name" : @"liwx", @"body" : @"吃饭了没呀~~~"};
    
    // 设置应用程序图片右上角的数字(如果想要取消右上角的数字, 直接把这个参数值为0)
    //NSInteger badge = [UIApplication sharedApplication].applicationIconBadgeNumber;
    //
    //    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:badge+1];
    
    localNotification1.applicationIconBadgeNumber += 1;
    
    // 指定通知使用哪个操作组
    localNotification1.category = @"select";
    
    // 3.发送通知
    // 方式一: 根据通知的发送时间(fireDate)发送通知
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification1];
    
    // 方式二: 立即发送通知
    //[[UIApplication sharedApplication] presentLocalNotificationNow:localNotification];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
