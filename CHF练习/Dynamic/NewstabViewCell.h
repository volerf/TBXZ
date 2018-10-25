//
//  NewstabViewCell.h
//  CHF练习
//
//  Created by apple on 2018/8/9.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewstabViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView* cellUserImg;
@property(nonatomic,strong)UILabel* cellUserName;
@property(nonatomic,strong)UILabel* celltitle1;
@property(nonatomic,strong)UILabel* celltitle2;
@property(nonatomic,strong)UIImageView* cellImg1;
@property(nonatomic,strong)UIImageView* cellImg2;
@property(nonatomic,strong)UIImageView* cellImg3;
@property(nonatomic,strong)UIImageView* celldianzan;
@property(nonatomic,strong)UIImageView* cellpinglun;
-(void)setModle:(id)obj;
@end
