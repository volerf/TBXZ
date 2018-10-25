//
//  MineModel.h
//  CHF练习
//
//  Created by apple on 2018/8/11.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineModel : UIView
@property(nonatomic , strong) UIView * objView;
@property(nonatomic , strong) UILabel * nameLab;
@property(nonatomic , strong) UILabel * nameLab2;

-(void)setModle:(id)obj;
@end
