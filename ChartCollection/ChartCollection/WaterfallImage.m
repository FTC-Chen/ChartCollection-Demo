//
//  WaterfallImage.m
//  ChartCollection
//
//  Created by anyongxue on 2017/1/16.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "WaterfallImage.h"

@implementation WaterfallImage

+ (instancetype)imageWithImageDic:(NSDictionary *)imageDic{
    
    WaterfallImage *image = [[WaterfallImage alloc] init];
    
    image.imageURL = [NSURL URLWithString:imageDic[@"img"]];
    image.imageW = [imageDic[@"w"] floatValue];
    image.imageH = [imageDic[@"h"] floatValue];
    
    return image;
}

@end
