//
//  CellModel.m
//  CHF练习
//
//  Created by apple on 2018/8/10.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel
-(id)initWithImgName:(NSString*)i andNameStr:(NSString*)n andImgName1:(NSString*)n1 andImgName2:(NSString*)n2 andImgName4:(NSString*)n4 andImgName5:(NSString*)n5 andTitelStr1:(NSString*)t1 andTitelStr2:(NSString*)t2
{
    if(self = [super init])
    {
        self.imgName = i;
        self.nameStr = n;
        self.imgName1 = n1;
        self.imgName2 = n2;
        self.imgName4 = n4;
        self.imgName5 = n5;
        self.titleStr1 = t1;
        self.titleStr2 = t2;
        
    }
    return self;
}

@end
