//
//  ColorDelegateViewController.m
//  ChartCollection
//
//  Created by anyongxue on 2017/1/4.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "ColorDelegateViewController.h"
#import "ColorTestViewController.h"

@interface ColorDelegateViewController ()

@end

@implementation ColorDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    ColorTestViewController *colorTestVC = [[ColorTestViewController alloc] init];
    
    colorTestVC.colorChangeDelegate = self;
    
    [colorTestVC changeColorNow];
    
}

- (void)InmyWaytoChangeColor{
    
    NSLog(@"我还可以用16进制的方式改变颜色");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//pop回去的时候,使用代理传值
- (IBAction)PopAction:(UIButton *)sender {

    NSString *str = @"回传值-验证码结果之类";
    
    [self.valueBackDelegate sendValue:str];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    //传值nsstring
    self.block(str);//很多东西可以在内部实现,并不一定体现在UI的改变上
    
    //id类型传值
    UIColor *color = PNLightGrey;
    
    self.colorBlock(color);
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
