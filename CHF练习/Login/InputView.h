//
//  InputView.h
//  CHF练习
//
//  Created by apple on 2018/8/14.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputView : UIView
@property(nonatomic , strong) UIImageView* numImg;
@property(nonatomic , strong) UIImageView * lineImg;
@property(nonatomic , strong) UIImageView * phoneImg;
@property(nonatomic , strong) UIImageView * passWordImg;
@property(nonatomic , strong) UITextField * phoneNum;
@property(nonatomic , strong) UITextField * passWord;
@property(nonatomic , strong) UIButton * rememberBtn;
@property(nonatomic , strong) UILabel * rememberLab;
@property(nonatomic , strong) UILabel * forgetLab;
@end
