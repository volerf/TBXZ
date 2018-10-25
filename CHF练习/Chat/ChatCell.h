//
//  ChatCell.h
//  CHF练习
//
//  Created by apple on 2018/8/10.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatCell : UITableViewCell
@property(nonatomic , strong) UIImageView *imgView;
@property(nonatomic , strong) UILabel * nameLab;
@property(nonatomic , strong) UILabel * talkLab;
-(void)setChatModel:(id)obj;
@end
