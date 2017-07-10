//
//  Setting.h
//  SimpleYouTube
//
//  Created by Mohamed Farghal on 7/8/17.
//  Copyright © 2017 Mohamed Farghal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Setting : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *imgName;



-(id)initWithName:(NSString*)name ImageName:(NSString*)imgName;
@end
