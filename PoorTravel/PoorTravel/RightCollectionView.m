//
//  RightCollectionView.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/12.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "RightCollectionView.h"
#import "RightIdeaCollectionViewCell.h"

@interface RightCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property (nonatomic, strong) UILabel *la;

@end
@implementation RightCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        self.delegate = self;
        self.dataSource = self;
    }
    
    [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    self.backgroundColor = [UIColor whiteColor];
    
    [self registerNib:
         [UINib nibWithNibName:@"RightIdeaCollectionViewCell" bundle:nil]
                forCellWithReuseIdentifier:@"cellID"];
    
   
    
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    IdeaData *data = _model.data[section];
    
    return data.guides.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    RightIdeaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID"
                                                                           forIndexPath:indexPath];
    IdeaGuides *guide = self.model.data[indexPath.section].guides[indexPath.row];
    
    [cell configData:guide];
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    
    return _model.data.count;
}

- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
   
    UICollectionReusableView *view = nil;
    if (!_la) {
      _la = [[UILabel alloc] initWithFrame:
             CGRectMake(0, 0, self.frame.size.width, 20)];
    }
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        _la.text = _model.data[indexPath.section].name;
        _la.textColor = [UIColor grayColor];
        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        
       [view addSubview:_la];
    }
    return view;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {


    return CGSizeMake(self.frame.size.width, 30);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    IdeaGuides *guide = self.model.data[indexPath.section].guides[indexPath.row];
    
    NSString *url = [NSString stringWithFormat:@"%@/260_390.jpg?cover_updatetime=1456743674",guide.cover];
    
    if (self.next) {
        self.next(url);
    }
    }

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {




}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
