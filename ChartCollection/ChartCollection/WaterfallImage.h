//
//  WaterfallImage.h
//  ChartCollection
//
//  Created by anyongxue on 2017/1/16.
//  Copyright © 2017年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterfallImage : UIImage

@property (nonatomic,strong) NSURL *imageURL;

@property (nonatomic,assign) CGFloat imageW;

@property (nonatomic,assign) CGFloat imageH;

+ (instancetype)imageWithImageDic:(NSDictionary *)imageDic;
@end
