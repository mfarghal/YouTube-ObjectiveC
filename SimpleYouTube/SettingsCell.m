//
//  SettingsCell.m
//  SimpleYouTube
//
//  Created by Mohamed Farghal on 7/8/17.
//  Copyright © 2017 Mohamed Farghal. All rights reserved.
//

#import "SettingsCell.h"

@implementation SettingsCell{
    
    __weak IBOutlet UIImageView *imageView;
    __weak IBOutlet UILabel *lblName;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    //[self setBackgroundColor:[UIColor redColor]];
    
}


-(void)setCellInfoWithName:(NSString*)name ImgName:(NSString*)imgname{
    imageView.image = [[UIImage imageNamed:imgname] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [imageView setTintColor:[UIColor darkGrayColor]];
    lblName.text = name;
}


-(void)setHighlighted:(BOOL)highlighted{
    
    if(highlighted){
        [self setBackgroundColor:[UIColor darkGrayColor]];
       
        [lblName setTextColor:[UIColor whiteColor]];
        [imageView setTintColor:[UIColor whiteColor]];
    }else{
        [self setBackgroundColor:[UIColor whiteColor]];
        
        [lblName setTextColor:[UIColor blackColor]];
        [imageView setTintColor:[UIColor darkGrayColor]];
        
    }
    
}

@end
