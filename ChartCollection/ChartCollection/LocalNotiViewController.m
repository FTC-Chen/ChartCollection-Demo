//
//  LocalNotiViewController.m
//  ChartCollection
//
//  Created by anyongxue on 2017/1/9.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "LocalNotiViewController.h"

@interface LocalNotiViewController ()

@property (nonatomic,assign)NSInteger notiNum;

@end

@implementation LocalNotiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 如果是iOS 8.0之前版本,不用请求授权就能发送本地通知.如果是iOS 8.0之后,需主动请求授权才能发送本地通知.一般在AppDelegate中请求授权
    // 1.通知显示的条件:
    // 1.1 当App处于后台/锁屏状态/彻底退出时,都会显示通知
    // 注意: 当App处于前台状态时,不会显示通知
    
    // 获取所有计划的通知
//    NSArray *array = [UIApplication sharedApplication].scheduledLocalNotifications;
//    
//    NSLog(@"%@",array);
//    
//    [[array mutableCopy] removeAllObjects];
//    
//    // 取消所有计划的通知
//    [[UIApplication sharedApplication] cancelAllLocalNotifications];
//    
//    NSLog(@"%@",array);

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch!!");
    
    // 1.创建通知
    UILocalNotification *localNotification2 = [[UILocalNotification alloc] init];

    // 2.设置通知的必选参数
    // 设置通知显示的内容
    localNotification2.alertBody = @"本地推送通知测试改变badge";
    
    // 设置通知的发送时间
    localNotification2.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    
    //其它设置--------------
    // 设置时区跟随手机系统时区
    localNotification2.timeZone = [NSTimeZone defaultTimeZone];
    
    // 设置通知的重复周期(最低一分钟)
    //localNotification2.repeatInterval = kCFCalendarUnitMinute;
    
    localNotification2.repeatInterval = 0;//0为不重复
    
    // 设置锁屏状态下, "滑动XXX"
    localNotification2.hasAction = YES;
    localNotification2.alertAction = @"这里设置的是清扫部分";//??无效果
    
    // 当通知进入锁屏界面时, 滑动通知, 打开APP时, 弹出的启动界面
    // 注意: 现在这个属性, 没有反应!!!!
    localNotification2.alertLaunchImage = @"countingLabel.png";
    
    // 设置通知的弹框标题
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.2) {
        localNotification2.alertTitle = @"本地推送2";
    }
    
    // 推送声音
    localNotification2.soundName = UILocalNotificationDefaultSoundName;
    
    //通知传值
    localNotification2.userInfo = @{@"name" : @"liwx", @"body" : @"吃饭了没呀~~~"};

    // 设置应用程序图片右上角的数字(如果想要取消右上角的数字, 直接把这个参数值为0)
    NSInteger badge = [UIApplication sharedApplication].applicationIconBadgeNumber;
    
    //    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:badge+1];
    localNotification2.applicationIconBadgeNumber = badge+1;
    
    // 3.发送通知
    // 方式一: 根据通知的发送时间(fireDate)发送通知
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification2];
    
    
    
    // 方式二: 立即发送通知
    //[[UIApplication sharedApplication] presentLocalNotificationNow:localNotification];
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
