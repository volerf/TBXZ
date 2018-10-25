//
//  CellModel.h
//  CHF练习
//
//  Created by apple on 2018/8/10.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject
@property(nonatomic,strong)NSString* imgName;
@property(nonatomic,strong)NSString* nameStr;
@property(nonatomic,strong)NSString* titleStr1;
@property(nonatomic,strong)NSString* titleStr2;
@property(nonatomic,strong)NSString* imgName1;
@property(nonatomic,strong)NSString* imgName2;

@property(nonatomic,strong)NSString* imgName4;
@property(nonatomic,strong)NSString* imgName5;
-(id)initWithImgName:(NSString*)i andNameStr:(NSString*)n andImgName1:(NSString*)n1 andImgName2:(NSString*)n2 andImgName4:(NSString*)n4 andImgName5:(NSString*)n5 andTitelStr1:(NSString*)t1 andTitelStr2:(NSString*)t2;
@end
