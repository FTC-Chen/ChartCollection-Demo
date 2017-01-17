//
//  HorizWaterfallLayout.m
//  ChartCollection
//
//  Created by anyongxue on 2017/1/16.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "HorizWaterfallLayout.h"

@interface HorizWaterfallLayout()
//用来记录每一列的最大y值
@property (nonatomic, strong) NSMutableDictionary *maxXDic;

//保存每一个item的attributes
@property (nonatomic, strong) NSMutableArray *attributesArray;

@end


@implementation HorizWaterfallLayout

#pragma mark- 构造方法
- (instancetype)init {
    if (self = [super init]) {
        
        self.rowCount = 2;
    }
    return self;
}

- (instancetype)initWithRowCount:(NSInteger)rowCount {
    if (self = [super init]) {
        
        self.rowCount = rowCount;
    }
    return self;
}

+ (instancetype)waterFallLayoutWithRowCount:(NSInteger)rowCount{
    
    return [[self alloc] initWithRowCount:rowCount];
}

#pragma mark- 相关设置方法
- (void)setColumnSpacing:(NSInteger)columnSpacing rowSpacing:(NSInteger)rowSepacing sectionInset:(UIEdgeInsets)sectionInset {
    
    self.columnSpacing = columnSpacing;
    self.rowSpacing = rowSepacing;
    self.sectionInset = sectionInset;
}

#pragma mark- 布局相关方法
//布局前的准备工作
- (void)prepareLayout{
    [super prepareLayout];
    
    //初始化字典，有几列就有几个键值对，key为列，value为列的最大y值，初始值为上内边距
    for (int i = 0; i < self.rowCount; i++) {
        
        self.maxXDic[@(i)] = @(self.sectionInset.left);
    }
    
    //根据collectionView获取总共有多少个item
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    
    [self.attributesArray removeAllObjects];
    
    //为每一个item创建一个attributes并存入数组
    for (int i = 0; i < itemCount; i++) {
        
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        
        [self.attributesArray addObject:attributes];
    }
}

//计算collectionView的contentSize
- (CGSize)collectionViewContentSize {
    
    __block NSNumber *maxIndex = @0;
    
    //遍历字典，找出最长的那一行
    [self.maxXDic enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, NSNumber *obj, BOOL *stop) {
        
        if ([self.maxXDic[maxIndex] floatValue] < obj.floatValue) {
            
            maxIndex = key;
        }
    }];
    
    //collectionView的contentSize.height就等于最长列的最大y值+下内边距
    return CGSizeMake([self.maxXDic[maxIndex] floatValue] + self.sectionInset.right,0);
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //根据indexPath获取item的attributes
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //获取collectionView的宽度
    CGFloat collectionViewHeight = self.collectionView.frame.size.height;
    
    //item的宽度 = (collectionView的宽度 - 内边距与列间距) / 列数
    CGFloat itemHeight = (collectionViewHeight - self.sectionInset.top - self.sectionInset.bottom - (self.rowCount - 1) * self.rowSpacing) / self.rowCount;
    
    CGFloat itemWidth = 0;
    
    //if (self.itemHeightBlock) itemHeight = self.itemHeightBlock(itemWidth, indexPath);
    
    if ([self.delegate respondsToSelector:@selector(waterfallLayout:itemWidthForHeight:atIndexPath:)])
        
        itemWidth = [self.delegate waterfallLayout:self itemWidthForHeight:itemHeight atIndexPath:indexPath];
    
    //找出最短的那一列
    __block NSNumber *minIndex = @0;
    
    [self.maxXDic enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, NSNumber *obj, BOOL *stop) {
        
        if ([self.maxXDic[minIndex] floatValue] > obj.floatValue) {
            
            minIndex = key;
        }
    }];
    
//    //根据最短列的列数计算item的x值
//    CGFloat itemX = self.sectionInset.left + (self.columnSpacing + itemWidth) * minIndex.integerValue;
//    
//    //item的y值 = 最短列的最大y值 + 行间距
//    CGFloat itemY = [self.maxYDic[minIndex] floatValue] + self.rowSpacing;
    
    
    //根据最短列的行数计算item的y值
    CGFloat itemY = self.sectionInset.top + (self.rowSpacing + itemHeight) * minIndex.integerValue;
    
    //item的y值 = 最短列的最大x值 + 列间距
    CGFloat itemX = [self.maxXDic[minIndex] floatValue] + self.columnSpacing;
    
    //设置attributes的frame
    attributes.frame = CGRectMake(itemX, itemY, itemWidth, itemHeight);
    
    //更新字典中的最大X值
    self.maxXDic[minIndex] = @(CGRectGetMaxX(attributes.frame));
    
    return attributes;
}

//返回rect范围内item的attributes
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    return self.attributesArray;
}

#pragma mark- 懒加载
- (NSMutableDictionary *)maxXDic {
    if (!_maxXDic) {
        
        _maxXDic = [[NSMutableDictionary alloc] init];
    }
    return _maxXDic;
}

- (NSMutableArray *)attributesArray {
    if (!_attributesArray) {
       
        _attributesArray = [NSMutableArray array];
    }
    return _attributesArray;
}



@end
