//
//  VideoCell.h
//  SimpleYouTube
//
//  Created by Mohamed Farghal on 6/30/17.
//  Copyright © 2017 Mohamed Farghal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"
@interface VideoCell : UICollectionViewCell

@property (nonatomic,weak)Video *video;
- (void)setVideoToCell:(Video *)video;
@end
