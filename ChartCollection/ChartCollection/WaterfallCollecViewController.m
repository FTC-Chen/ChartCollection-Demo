//
//  WaterfallCollecViewController.m
//  ChartCollection
//
//  Created by anyongxue on 2017/1/13.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "WaterfallCollecViewController.h"
#import "WaterfallImage.h"
#import "WaterfallLayout.h"
#import "WaterfallCollectionViewCell.h"

@interface WaterfallCollecViewController ()<UICollectionViewDataSource,WaterfallLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray<WaterfallImage *> *images;

@end

@implementation WaterfallCollecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    WaterfallLayout *waterfall = [WaterfallLayout waterFallLayoutWithColumnCount:2];
    
    //或者一次性设置
    [waterfall setColumnSpacing:5 rowSpacing:5 sectionInset:UIEdgeInsetsMake(0, 5, 5, 5)];

    //设置代理，实现代理方法
    waterfall.delegate = self;
    
    //创建collectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:waterfall];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"WaterfallCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
}

//从plist文件中取出字典数组，并封装成对象模型，存入模型数组中,获取plist文件数据
- (NSMutableArray *)images{
    
    if (!_images) {
        
        _images = [NSMutableArray array];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"1.plist" ofType:nil];
        
        NSArray *imageDicArr = [NSArray arrayWithContentsOfFile:path];
        
        for (NSDictionary *imgDic in imageDicArr) {
            
            WaterfallImage *image = [WaterfallImage imageWithImageDic:imgDic];
            
            [_images addObject:image];
        }
    }
    return _images;
}


//根据item的宽度与indexPath计算每一个item的高度
- (CGFloat)waterfallLayout:(WaterfallLayout *)waterfallLayout itemHeightForWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath {
    
    //根据图片的原始尺寸，及显示宽度，等比例缩放来计算显示高度
    WaterfallImage *image = self.images[indexPath.item];
    
    return image.imageH / image.imageW * itemWidth;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.images.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WaterfallCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.imageURL = self.images[indexPath.item].imageURL;
    
    return cell;
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
