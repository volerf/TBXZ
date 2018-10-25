//
//  ChatModel.m
//  CHF练习
//
//  Created by apple on 2018/8/10.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "ChatModel.h"

@implementation ChatModel
-(id)initWithImgName:(NSString*)i andName:(NSString*)n andTake:(NSString*)t
{
    if(self = [super init])
    {
        self.imgName = i;
        self.name = n;
        self.take = t;
    }
    return self;
}
@end
