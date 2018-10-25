//
//  TextModel.m
//  CHF练习
//
//  Created by apple on 2018/8/13.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "ThirdEnrollTextModel.h"

@implementation ThirdEnrollTextModel
-(id)initWithText1:(NSString*)t1 andText2:(NSString*)t2;
{
    if(self = [super init])
    {
        self.text1 = t1;
        self.text2 = t2;
    }
    return self;
}
@end
