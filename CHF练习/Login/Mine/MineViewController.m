//
//  DataViewController.m
//  CHF练习
//
//  Created by apple on 2018/8/11.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "MineViewController.h"
#import "MineFirstRowView.h"
#import "MineModel.h"
#import "MModel.h"
@interface MineViewController ()
@property(nonatomic , strong) UIScrollView * scrollView;
@property(nonatomic , strong) MineFirstRowView * firstRow;
@property(nonatomic , strong) UIView * objView;
@property(nonatomic , strong) UIView * objView2;
@property(nonatomic , strong) UIImageView* headImg;
@property(nonatomic , strong) UIImageView * userImg;
@property(nonatomic,strong)NSMutableArray* objArray;
@property(nonatomic,strong)NSMutableArray* leftArray;
@property(nonatomic,strong)NSMutableArray* rightArray;
@end

@implementation MineViewController
//登录后页面，我的信息
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tabBarController.tabBar.hidden = NO;
    self.view.backgroundColor = UIColorFromRGB(0xE5E5E5);
    //导航条
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"-register_nav_icon_back_press"] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"-register_nav_icon_back"] forState:UIControlStateSelected];
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(20, 22));//缩小图标
    }];
    //滚动视图
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    [self.view addSubview:_scrollView];
    //头部
    _headImg = [[UIImageView alloc]init];
    _headImg.image = [UIImage imageNamed:@"contact_图层-2"];
    [_scrollView addSubview:_headImg];
    [_headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(0);
        make.height.equalTo(140);
        make.width.equalTo(SCREENWIDTH);
    }];
    
    _userImg = [[UIImageView alloc]init];
    [_scrollView addSubview:_userImg];
    _userImg.image = [UIImage imageNamed:@"h1.jpg"];
    _userImg.layer.masksToBounds = YES;
    _userImg.layer.cornerRadius = 50;
    [_userImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(100, 100));
        make.centerX.equalTo(self.headImg.centerX);
        make.centerY.equalTo(self.headImg.centerY);
    }];
    //第一行姓名，性别
    _firstRow= [[MineFirstRowView alloc]init];
    [_scrollView addSubview:_firstRow];
    _firstRow.backgroundColor = [UIColor whiteColor];
    [_firstRow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(SCREENWIDTH - 2, 60));
        make.top.equalTo(self.headImg.bottom).offset(0);
        make.left.equalTo(0);
    }];
    
    //下面七行
    _objArray = [[NSMutableArray alloc]initWithCapacity:1];
    _leftArray = [[NSMutableArray alloc]initWithObjects:@"出生日期",@"身份证号",@"手机号码",@"单位",@"职位",@"座机",@"邮箱",nil];
    _rightArray = [[NSMutableArray alloc]initWithObjects:@"2000-01-01",@"66666666666666",@"16666666666",@"草帽海贼团",@"船长",@"电话虫",@"邮寄海鸥",nil];
    for(int i = 0; i < 7; i++)
    {
        [self.view layoutIfNeeded];
        MineModel *obj = [[MineModel alloc] initWithFrame:CGRectMake(0, self.headImg.frame.size.height+(63*(i+1)), SCREENWIDTH, 60)];
        MModel * objModel = [[MModel alloc]initWithWord1:[NSString stringWithFormat:@"%@",_leftArray[i]] andWithWord2:[NSString stringWithFormat:@"%@",_rightArray[i]]];
        [obj setModle: objModel];
        [_scrollView addSubview:obj];
    }
    self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, self.headImg.frame.size.height+(63*10));
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
