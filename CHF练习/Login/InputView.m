//
//  InputView.m
//  CHF练习
//
//  Created by apple on 2018/8/14.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "InputView.h"

@implementation InputView

-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        //输入框
        _numImg = [[UIImageView alloc]init];
        [self addSubview:_numImg];
        _numImg.image = [UIImage imageNamed:@"login_loginbar_bj"];
        [_numImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.top).offset(0);
            make.size.equalTo(CGSizeMake(250, 120));
            make.centerX.equalTo(self.centerX);
        }];
        //分割线
        _lineImg = [[UIImageView alloc]init];
        [self addSubview:_lineImg];
        _lineImg.image = [UIImage imageNamed:@"login_loginbar_line"];
        [_lineImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(2);
            make.width.equalTo(210);
            make.centerX.equalTo(self.numImg.centerX);
            make.centerY.equalTo(self.numImg.centerY);
        }];
        //手机图标
        _phoneImg = [[UIImageView alloc]init];
        [self addSubview:_phoneImg];
        _phoneImg.image = [UIImage imageNamed:@"login_icon_account"];
        [_phoneImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(20, 20));
            make.left.equalTo(self.lineImg.left).offset(5);
            make.bottom.equalTo(self.lineImg.top).offset(-15);
        }];
        //密码图标
        _passWordImg= [[UIImageView alloc]init];
        [self addSubview:_passWordImg];
        _passWordImg.image = [UIImage imageNamed:@"login_icon_code"];
        [_passWordImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(20, 22));
            make.left.equalTo(self.lineImg.left).offset(5);
            make.bottom.equalTo(self.numImg.bottom).offset(-20);
        }];
        //手机号
        _phoneNum = [[UITextField alloc]init];//不设背景色
        [self addSubview:_phoneNum];
        //使用代理中的方法使键盘推动
        //占位符
        _phoneNum.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"手机号" attributes:[NSDictionary dictionaryWithObject:[UIColor grayColor] forKey:NSForegroundColorAttributeName]];
        _phoneNum.clearButtonMode = UITextFieldViewModeAlways;//清除
        [_phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(170, 30));
            make.left.equalTo(self.phoneImg.right).offset(15);
            make.centerY.equalTo(self.phoneImg.centerY);
        }];
        //密码
        _passWord = [[UITextField alloc]init];
        [self addSubview:_passWord];
       ;
        _passWord.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"密码" attributes:[NSDictionary dictionaryWithObject:[UIColor grayColor] forKey:NSForegroundColorAttributeName]];
        _passWord.clearButtonMode = UITextFieldViewModeAlways;
        _passWord.secureTextEntry = YES;//密码
        [_passWord mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(170, 30));
            make.left.equalTo(self.passWordImg.right).offset(15);
            make.centerY.equalTo(self.passWordImg.centerY);
        }];
        //记住密码
        _rememberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_rememberBtn];
        [_rememberBtn setBackgroundImage:[UIImage imageNamed:@"login_choose_bj"] forState:UIControlStateNormal];
        [_rememberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(20, 20));
            make.top.equalTo(self.numImg.bottom).offset(15);
            make.left.equalTo(self.numImg.left).offset(8);
        }];
        
        _rememberLab = [[UILabel alloc]init];
        [self addSubview:_rememberLab];
        _rememberLab.text = @"记住密码";
        _rememberLab.textColor = [UIColor whiteColor];
        _rememberLab.textAlignment = NSTextAlignmentLeft;
        [_rememberLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(100, 20));
            make.centerY.equalTo(self.rememberBtn.centerY);
            make.left.equalTo(self.rememberBtn.right).offset(10);
        }];
        _forgetLab = [[UILabel alloc]init];
        [self addSubview:_forgetLab];
        _forgetLab.text = @"忘记密码？";
        _forgetLab.textColor = [UIColor whiteColor];
        _forgetLab.textAlignment = NSTextAlignmentRight;
        [_forgetLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(100, 20));
            make.centerY.equalTo(self.rememberBtn.centerY);
            make.right.equalTo(self.numImg.right).offset(0);
        }];
    }
    return self;
}

@end
