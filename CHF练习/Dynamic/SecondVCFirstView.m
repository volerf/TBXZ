//
//  SecondVCFirstView.m
//  CHF练习
//
//  Created by apple on 2018/8/14.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "SecondVCFirstView.h"

@implementation SecondVCFirstView
//日期页 第一个白块
-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        
        //日期选择
        UILabel* date = [[UILabel alloc]init];
        [self addSubview:date];
        date.text = @"日期";
        date.backgroundColor = [UIColor whiteColor];
        date.textColor = [UIColor blackColor];
        date.textAlignment = NSTextAlignmentLeft;
        [date mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(60, 58));
            make.top.equalTo(2);
            make.left.equalTo(self.left).offset(15);
        }];

        [self layoutIfNeeded];
        _dataNum = [[UITextField alloc]init];
        [self addSubview:_dataNum];
        _dataNum.tag = 66;
        _dataNum.backgroundColor = [UIColor whiteColor];
        _dataNum.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"选择日期" attributes:[NSDictionary dictionaryWithObject:[UIColor grayColor] forKey:NSForegroundColorAttributeName]];
        _dataNum.clearButtonMode = UITextFieldViewModeAlways;
        _dataNum.textAlignment = NSTextAlignmentLeft;
        [_dataNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.right).offset(-10);
            make.left.equalTo(date.right).offset(0);
            make.centerY.equalTo(date.centerY);
        }];
        //输入体重
        UILabel* weight = [[UILabel alloc]init];
        [self addSubview:weight];
        weight.text = @"体重";
        weight.backgroundColor = [UIColor whiteColor];
        weight.textColor = [UIColor blackColor];
        weight.textAlignment = NSTextAlignmentLeft;
        [weight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(60, 58));
            make.top.equalTo(date.bottom).offset(2);
            make.left.equalTo(self.left).offset(15);
        }];

        [self layoutIfNeeded];
        _weightNum = [[UITextField alloc]init];
        [self addSubview:_weightNum];
        _weightNum.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"kg" attributes:[NSDictionary dictionaryWithObject:[UIColor grayColor] forKey:NSForegroundColorAttributeName]];
        _weightNum.clearButtonMode = UITextFieldViewModeAlways;
        _weightNum.backgroundColor = [UIColor whiteColor];
        _weightNum.textColor = [UIColor blackColor];
        _weightNum.textAlignment = NSTextAlignmentLeft;
        [_weightNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.right).offset(-10);
            make.left.equalTo(weight.right).offset(0);
            make.centerY.equalTo(weight.centerY);
        }];
        //输入BMI
        UILabel* BMI = [[UILabel alloc]init];
        [self addSubview:BMI];
        BMI.text = @"BMI";
        BMI.backgroundColor = [UIColor whiteColor];
        BMI.textColor = [UIColor blackColor];
        BMI.textAlignment = NSTextAlignmentLeft;
        [BMI mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(60, 56));
            make.top.equalTo(weight.bottom).offset(2);
            make.left.equalTo(self.left).offset(15);
        }];

        [self layoutIfNeeded];
        _BMINum = [[UITextField alloc]init];
        [self addSubview:_BMINum];
        _BMINum.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"BMI:" attributes:[NSDictionary dictionaryWithObject:[UIColor grayColor] forKey:NSForegroundColorAttributeName]];
        _BMINum.clearButtonMode = UITextFieldViewModeAlways;
        _BMINum.backgroundColor = [UIColor whiteColor];
        _BMINum.textColor = [UIColor blackColor];
        _BMINum.textAlignment = NSTextAlignmentLeft;
        [_BMINum mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.size.equalTo(CGSizeMake(self.frame.size.width-80, 40));
            make.right.equalTo(self.right).offset(-10);
            make.left.equalTo(BMI.right).offset(0);
            make.centerY.equalTo(BMI.centerY);
        }];
        //无法实现点击时确定到当前的TextFile
//        NSArray *titles = @[@"日期", @"体重", @"BMI"];
//        NSMutableArray *placeholder =[[NSMutableArray alloc]initWithObjects:@"选择日期", @"kg", @"BMI:",nil];
//        for (int i = 0; i < 3; i++)
//        {
//            UILabel* date = [[UILabel alloc]init];
//            [self addSubview:date];
//            date.text = titles[i];
//            date.backgroundColor = [UIColor whiteColor];
//            date.textColor = [UIColor blackColor];
//            date.textAlignment = NSTextAlignmentLeft;
//            [date mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.size.equalTo(CGSizeMake(60, 58));
//                make.top.equalTo(2+(i*58));
//                make.left.equalTo(self.left).offset(15);
//            }];
//
//            [self layoutIfNeeded];
//            _dataNum = [[UITextField alloc]init];
//            [self addSubview:_dataNum];
//            _dataNum.backgroundColor = [UIColor whiteColor];
//            _dataNum.attributedPlaceholder = [[NSAttributedString alloc]initWithString:placeholder[i] attributes:[NSDictionary dictionaryWithObject:[UIColor grayColor] forKey:NSForegroundColorAttributeName]];
//            _dataNum.clearButtonMode = UITextFieldViewModeAlways;
//            _dataNum.textAlignment = NSTextAlignmentLeft;
//            [_dataNum mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.size.equalTo(CGSizeMake(270, 40));
//                make.left.equalTo(date.right).offset(0);
//                make.centerY.equalTo(date.centerY);
//            }];
//            if (i == 0)
//            {
//                _dataNum.tag = 66;
//            }


//        }
    }
    return self;
}

@end
