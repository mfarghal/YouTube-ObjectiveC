//
//  MenuBar.h
//  SimpleYouTube
//
//  Created by Mohamed Farghal on 7/2/17.
//  Copyright © 2017 Mohamed Farghal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuBar : UIView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *_collectionView ;


@end
