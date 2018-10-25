//
//  ChatModel.h
//  CHF练习
//
//  Created by apple on 2018/8/10.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatModel : NSObject
@property(nonatomic , strong) NSString * imgName;
@property(nonatomic , strong) NSString * name;
@property(nonatomic , strong) NSString * take;
-(id)initWithImgName:(NSString*)i andName:(NSString*)n andTake:(NSString*)t;
@end
