//
//  ColorTestViewController.m
//  ChartCollection
//
//  Created by anyongxue on 2017/1/3.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "ColorTestViewController.h"
#import "UIColor+HexColor.h"

@interface ColorTestViewController ()
@property (weak, nonatomic) IBOutlet UIView *TestView;

@end

@implementation ColorTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //宏定义
    //self.TestView.backgroundColor = HexColor(0xFF335B,1.0f);
    
    //通过
    self.TestView.backgroundColor = [UIColor colorWithHexString:@"0xFF335B" alpha:1];
    
    //self.TestView.backgroundColor = [UIColor colorWithHexString:@"#708c3b" alpha:1];
    
    //self.TestView.backgroundColor = [UIColor colorWithHexString:@"#708c3b"];
    
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
