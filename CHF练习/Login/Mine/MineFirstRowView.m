//
//  MineFirstRowView.m
//  CHF练习
//
//  Created by apple on 2018/8/14.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "MineFirstRowView.h"

@implementation MineFirstRowView

-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        _nameLab = [[UILabel alloc]init];
        [self addSubview:_nameLab];
        _nameLab.text = @"真实姓名";
        _nameLab.backgroundColor = [UIColor whiteColor];
        _nameLab.textColor = [UIColor grayColor];
        _nameLab.textAlignment = NSTextAlignmentLeft;
        [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(80, 60));
            make.top.equalTo(self.bottom).offset(0);
            make.left.equalTo(self.left).offset(15);
        }];
        
        _nameLab2 = [[UILabel alloc]init];
        [self addSubview:_nameLab2];
        _nameLab2.text = @"路飞";
        _nameLab2.backgroundColor = [UIColor whiteColor];
        _nameLab2.textColor = [UIColor blackColor];
        _nameLab2.textAlignment = NSTextAlignmentRight;
        [_nameLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(80, 60));
            make.top.equalTo(self.top).offset(0);
            make.right.equalTo(self.centerX).offset(-1);
        }];
        
        _sexLab = [[UILabel alloc]init];
        [self addSubview:_sexLab];
        _sexLab.text = @"性别";
        _sexLab.backgroundColor = [UIColor whiteColor];
        _sexLab.textColor = [UIColor grayColor];
        _sexLab.textAlignment = NSTextAlignmentLeft;
        [_sexLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(80, 60));
            make.top.equalTo(self.top).offset(0);
            make.left.equalTo(self.centerX).offset(-1);
        }];
        
        _sexLab2 = [[UILabel alloc]init];
        [self addSubview:_sexLab2];
        _sexLab2.text = @"男";
        _sexLab2.backgroundColor = [UIColor whiteColor];
        _sexLab2.textColor = [UIColor blackColor];
        _sexLab2.textAlignment = NSTextAlignmentRight;
        [_sexLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(80, 60));
            make.top.equalTo(self.top).offset(0);
            make.right.equalTo(self.right).offset(15);
        }];

    }
    return self;
}


@end
