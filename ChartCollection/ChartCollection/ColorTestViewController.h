//
//  ColorTestViewController.h
//  ChartCollection
//
//  Created by anyongxue on 2017/1/3.
//  Copyright © 2017年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorProtocol.h"

@protocol changeColorDelegate <NSObject>

- (void)InmyWaytoChangeColor;

@end

@interface ColorTestViewController : UIViewController<ColorProtocol>

@property (nonatomic,weak)id <changeColorDelegate> colorChangeDelegate;


- (void)changeColorNow;

@end
