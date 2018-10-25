//
//  GlobalDefine.h
//  XibAdapt
//
//  Created by wangze on 15/8/29.
//  Copyright (c) 2015年 wangze. All rights reserved.
//

#ifndef XibAdapt_GlobalDefine_h
#define XibAdapt_GlobalDefine_h

#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREENHEIGHT [[UIScreen mainScreen] bounds].size.height

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#endif
