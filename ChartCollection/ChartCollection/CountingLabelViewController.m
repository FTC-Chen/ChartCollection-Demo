//
//  CountingLabelViewController.m
//  ChartCollection
//
//  Created by anyongxue on 2016/12/23.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "CountingLabelViewController.h"

@interface CountingLabelViewController ()

@end

@implementation CountingLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //UICountingLabel 的使用,数字变化效果
    
    UICountingLabel* myLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(20, 124, KScreenWidth-40, 80)];
    
    //设置文本样式
//    myLabel.formatBlock = ^NSString* (CGFloat value) {
//        NSInteger years = value / 12;
//        NSInteger months = (NSInteger)value % 12;
//        if (years == 0) {
//            return [NSString stringWithFormat: @"%ld months", (long)months];
//        }
//        else {
//            return [NSString stringWithFormat: @"%ld years, %ld months", (long)years, (long)months];
//        }
//    };
    
//    [myLabel countFrom:50 to:100 withDuration:5.0f];
    
    
    myLabel.textAlignment = NSTextAlignmentCenter;
    
    myLabel.font = [UIFont fontWithName:@"Avenir Next" size:48];
    
    myLabel.textColor = [UIColor colorWithRed:246/255.0 green:66/255.0 blue:43/255.0 alpha:1];
    
    //设置格式
    //myLabel.format = @"%d";
    
    //浮点型
    //myLabel.format = @"%.2f";

    
    //设置变化范围及动画时间
//    [myLabel countFrom:0
//                         to:100
//               withDuration:1.0f];
    
//    [myLabel countFrom:0.00
//                    to:102.38
//          withDuration:1.0f];
    
    
    //设置千位分割符
    //设置格式
    myLabel.format = @"%.2f";
    //设置分隔符样式
    myLabel.positiveFormat = @"###,##0.00";
    //设置变化范围及动画时间
    [myLabel countFrom:0.00
                         to:3066.75
               withDuration:1.0f];
    
    
    [self.view addSubview:myLabel];
    
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
