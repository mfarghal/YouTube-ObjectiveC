//
//  HomeController.h
//  SimpleYouTube
//
//  Created by Mohamed Farghal on 6/30/17.
//  Copyright © 2017 Mohamed Farghal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Setting.h"
@interface HomeController : UICollectionViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>


-(void)showControllerForSettingsWith:(Setting*)setting;
@end
