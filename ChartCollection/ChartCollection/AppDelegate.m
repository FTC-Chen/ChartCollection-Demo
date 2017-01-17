//
//  AppDelegate.m
//  ChartCollection
//
//  Created by anyongxue on 2016/12/19.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "AppDelegate.h"
#import "RealReachability.h"
#import "UMMobClick/MobClick.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [GLobalRealReachability startNotifier]; //开启网络监听
    
    // 注册显示应用程序BadgeNumber的通知
//    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
//    
//    [application registerUserNotificationSettings:settings];
    
    
    UMConfigInstance.appKey = @"587db062c62dca0513000372";
    UMConfigInstance.channelId = nil;
    //UMConfigInstance.secret = @"App Store";
    //UMConfigInstance.eSType = E_UM_GAME; //仅适用于游戏场景，应用统计不用设置
    
    [MobClick startWithConfigure:UMConfigInstance];//配置以上参数后调用此方法初始化SDK！
    
    
    //原理-------------
    //程序退出前发送通知给系统（加入调度池），并传出 userInfo 信息，然后退出，当触发通知时会唤醒AppDelegate的 didFinishLaunchingWithOptions 方法，系统又将 userInfo 信息传给程序，并通过方法的launchOptions 参数获取到本地通知对象
    
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0){
        
        // ------------------------------------------------------------------------
        // 1.给通知设置一些操作行为.注意: 需先注册这些操作行为
        // 1.1 创建一个组
        UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc] init];
        // 设置组的标识
        category.identifier = @"select";
        
        // ------------------------------------------------------------------------
        // 添加按钮1 "进入"
        // 1.2 创建操作行为
        UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc] init];
        // 设置行为的标识
        action1.identifier = @"go";
        action1.title = @"进入";
        //        action1.behavior = nil;
       
        // 设置要在前台执行该行为
        action1.activationMode = UIUserNotificationActivationModeForeground;
        // 设置只有解锁之后才能执行
        //        action1.authenticationRequired = YES;
        // 设置这个操作是否是破坏性的行为(通过不同颜色来区别)
        action1.destructive = YES;
        
        
        // ------------------------------------------------------------------------
        // 添加按钮2 "回复"
        // 1.2 创建操作行为
        UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc] init];
        // 设置行为的标识
        action2.identifier = @"answer";
        action2.title = @"回复";
        // iOS 9.0之后才能弹出文本框,如果没判断,在9.0之前版本运行,程序会崩溃
        if ([UIDevice currentDevice].systemVersion.floatValue >= 9.0) {
            action2.behavior = UIUserNotificationActionBehaviorTextInput;
        }
        
        // 设置要在后台执行该行为
        action2.activationMode = UIUserNotificationActivationModeBackground;
        
        // 设置这个是破坏性的行为(通过不同颜色来区别)
        action2.destructive = NO;

        
        // ------------------------------------------------------------------------
        // 将按钮1和按钮2添加到category
        NSArray *actions = @[action1, action2];
        [category setActions:actions forContext:UIUserNotificationActionContextDefault];
        
        // 将category封装为集合
        NSSet *categories = [NSSet setWithObjects:category, nil];
        
        
        
        UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
        
        UIUserNotificationSettings *notificationSettings = [UIUserNotificationSettings settingsForTypes:types categories:categories];
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
    
    }else{
       
        UIRemoteNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
     
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:types];
    }
    

    
    // ------------------------------------------------------------------------
    // 如果当APP通过一些非正常手段启动时(正常: 点击APP 图标打开)
    // 这时候, 都会把对应的一些参数信息, 传递给launchOptions
    // 此处不能使用NSLog打印,NSLog只能在调试状态下打印,而此方式必须应用完全关闭,所有不是出于调试状态.所以此处使用TextView来显示launchOptions的值
    NSLog(@"launchOptions: %@", launchOptions);
    
//    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(200, 150, 150, 480)];
//    textView.backgroundColor = [UIColor orangeColor];
//    textView.text = launchOptions.description;
//    [self.window.rootViewController.view addSubview:textView];
//    
//    if (launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]) {
//        
//        textView.text = [NSString stringWithFormat:@"%@, ------\n%@", textView.text, @"用户是通过点击了通知启动的APP"];
//    }
    
    return YES;
}

// ------------------------------------------------------------------------
/**
 只有当发送出一个本地通知, 并且满足以下条件时, 才会调用该方法
 APP 处于前台情况
 当用用户点击了通知, 从后台, 进入到前台时,
 当锁屏状态下, 用户点击了通知, 从后台进入前台
 
 注意: 当App彻底退出时, 用户点击通知, 打开APP , 不会调用这个方法
 
 但是会把通知的参数传递给 application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
 
 */

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"接收到本地通知");
    
    // 通过UI控件来测试.当App彻底退出时, 用户点击通知, 打开APP , 会不会调用这个方法
//    UISwitch *sw = [[UISwitch alloc] init];
//    [self.window.rootViewController.view addSubview:sw];
    
    // 查看当前的状态出于(前台: 0)/(后台: 2)/(从后台进入前台: 1)
    NSLog(@"applicationState.rawValue: %zd", application.applicationState);
    
    // 执行响应操作
    // 如果当前App在前台,执行操作
    if (application.applicationState == UIApplicationStateActive) {
       
        NSLog(@"执行前台对应的操作");
   
    } else if (application.applicationState == UIApplicationStateInactive) {
        // 后台进入前台
        NSLog(@"执行后台进入前台对应的操作");
        NSLog(@"%@", notification.userInfo);
   
    } else {
        // 当前App在后台
        NSLog(@"执行后台对应的操作");
    }
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler{
    
    NSLog(@"---------1111");
    
    
    if ([UIApplication sharedApplication].applicationIconBadgeNumber==0) {
        
        [UIApplication sharedApplication].applicationIconBadgeNumber=0;
    
    }else{

        [UIApplication sharedApplication].applicationIconBadgeNumber +=1;
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    //进入前台
    
    //取消所有计划的通知
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
