//
//  SecondVCSecondView.m
//  CHF练习
//
//  Created by apple on 2018/8/14.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "SecondVCSecondView.h"

@implementation SecondVCSecondView
-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        
        [self layoutIfNeeded];
        _why = [[UITextView alloc]init];
        [self addSubview:_why];
        _why.returnKeyType = UIReturnKeyDefault;//return键的类型
        _why.backgroundColor = [UIColor whiteColor];
        _why.textColor = [UIColor blackColor];
        _why.textAlignment = NSTextAlignmentLeft;
        _why.font = [UIFont systemFontOfSize:18.0];
        [_why mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15);
            make.left.equalTo(15);
            make.centerY.equalTo(self.centerY);
            make.centerX.equalTo(self.centerX);
        }];
        //自定义占位符
        [self layoutIfNeeded];
        _zhanWeiFu = [[UILabel alloc] init];
        _zhanWeiFu.text = @"为什么？";
        _zhanWeiFu.enabled = NO;
        _zhanWeiFu.backgroundColor = [UIColor whiteColor];
        [_why addSubview:_zhanWeiFu];
        [_zhanWeiFu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(100, 30));
            make.centerY.equalTo(self.centerY);
            make.centerX.equalTo(self.centerX);
        }];
    }
    return self;
}

@end
