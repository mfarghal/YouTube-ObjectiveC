//
//  Video.m
//  SimpleYouTube
//
//  Created by Mohamed Farghal on 7/6/17.
//  Copyright © 2017 Mohamed Farghal. All rights reserved.
//

#import "Video.h"





@implementation Video{
    NSString *thumbnailImageName;
    NSString *title;
    NSNumber *numberOfViews;
    NSData *uploadDate;
    
    Channel *channel;
}

- (NSString *)thumbnailImageName {
    return thumbnailImageName;
}

- (void)setThumbnailImageName:(NSString *)newValue {
    thumbnailImageName = newValue;
}

- (NSString *)title {
    return title;
}

- (void)setTitle:(NSString *)newValue {
    title = newValue;
}

- (Channel *)channel {
    return channel;
}

- (void)setChannel:(Channel *)newValue {
    channel = newValue;
}

- (NSNumber *)numberOfViews {
    return numberOfViews;
}

- (void)setNumberOfViews:(NSNumber *)newValue {
    numberOfViews = newValue;
}

- (NSData *)uploadDate {
    return uploadDate;
}

- (void)setUploadDate:(NSData *)newValue {
    uploadDate = newValue;
}

@end


/**/

