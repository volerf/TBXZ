//
//  MModel.m
//  CHF练习
//
//  Created by apple on 2018/8/11.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "MModel.h"

@implementation MModel
-(id)initWithWord1:(NSString*)w1 andWithWord2:(NSString*)w2
{
    if(self = [super init])
    {
        self.word1 = w1;
        self.word2 = w2;
    }
    return self;
}
@end
