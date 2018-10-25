//
//  SecondVCForthView.m
//  CHF练习
//
//  Created by apple on 2018/8/14.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "SecondVCForthView.h"

@implementation SecondVCForthView

-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        //红点按钮
        UIButton *Btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:Btn1];
        [Btn1 setBackgroundImage:[UIImage imageNamed:@"tizhong_btn_choose_no"] forState:UIControlStateNormal];
        [Btn1 setBackgroundImage:[UIImage imageNamed:@"tizhong_btn_choose_yes"] forState:UIControlStateHighlighted];
        [Btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(20, 20));//缩小图标
            make.centerY.equalTo(self.centerY);
            make.left.equalTo(self.left).offset(15);
        }];
        
        UIButton *Btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:Btn2];
        [Btn2 setBackgroundImage:[UIImage imageNamed:@"tizhong_btn_choose_no"] forState:UIControlStateNormal];
        [Btn2 setBackgroundImage:[UIImage imageNamed:@"tizhong_btn_choose_yes"] forState:UIControlStateHighlighted];
        [Btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(20, 20));//缩小图标
            make.centerY.equalTo(self.centerY);
            make.left.equalTo(self.centerX).offset(-35);
        }];
        
        UIButton *Btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:Btn3];
        [Btn3 setBackgroundImage:[UIImage imageNamed:@"tizhong_btn_choose_no"] forState:UIControlStateNormal];
        [Btn3 setBackgroundImage:[UIImage imageNamed:@"tizhong_btn_choose_yes"] forState:UIControlStateHighlighted];
        [Btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(20, 20));//缩小图标
            make.centerY.equalTo(self.centerY);
            make.right.equalTo(self.right).offset(-65);
        }];
        //文字
        UILabel* simi = [[UILabel alloc]init];
        [self addSubview:simi];
        simi.text = @"私密";
        simi.backgroundColor = [UIColor whiteColor];
        simi.textColor = [UIColor blackColor];
        simi.textAlignment = NSTextAlignmentLeft;
        [simi mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(40, 20));
            make.centerY.equalTo(self.centerY);
            make.left.equalTo(Btn1.right).offset(10);
        }];
        UILabel* qinyou = [[UILabel alloc]init];
        [self addSubview:qinyou];
        qinyou.text = @"亲友";
        qinyou.backgroundColor = [UIColor whiteColor];
        qinyou.textColor = [UIColor blackColor];
        qinyou.textAlignment = NSTextAlignmentLeft;
        [qinyou mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(40, 20));
            make.centerY.equalTo(self.centerY);
            make.left.equalTo(Btn2.right).offset(10);
        }];
        UILabel* gongkai = [[UILabel alloc]init];
        [self addSubview:gongkai];
        gongkai.text = @"公开";
        gongkai.backgroundColor = [UIColor whiteColor];
        gongkai.textColor = [UIColor blackColor];
        gongkai.textAlignment = NSTextAlignmentLeft;
        [gongkai mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(40, 20));
            make.centerY.equalTo(self.centerY);
            make.left.equalTo(Btn3.right).offset(10);
        }];
    }
    return self;
}
@end
