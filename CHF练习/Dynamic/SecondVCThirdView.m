//
//  SecondVCThirdView.m
//  CHF练习
//
//  Created by apple on 2018/8/14.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "SecondVCThirdView.h"

@implementation SecondVCThirdView

-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        [self layoutIfNeeded];
        UIImageView* tianjiaImg = [[UIImageView alloc]init];
        [self addSubview:tianjiaImg];
        tianjiaImg.image = [UIImage imageNamed:@"tizhong_photo_increase_bj"];
        [tianjiaImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(60, 60));
            make.centerY.equalTo(self.centerY);
            make.left.equalTo(self.left).offset(15);
        }];
    }
    return self;
}

@end
