//
//  MenuBar.m
//  SimpleYouTube
//
//  Created by Mohamed Farghal on 7/2/17.
//  Copyright © 2017 Mohamed Farghal. All rights reserved.
//

#import "MenuBar.h"
#import "Extension-UIColor.h"
#import "MenuCell.h"

@interface MenuBar ()
-(void)setupHorizontalBar;
@end

@implementation MenuBar{
    NSArray *ImageName ;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        ImageName = [NSArray arrayWithObjects:@"home",@"trending",@"subscriptions",@"account", nil];
        
        self._collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];


        [self._collectionView setBackgroundColor:[UIColor whiteColor]];
        self._collectionView.delegate = self;
        self._collectionView.dataSource = self;
        
        //[self._collectionView registerClass:[MenuCell class] forCellWithReuseIdentifier:@"CellId"];
        
        NSString *nibName = @"MenuCell";
        UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
        [self._collectionView registerNib:nib forCellWithReuseIdentifier:@"CellId"];
        
        [self addSubview:self._collectionView];
        [self._collectionView setBackgroundColor:[UIColor whiteColor]];
        self._collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[__collectionView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(__collectionView)]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[__collectionView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(__collectionView)]];
        [self setNeedsUpdateConstraints];
        
        [self setupHorizontalBar];
        
    }
    return self;
}


-(void)setupHorizontalBar{
    UIView *horizontalBar = [[UIView alloc] init];
    horizontalBar.translatesAutoresizingMaskIntoConstraints = NO;
    horizontalBar.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    [self addSubview:horizontalBar];
    
    
    [horizontalBar setFrame:CGRectMake(0, 0, self.frame.size.width/4.0, 4)];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    

    MenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellId" forIndexPath:indexPath];
    NSString *ImgName = ImageName[indexPath.row];
    [cell setImageIcon:[[UIImage imageNamed:ImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [cell setTintColor:[UIColor ExactRGBWithRed:30 Green:32 Blue:32]];
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(collectionView.superview.frame.size.width /4, collectionView.superview.frame.size.height);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
