//
//  HeadImgView.m
//  CHF练习
//
//  Created by apple on 2018/8/10.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "HeadImgView.h"

@implementation HeadImgView
//头部小头像
-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        _userImg = [[UIImageView alloc]init];
        [self addSubview:_userImg];
        _userImg.image = [UIImage imageNamed:@"h1.jpg"];
        _userImg.layer.masksToBounds = YES;
        _userImg.layer.cornerRadius = 40;
        _userImg.layer.borderColor = UIColorFromRGB(0XFFFFFF).CGColor;//设置边框颜色
        _userImg.layer.borderWidth = 2.0f;//设置边框宽
        [_userImg mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(150);
            make.height.width.equalTo(80);
            make.right.equalTo(-30);
        }];
        
        _userName = [[UILabel alloc]init];
        [self addSubview:_userName];
        _userName.text = @"小路飞";
        _userName.textColor = [UIColor blackColor];
        _userName.font = [UIFont systemFontOfSize:14.0];
        _userName.textAlignment = NSTextAlignmentRight;
        [_userName mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(180);
            make.height.equalTo(30);
            make.right.equalTo(self.userImg.left).offset(-10);
        }];
        
        _userAge = [[UILabel alloc]init];
        [self addSubview:_userAge];
        _userAge.text = @"年龄:18";
        _userAge.textColor = [UIColor blackColor];
        _userAge.font = [UIFont systemFontOfSize:14.0];
        _userAge.textAlignment = NSTextAlignmentRight;
        [_userAge mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(200);
            make.height.equalTo(30);
            make.right.equalTo(self.userImg.left).offset(-10);
        }];
    }
    return self;
}

@end
