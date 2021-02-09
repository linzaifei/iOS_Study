//
//  HorFlowLayout.m
//  collectionView
//
//  Created by zifei on 2021/1/25.
//

#import "HorFlowLayout.h"

@implementation HorFlowLayout

-(void)prepareLayout{
    [super prepareLayout];
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //cell 左右两边间距
    CGFloat margin = (self.collectionView.frame.size.width-self.itemSize.width) /2;
    
    self.collectionView.contentInset = UIEdgeInsetsMake(0, margin, 0, margin);
}
/**
 当collectionView的显示范围发生改变的时候，是否需要重新刷新布局
一旦重新刷新布局，就会重新调用下面的方法：
 1.prepareLayout
 2.layoutAttributesForElementsInRect:方法
 */
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return  YES;
}
- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSArray *arr = [super layoutAttributesForElementsInRect:rect];
    
//    NSLog(@"%@",arr);
    
    CGFloat centerX = self.collectionView.contentOffset.x +self.collectionView.frame.size.width/2;
    
    for (UICollectionViewLayoutAttributes *attributes in arr) {

//        NSLog(@"%f ",attributes.center.x);
//        NSLog(@"%f ",centerX);
        NSInteger  distance = fabs(attributes.center.x-centerX);
        
        CGFloat scale = 1 - distance / self.collectionView.frame.size.width;
        attributes.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    
    return  arr;
    
}

//停止移动时候偏移量
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    
    CGRect rect  = CGRectMake(proposedContentOffset.x, 0, self.itemSize.width, self.itemSize.height);
    NSArray *arr = [self layoutAttributesForElementsInRect:rect];
    
    
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width/2;
    CGFloat scrollX = 50;
  
    for (UICollectionViewLayoutAttributes *attributes in arr) {
        NSLog(@"%f ",attributes.center.x);
        NSLog(@"%f ",centerX);
        if(fabs(attributes.center.x - centerX) > scrollX){
            scrollX = attributes.center.x - centerX;
        }
    }
    
    proposedContentOffset.x +=scrollX;
    
    return proposedContentOffset;
}


@end
