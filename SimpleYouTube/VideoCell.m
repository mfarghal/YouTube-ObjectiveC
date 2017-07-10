//
//  VideoCell.m
//  SimpleYouTube
//
//  Created by Mohamed Farghal on 6/30/17.
//  Copyright © 2017 Mohamed Farghal. All rights reserved.
//

#import "VideoCell.h"

@interface VideoCell ()
-(void)setImageUrl:(UIImageView*)ImgController:(NSString*)ImgURL;
- (void)setTitleFeature_Size_NumberLines_ConstraintHeight;
@end

@implementation VideoCell
{
    NSCache *ImageCash;
    NSLayoutConstraint *heightLayoutConstraint;
    __weak IBOutlet UIImageView *thumbnailImage;
    __weak IBOutlet UIImageView *profileImage;
    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UITextView *subTitleLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    ImageCash = [[NSCache alloc] init];
    
    // NSString class method: boundingRectWithSize:options:attributes:context is
    // available only on ios7.0 sdk.
    
    
    heightLayoutConstraint = [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:40];
    [self addConstraint:heightLayoutConstraint];

    
    
    [subTitleLabel setTextContainerInset:UIEdgeInsetsMake(0, -4, 0, 0)];
    
}



- (void)setVideoToCell:(Video *)video{
    
    [titleLabel setText:video.title];
    [self setTitleFeature_Size_NumberLines_ConstraintHeightWithString:video.title];
    
    
    
    
    /*set thumbnailImage by get data from Link */
    [self setImageUrl:thumbnailImage :video.thumbnailImageName];
    
    /*set profileImage by get data from Link */
    [self setImageUrl:profileImage :video.channel.profileImageName];
    [[profileImage layer] setCornerRadius:profileImage.bounds.size.height/2];
    [profileImage setClipsToBounds:YES];
     
     
    /*to format Number of views ad decimal structure*/
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
    numberFormatter.locale = [NSLocale currentLocale];// this ensures the right separator behavior
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    numberFormatter.usesGroupingSeparator = YES;
    /**/
    
    
    subTitleLabel.text = [NSString stringWithFormat:@"%@ - %@ - 2 years Ago .",video.channel.name, [numberFormatter stringFromNumber:video.numberOfViews]];
    
}





-(void)setImageUrl:(UIImageView*)ImgController:(NSString*)ImgURL{
    if (ImgURL) {
        /*Cheak if Image oready get before IF true retreive it and out from function*/
        /*UIImage *imgCashed = [ImageCash objectForKey:ImgURL];
        if (imgCashed) {
            ImgController.image = imgCashed;
            NSLog(@"in Cashed");
            return ;
        }*/
        
        
        /*small trick to make Image in UIcollectionView not confused and set image to wron ImageView*/
        /*store URL and after finish request data getting cheak if the same URL or not */
        NSString *setImgURL_copy = ImgURL;
        
        ImgController.image = nil;
        [[NSURLSession sharedSession] dataTaskWithURL:[[NSURL alloc] initWithString:ImgURL] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable _, NSError * _Nullable error) {
            
            if (error) {
                NSLog(@"Error :: %@",error);
                return;
            }
            
            /*Cashae Image to make get Image more easy*/
            UIImage *ImageCashaed = [UIImage imageWithData:data];
            [ImageCash setObject:ImageCashaed forKey:ImgURL];
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if(setImgURL_copy == ImgURL){
                NSLog(@"in API");
                    ImgController.image = ImageCashaed;
                }
                
                
            });
            
            
        }].resume;
    }
}

- (void)setTitleFeature_Size_NumberLines_ConstraintHeightWithString:(NSString*)labelString{
    /*Set frame To Make Multiple Line in Label*/
    CGSize labelSize = [titleLabel.text sizeWithAttributes:@{NSFontAttributeName:titleLabel.font}];
    titleLabel.frame = CGRectMake(titleLabel.frame.origin.x, titleLabel.frame.origin.y,
                                  titleLabel.frame.size.width, labelSize.
                                  height);
    
    
    
    /*Set constraint_height to TitleLabel*/
    CGSize size = CGSizeMake([self frame].size.width -16 -44 -8 -16, 1000);
    NSStringDrawingOptions options = (NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin);
    CGRect estimatedRect = [labelString boundingRectWithSize:size options:options attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16]} context:nil];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    //height constraint
    if (estimatedRect.size.height > 20) {
        heightLayoutConstraint.constant = 40;
    }else{
        heightLayoutConstraint.constant = 20;
    }
    
    


}




@end
