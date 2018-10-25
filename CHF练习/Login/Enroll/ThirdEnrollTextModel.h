//
//  TextModel.h
//  CHF练习
//
//  Created by apple on 2018/8/13.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThirdEnrollTextModel : NSObject
@property(nonatomic , strong) NSString * text1;
@property(nonatomic , strong) NSString * text2;
-(id)initWithText1:(NSString*)t1 andText2:(NSString*)t2;
@end
