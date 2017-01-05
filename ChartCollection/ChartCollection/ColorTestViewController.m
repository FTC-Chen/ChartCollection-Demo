//
//  ColorTestViewController.m
//  ChartCollection
//
//  Created by anyongxue on 2017/1/3.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "ColorTestViewController.h"
#import "UIColor+HexColor.h"
#import "ColorDelegateViewController.h"

@interface ColorTestViewController ()<sendValueBackDelegate>

@property (weak, nonatomic) IBOutlet UIView *TestView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ColorTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad");
    
    //宏定义
    //self.TestView.backgroundColor = HexColor(0xFF335B,1.0f);
    
    //通过
    self.TestView.backgroundColor = [UIColor colorWithHexString:@"0xFF335B" alpha:1];
    
    //self.TestView.backgroundColor = [UIColor colorWithHexString:@"#708c3b" alpha:1];
    
    //self.TestView.backgroundColor = [UIColor colorWithHexString:@"#708c3b"];
    
    
    //代理/block
    
    
    
    
    
}


//两个协议中必须实现的方法
- (void)changeColor{
    
    NSLog(@"签署协议,必须实现协议方法之 1,----changeColor");
}

- (void)changeRGBcolor{

    NSLog(@"签署协议,必须实现协议方法之 2,----changeRGColor");
}


- (IBAction)PushAction:(UIButton *)sender {
    
    [self changeColor];
    
    [self changeRGBcolor];
    
    ColorDelegateViewController *deleVC = [[ColorDelegateViewController alloc] init];
    
    deleVC.valueBackDelegate = self;
    
    //构建block其中的代码块
    deleVC.block = ^(NSString *str){
        
        self.textField.text = str;
    };
    
    
    //传id类型的color
    deleVC.colorBlock = ^(UIColor *color){
        
        self.view.backgroundColor = color;
    };
    
    [self.navigationController pushViewController:deleVC animated:YES];
}

//代理去调用方法
- (void)changeColorNow{

    [self.colorChangeDelegate InmyWaytoChangeColor];
}

//代理传值
- (void)sendValue:(NSString *)value{
    
    NSLog(@"%@",value);
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
