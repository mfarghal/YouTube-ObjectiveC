//
//  SettingsLuncher.m
//  SimpleYouTube
//
//  Created by Mohamed Farghal on 7/8/17.
//  Copyright © 2017 Mohamed Farghal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Setting.h"
#import "SettingsLuncher.h"
#import "SettingsCell.h"
@interface SettingsLuncher ()
@property (nonatomic,strong) UIView *blackView;
@end


@implementation SettingsLuncher{
    NSArray *ImageName;
    UICollectionView *collection_View;
}

- (id)init {
    self = [super init];
    if (self) {
        
        
        ImageName = [NSArray arrayWithObjects:[[Setting alloc] initWithName:@"Settings" ImageName:@"settings"],
                     [[Setting alloc] initWithName:@"Terms & Privacy policy" ImageName:@"privacy"],
                     [[Setting alloc] initWithName:@"send Feedback" ImageName:@"feedback"],
                     [[Setting alloc] initWithName:@"Help" ImageName:@"help"],
                     [[Setting alloc] initWithName:@"Switch Account" ImageName:@"switch_account"],
                     [[Setting alloc] initWithName:@"Cancel" ImageName:@"cancel"],nil];
        
        self.blackView = [[UIView alloc] init];
        collection_View = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
        collection_View.dataSource = self;
        collection_View.delegate = self;
        
        
        NSString *nibName = @"SettingsCell";
        UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
        [collection_View registerNib:nib forCellWithReuseIdentifier:@"CellId"];
        
    }
    return self;
}

-(void)showSettingsCollection{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if(window){
        
        [window addSubview:self.blackView];
        [window addSubview:collection_View];
        
        
        
        CGFloat heightCollectionView = 200;
        CGFloat YPosition = window.bounds.size.height - heightCollectionView;
        [collection_View setBackgroundColor:[UIColor whiteColor]];
        
        

        
        [self.blackView setBackgroundColor:[UIColor colorWithWhite:0 alpha:.5]];
        [self.blackView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapDismiss)]];
        [self.blackView setFrame:window.frame];
        
        
        
        /*init Frame animate*/
        self.blackView.alpha = 0;
        collection_View.frame = CGRectMake(0, window.frame.size.height, window.frame.size.width, heightCollectionView);
        
        
        [UIView animateWithDuration:1.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
            self.blackView.alpha = 1;
            collection_View.frame = CGRectMake(0, YPosition, window.bounds.size.width, heightCollectionView);
        } completion:nil];
        
    }
}
-(void)viewTapDismiss{
    [UIView animateWithDuration:.5 animations:^{
         self.blackView.alpha = 0;
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        if(window){
            collection_View.frame = CGRectMake(0, window.frame.size.height, window.bounds.size.width, 200);
        }
        
    }];
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SettingsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellId" forIndexPath:indexPath];
   
    [cell setCellInfoWithName:((Setting*)ImageName[indexPath.row]).name ImgName:((Setting*)ImageName[indexPath.row]).imgName];
    
    return cell;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return ImageName.count;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(collection_View.bounds.size.width, 30);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.blackView.alpha = 0;
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        if(window){
            collection_View.frame = CGRectMake(0, window.frame.size.height, window.bounds.size.width, 200);
        }
    } completion:^(BOOL finished) {
        Setting *setting = ImageName[indexPath.row];
        [_homeController showControllerForSettingsWith:setting];
    }];
}

@end
