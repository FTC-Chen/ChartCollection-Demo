//
//  TouchIDViewController.m
//  ChartCollection
//
//  Created by anyongxue on 2017/1/9.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "TouchIDViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface TouchIDViewController ()

@end

@implementation TouchIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //错误对象
    NSError* error =nil;
    
    // 实例化本地身份验证上下文
    LAContext *context= [[LAContext alloc] init];
    
    //首先使用canEvaluatePolicy判断设备支持状态
    BOOL isSupport = [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:NULL];
    
    if (isSupport) {
        
        
        //支持指纹识别
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:@"请验证已有指纹" reply:^(BOOL success, NSError * _Nullable error) {
            
           
            if (success) {
                //验证成功，主线程处理UI
                [self refreshUI:[NSString stringWithFormat:@"指纹验证成功"] message:nil];
            }else{
            
                //[self refreshUI:[NSString stringWithFormat:@"指纹验证失败"] message:error.userInfo[NSLocalizedDescriptionKey]];
                
                 NSLog(@"%@",error.localizedDescription);
                
                switch (error.code) {
                
                    case LAErrorSystemCancel:
                    {
                        NSLog(@"Authentication was cancelled by the system");
                        //切换到其他APP，系统取消验证Touch ID
                        break;
                    }
               
                    case LAErrorUserCancel:
                    {
                        NSLog(@"Authentication was cancelled by the user");
                        //用户取消验证Touch ID
                        break;
                    }
                    case LAErrorUserFallback:
                    {
                        NSLog(@"User selected to enter custom password");
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            //用户选择输入密码，切换主线程处理
                            
                        }];
                        break;
                    }
                    default:
                    {
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            //其他情况，切换主线程处理
                        }];
                        break;
                    }
            
                }
            
            
            }
        
        }];
        
    }else{
    
        //不支持指纹识别，LOG出错误详情
        
        switch (error.code) {
            case LAErrorTouchIDNotEnrolled:
            {
                NSLog(@"TouchID is not enrolled");
                break;
            }
            case LAErrorPasscodeNotSet:
            {
                NSLog(@"A passcode has not been set");
                break;
            }
            default:
            {
                NSLog(@"TouchID not available");
                break;
            }
        }
        
        NSLog(@"%@",error.localizedDescription);
        
    }

}

// 主线程刷新 UI
- (void)refreshUI:(NSString *)str message:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:str
                                                                       message:msg
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alert animated:YES completion:^{
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [alert dismissViewControllerAnimated:YES completion:nil];
            });
        }];
    });
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
