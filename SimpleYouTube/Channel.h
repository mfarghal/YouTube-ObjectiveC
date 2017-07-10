//
//  Channel.h
//  SimpleYouTube
//
//  Created by Mohamed Farghal on 7/6/17.
//  Copyright © 2017 Mohamed Farghal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Channel : NSObject

- (NSString *)name;
- (void)setName:(NSString *)newValue;

- (NSString *)profileImageName;
- (void)setProfileImageName:(NSString *)newValue;

@end
