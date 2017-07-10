//
//  Video.h
//  SimpleYouTube
//
//  Created by Mohamed Farghal on 7/6/17.
//  Copyright © 2017 Mohamed Farghal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Channel.h"
@interface Video : NSObject

- (NSString *)thumbnailImageName;
- (void)setThumbnailImageName:(NSString *)newValue;

- (NSString *)title;
- (void)setTitle:(NSString *)newValue;

- (Channel *)channel;
- (void)setChannel:(Channel *)newValue;

- (NSNumber *)numberOfViews;

- (void)setNumberOfViews:(NSNumber *)newValue;

- (NSData *)uploadDate;

- (void)setUploadDate:(NSData *)newValue;

@end


/**/
 

