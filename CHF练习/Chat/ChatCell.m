//
//  ChatCell.m
//  CHF练习
//
//  Created by apple on 2018/8/10.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "ChatCell.h"
#import "ChatModel.h"
#define LABSIZE CGSizeMake(60, 60)

@implementation ChatCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _imgView = [[UIImageView alloc]init];
        [self.contentView addSubview:_imgView];
        _imgView.layer.masksToBounds = YES;
        _imgView.layer.cornerRadius = 30;
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.centerY);
            make.left.equalTo(15);
            make.size.equalTo(LABSIZE);
        }];
        
        _nameLab = [[UILabel alloc]init];
        [self.contentView addSubview:_nameLab];
        _nameLab.font = [UIFont systemFontOfSize:20.0];
        [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgView.top).offset(10);
            make.left.equalTo(self.imgView.right).offset(20);
            
        }];
        
        _talkLab = [[UILabel alloc]init];
        [self.contentView addSubview:_talkLab];
        _talkLab.textColor = [UIColor grayColor];
        _nameLab.font = [UIFont systemFontOfSize:18.0];
        [_talkLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameLab.bottom).offset(10);
            make.left.equalTo(self.imgView.right).offset(20);
            
        }];
    }
    return self;
}

-(void)setChatModel:(id)obj
{
    ChatModel* model = (ChatModel*)obj;
    self.imgView.image = [UIImage imageNamed:model.imgName];
    self.nameLab.text = model.name;
    self.talkLab.text= model.take;
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
