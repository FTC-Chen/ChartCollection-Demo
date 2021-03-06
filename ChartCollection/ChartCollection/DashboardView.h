//
//  DashboardView.h
//  ChartCollection
//
//  Created by anyongxue on 2017/1/5.
//  Copyright © 2017年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardView : UIView

@property (nonatomic,strong)UIImageView *bgImageView; // 背景图片

@property (nonatomic, copy) void(^TimerBlock)(NSInteger);

//刷新跳跃数字
- (void)refreshFromStartNum:(NSString *)startNum toEndNum:(NSString *)endNum;

@end
