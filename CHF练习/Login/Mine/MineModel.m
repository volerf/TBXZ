//
//  MineModel.m
//  CHF练习
//
//  Created by apple on 2018/8/11.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "MineModel.h"
#import "MModel.h"
@implementation MineModel


-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        _objView = [[UIView alloc]init];
        [self addSubview:_objView];
        _objView.backgroundColor = [UIColor whiteColor];
        [_objView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(SCREENWIDTH , 60));
            make.top.equalTo(self.top).offset(0);
            make.left.equalTo(0);
        }];
        
        _nameLab = [[UILabel alloc]init];
        [_objView addSubview:_nameLab];
        //_nameLab.text = @"真实姓名";
        _nameLab.backgroundColor = [UIColor whiteColor];
        _nameLab.textColor = [UIColor grayColor];
        _nameLab.textAlignment = NSTextAlignmentLeft;
        [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(80, 60));
            make.top.equalTo(self.top).offset(0);
            make.left.equalTo(self.objView.left).offset(15);
        }];
        
        _nameLab2 = [[UILabel alloc]init];
        [_objView addSubview:_nameLab2];
        //_nameLab2.text = @"路飞";
        _nameLab2.backgroundColor = [UIColor whiteColor];
        _nameLab2.textColor = [UIColor blackColor];
        _nameLab2.textAlignment = NSTextAlignmentRight;
        [_nameLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(240, 60));
            make.top.equalTo(self.top).offset(0);
            make.right.equalTo(self.objView.right).offset(-15);
        }];
    }
    return self;
}

-(void)setModle:(id)obj
{
    MModel* objs = (MModel*)obj;
    self.nameLab.text = objs.word1;
    self.nameLab2.text = objs.word2;
}
@end
