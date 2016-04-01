//
//  UICollectionViewFlowLayout+FullItem.m
//  Wegou
//
//  Created by 钟文锋 on 16/3/20.
//  Copyright © 2016年 vinfol. All rights reserved.
//

#import "UICollectionViewFlowLayout+FullItem.h"
#import <objc/runtime.h>

@implementation UICollectionViewFlowLayout (FullItem)

- (void)setFullItem:(BOOL)fullItem{
    objc_setAssociatedObject(self, "fullItem", @(fullItem), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)fullItem{
    return [objc_getAssociatedObject(self, "fullItem") intValue];
}

- (void)prepareLayout{
    if (self.fullItem) {
        self.itemSize = self.collectionView.bounds.size;
    }
    [super prepareLayout];
}


@end
