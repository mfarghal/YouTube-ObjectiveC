
//
//  Setting.m
//  SimpleYouTube
//
//  Created by Mohamed Farghal on 7/8/17.
//  Copyright © 2017 Mohamed Farghal. All rights reserved.
//

#import "Setting.h"

@implementation Setting
-(id)initWithName:(NSString*)name ImageName:(NSString*)imgName{
    self = [super init];
    self.imgName = imgName;
    self.name = name;
    return self;
}
@end
