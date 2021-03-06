//
//  WaterfallLayout.h
//  ChartCollection
//
//  Created by anyongxue on 2017/1/16.
//  Copyright © 2017年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WaterfallLayout;

@protocol WaterfallLayoutDelegate <NSObject>

//计算item高度的代理方法，将item的高度与indexPath传递给外界
- (CGFloat)waterfallLayout:(WaterfallLayout *)waterfallLayout itemHeightForWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath;

@end

@interface WaterfallLayout : UICollectionViewLayout

//总共多少列，默认是2
@property (nonatomic, assign) NSInteger columnCount;

//列间距，默认是0
@property (nonatomic, assign) NSInteger columnSpacing;

//行间距，默认是0
@property (nonatomic, assign) NSInteger rowSpacing;

//section与collectionView的间距，默认是（0，0，0，0）
@property (nonatomic, assign) UIEdgeInsets sectionInset;

//同时设置列间距，行间距，sectionInset
- (void)setColumnSpacing:(NSInteger)columnSpacing rowSpacing:(NSInteger)rowSepacing sectionInset:(UIEdgeInsets)sectionInset;

/**
 以下代理属性与block属性二选一，用来设置每一个item的高度
 会将item的宽度与indexPath传递给外界
 如果两个都设置，block的优先级高，即代理无效
 */

//代理，用来计算item的高度
@property (nonatomic, weak) id<WaterfallLayoutDelegate> delegate;

#pragma mark- 构造方法
+ (instancetype)waterFallLayoutWithColumnCount:(NSInteger)columnCount;

- (instancetype)initWithColumnCount:(NSInteger)columnCount;
@end
