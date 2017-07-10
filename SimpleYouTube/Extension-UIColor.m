//
//  Extension-UIColor.m
//  SimpleYouTube
//
//  Created by Mohamed Farghal on 7/2/17.
//  Copyright © 2017 Mohamed Farghal. All rights reserved.
//

#import "Extension-UIColor.h"

@implementation UIColor (Extension_UIColor)
+ (UIColor *) ExactRGBWithRed:(CGFloat)red Green:(CGFloat)green Blue:(CGFloat)blue {
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1];
}
@end
