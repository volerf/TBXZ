//
//  NewstabViewCell.m
//  CHF练习
//
//  Created by apple on 2018/8/9.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "NewstabViewCell.h"
#import "CellModel.h"
@implementation NewstabViewCell
#define LABSIZE CGSizeMake(100, 100)
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        //头像
        _cellUserImg = [[UIImageView alloc]init];
        [self.contentView addSubview:_cellUserImg];
        _cellUserImg.layer.masksToBounds = YES;
        _cellUserImg.layer.cornerRadius = 40;
        [_cellUserImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(30);
            make.width.height.equalTo(80);
            make.left.equalTo(20);
        }];
        _cellUserName = [[UILabel alloc]init];
        _cellUserName.textAlignment = NSTextAlignmentLeft;
        _cellUserName.font = [UIFont systemFontOfSize:14.0];
        [self.contentView addSubview:_cellUserName];
        [_cellUserName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cellUserImg.bottom).offset(10);
            make.left.equalTo(self.cellUserImg.left).offset(10);
        }];
        //文字
        _celltitle1 = [[UILabel alloc]init];
        _celltitle1.textAlignment = NSTextAlignmentLeft;
        _celltitle1.font = [UIFont systemFontOfSize:20.0];
        [self.contentView addSubview:_celltitle1];
        [_celltitle1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(20);
            make.left.equalTo(self.cellUserImg.right).offset(20);
            make.height.equalTo(25);
        }];
        
        _celltitle2 = [[UILabel alloc]init];
        _celltitle2.textAlignment = NSTextAlignmentLeft;
        _celltitle2.font = [UIFont systemFontOfSize:17.0];
        [self.contentView addSubview:_celltitle2];
        [_celltitle2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.celltitle1.bottom).offset(2);
            make.left.equalTo(self.celltitle1.left).offset(0);
            make.height.equalTo(25);
        }];
        //图片
        _cellImg1 = [[UIImageView alloc]init];
        _cellImg1.layer.masksToBounds = YES;
        _cellImg1.layer.cornerRadius = 5;
        [self.contentView addSubview:_cellImg1];
        [_cellImg1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-50);
            make.size.equalTo(LABSIZE);
            make.left.equalTo(self.celltitle1.left).offset(0);
        }];
        
        _cellImg2 = [[UIImageView alloc]init];
        _cellImg2.layer.masksToBounds = YES;
        _cellImg2.layer.cornerRadius = 5;
        [self.contentView addSubview:_cellImg2];
        [_cellImg2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-50);
            make.size.equalTo(LABSIZE);
            make.left.equalTo(self.cellImg1.right).offset(10);
        }];
        //点赞
        _celldianzan = [[UIImageView alloc]init];
        [self.contentView addSubview:_celldianzan];
        [_celldianzan mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-10);
            make.right.equalTo(-20);
            make.size.equalTo(CGSizeMake(20, 20));
        }];
        //评论
        _cellpinglun = [[UIImageView alloc]init];
        [self.contentView addSubview:_cellpinglun];
        [_cellpinglun mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-10);
            make.right.equalTo(self.celldianzan.left).offset(-20);
            make.size.equalTo(CGSizeMake(20, 20));
        }];
    }
    return self;
}

-(void)setModle:(id)obj
{
    CellModel* cell = (CellModel*)obj;
    self.cellUserImg.image = [UIImage imageNamed:cell.imgName];
    self.cellUserName.text = cell.nameStr;
    self.cellImg1.image = [UIImage imageNamed:cell.imgName1];
    self.cellImg2.image = [UIImage imageNamed:cell.imgName2];
    self.celldianzan.image = [UIImage imageNamed:cell.imgName4];
    self.cellpinglun.image = [UIImage imageNamed:cell.imgName5];
    self.celltitle1.text = cell.titleStr1;
    self.celltitle2.text = cell.titleStr2;
    
}







- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
