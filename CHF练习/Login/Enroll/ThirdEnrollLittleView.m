//
//  LittleView.m
//  CHF练习
//
//  Created by apple on 2018/8/13.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "ThirdEnrollLittleView.h"
#import "ThirdEnrollTextModel.h"
@implementation ThirdEnrollLittleView

-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        _text1 = [[UILabel alloc]init];
        [self addSubview:_text1];
        _text1.backgroundColor = [UIColor whiteColor];
        _text1.textColor = [UIColor blackColor];
        _text1.textAlignment = NSTextAlignmentLeft;
        [_text1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(80, 58));
            make.top.equalTo(self.top).offset(0);
            make.left.equalTo(self.left).offset(15);
        }];
        
        _text2 = [[UILabel alloc]init];
        [self addSubview:_text2];
        _text2.backgroundColor = [UIColor whiteColor];
        _text2.textColor = [UIColor blackColor];
        _text2.textAlignment = NSTextAlignmentLeft;
        [_text2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(250, 58));
            make.top.equalTo(self.top).offset(0);
            make.left.equalTo(self.text1.right).offset(20);
        }];

        
        [self layoutIfNeeded];
        UIImageView* line = [[UIImageView alloc]init];
        [self addSubview:line];
        line.image = [UIImage imageNamed:@"jiaoliu_line"];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(self.frame.size.width,1));
            make.top.equalTo(self.text1.bottom).offset(0.5);
            make.left.equalTo(self.left).offset(0);
        }];
    }
    return self;
}

-(void)setModel:(id)obj
{
    ThirdEnrollTextModel* model = (ThirdEnrollTextModel*)obj;
    self.text1.text = model.text1;
    self.text2.text = model.text2;
}




@end
