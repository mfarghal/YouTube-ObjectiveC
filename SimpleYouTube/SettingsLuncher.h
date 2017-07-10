//
//  SettingsLuncher.h
//  SimpleYouTube
//
//  Created by Mohamed Farghal on 7/8/17.
//  Copyright © 2017 Mohamed Farghal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeController.h"
@interface SettingsLuncher : NSObject<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) HomeController *homeController;

- (id)init;
- (void)showSettingsCollection;
@end
