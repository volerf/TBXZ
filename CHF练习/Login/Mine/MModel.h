//
//  MModel.h
//  CHF练习
//
//  Created by apple on 2018/8/11.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MModel : NSObject
@property(nonatomic , strong) NSString * word1;
@property(nonatomic , strong) NSString * word2;
-(id)initWithWord1:(NSString*)w1 andWithWord2:(NSString*)w2;
@end
