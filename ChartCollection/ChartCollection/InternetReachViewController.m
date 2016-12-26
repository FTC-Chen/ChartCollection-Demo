//
//  InternetReachViewController.m
//  ChartCollection
//
//  Created by anyongxue on 2016/12/26.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "InternetReachViewController.h"
#import "RealReachability.h"


@interface InternetReachViewController ()

@property (nonatomic, strong) UIAlertView *alert;

@property (weak, nonatomic) IBOutlet UILabel *statesLabel;

@end

@implementation InternetReachViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(networkChanged:)
                                                 name:kRealReachabilityChangedNotification
                                               object:nil];
    
    ReachabilityStatus status = [GLobalRealReachability currentReachabilityStatus];
    
    if (status == RealStatusNotReachable)
    {
        self.statesLabel.text = @"进入时-当前网络不可用!";
    }
    
    if (status == RealStatusViaWiFi)
    {
        self.statesLabel.text = @"进入时-当前网络处于wifi环境下!";
    }
    
    if (status == RealStatusViaWWAN)
    {
        self.statesLabel.text = @"进入时-当前网络处于流量环境下!";
    }
    
    self.alert = [[UIAlertView alloc] initWithTitle:@"RealReachability" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)networkChanged:(NSNotification *)notification
{

    RealReachability *reachability = (RealReachability *)notification.object;
    ReachabilityStatus status = [reachability currentReachabilityStatus];
    ReachabilityStatus previousStatus = [reachability previousReachabilityStatus];
    
    NSLog(@"网络改变, 当前状态为:%@, 改变之前状态为:%@", @(status), @(previousStatus));
    
    if (status == RealStatusNotReachable)
    {
        self.statesLabel.text = @"网络改变-当前网络不可用!";
    }
    
    if (status == RealStatusViaWiFi)
    {
        self.statesLabel.text = @"网络改变-当前网络处于wifi环境下!";
    }
    
    if (status == RealStatusViaWWAN)
    {
        self.statesLabel.text = @"网络改变-当前网络处于流量环境下!";
    }

    WWANAccessType accessType = [GLobalRealReachability currentWWANtype];
    
    if (status == RealStatusViaWWAN)
    {
        if (accessType == WWANType2G)
        {
            self.statesLabel.text = @"网络改变-当前网络状态-流量状态2G";
        }
        else if (accessType == WWANType3G)
        {
            self.statesLabel.text = @"网络改变-当前网络状态-流量状态3G";
        }
        else if (accessType == WWANType4G)
        {
            self.statesLabel.text = @"网络改变-当前网络状态-流量状态4G";
        }
        else
        {
            self.statesLabel.text = @"未知 WWAN 状态, 可能是 iOS6 系统";
        }
    }

    
    
}

//点击button  根据不同网络状态 进行不同的操作
- (IBAction)buttonAction:(id)sender {
    
    [GLobalRealReachability reachabilityWithBlock:^(ReachabilityStatus status) {
        switch (status)
        {
            case RealStatusNotReachable:
            {
                self.alert.message = @"点击button-网络状态不可用!";
                [self.alert show];
                
                break;
            }
                
            case RealStatusViaWiFi:
            {
                self.alert.message = @"点击button-网络状态-wifi环境下!";
                [self.alert show];
                
                break;
            }
                
            case RealStatusViaWWAN:
            {
                self.alert.message = @"点击button-网络状态-流量环境下!!";
                [self.alert show];
                
                WWANAccessType accessType = [GLobalRealReachability currentWWANtype];
                
                if (accessType == WWANType2G)
                {
                    self.statesLabel.text = @"点击button-网络状态-2G";
                }
                else if (accessType == WWANType3G)
                {
                    self.statesLabel.text = @"点击button-网络状态-3G";
                }
                else if (accessType == WWANType4G)
                {
                    self.statesLabel.text = @"点击button-网络状态-4G";
                }
                else
                {
                    self.statesLabel.text = @"点击button-未知网络状态-可能是iOS6系统";
                }
                
                break;
            }
                
            default:
                break;
        }
    }];

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
