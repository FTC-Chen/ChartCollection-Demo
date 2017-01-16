//
//  WaterfallCollectionViewCell.m
//  ChartCollection
//
//  Created by anyongxue on 2017/1/16.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "WaterfallCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@interface WaterfallCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation WaterfallCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setImageURL:(NSURL *)imageURL {
    _imageURL = imageURL;
    
    [self.imageView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"placeholder"]];
}

@end
