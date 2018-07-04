//
//  Sica.h
//  Sica
//
//  Created by 中澤 郁斗 on 2018/05/16.
//  Copyright © 2018年 中澤 郁斗. All rights reserved.
//

#import "TargetConditionals.h"

#if TARGET_OS_OSX
#import <AppKit/AppKit.h>
#else
#import <UIKit/UIKit.h>
#endif

//! Project version number for Sica.
FOUNDATION_EXPORT double SicaVersionNumber;

//! Project version string for Sica.
FOUNDATION_EXPORT const unsigned char SicaVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <Sica/PublicHeader.h>


