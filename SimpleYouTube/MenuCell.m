//
//  MenuCell.m
//  SimpleYouTube
//
//  Created by Mohamed Farghal on 7/4/17.
//  Copyright © 2017 Mohamed Farghal. All rights reserved.
//

#import "MenuCell.h"
#import "Extension-UIColor.h"

@interface MenuCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@end

@implementation MenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setBackgroundColor:[UIColor ExactRGBWithRed:230 Green:32 Blue:32]];
    
}
- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        [self setTintColor:[UIColor whiteColor]];
    }else{
        [self setTintColor:[UIColor ExactRGBWithRed:90 Green:32 Blue:32]];
    }
}




-(void)setImageIcon:(UIImage *)Img{
    _iconImage.image = Img;
}


@end
