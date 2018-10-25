//
//  thirdEnrollView.m
//  CHF练习
//
//  Created by apple on 2018/8/12.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "ThirdEnrollViewController.h"
#import "ThirdEnrollLittleView.h"
#import "ThirdEnrollTextModel.h"
@interface ThirdEnrollViewController ()
@property(nonatomic , strong) ThirdEnrollLittleView * first;
@property(nonatomic , strong) NSMutableArray * leftArr;
@property(nonatomic , strong) NSMutableArray * rightArr;
@property(nonatomic , strong) UIScrollView * scrollView;
@end

@implementation ThirdEnrollViewController
//注册页面三
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xE5E5E5);
    //导航条
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    self.navigationItem.title = @"完善资料";
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"-register_nav_icon_back_press"] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"-register_nav_icon_back"] forState:UIControlStateSelected];
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(20, 22));
    }];
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"wanshanziliao_icon_affirm_press"] forState:UIControlStateNormal];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"wanshanziliao_icon_affirm"] forState:UIControlStateSelected];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    [self.navigationItem setRightBarButtonItem:rightItem];
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(22, 20));
    }];
    //滚动视图
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    [self.view addSubview:_scrollView];
    //头像栏
    UIView* firstView = [[UIView alloc]init];
    [_scrollView addSubview:firstView];
    firstView.backgroundColor = [UIColor whiteColor];
    firstView.layer.masksToBounds = YES;
    firstView.layer.cornerRadius = 5;
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(SCREENWIDTH - 30, 80));
        make.top.equalTo(30);
        make.centerX.equalTo(self.view.centerX);
    }];
    
    UILabel* date = [[UILabel alloc]init];
    [firstView addSubview:date];
    date.text = @"头 像";
    date.backgroundColor = [UIColor whiteColor];
    date.textColor = [UIColor blackColor];
    date.textAlignment = NSTextAlignmentLeft;
    [date mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(60, 58));
        make.centerY.equalTo(firstView.centerY);
        make.left.equalTo(firstView.left).offset(15);
    }];
    UIImageView *userImg2 = [[UIImageView alloc]init];
    [firstView addSubview:userImg2];
    userImg2.image = [UIImage imageNamed:@"h3.jpg"];
    userImg2.layer.masksToBounds = YES;
    userImg2.layer.cornerRadius = 32.5;
    [userImg2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(65, 65));
        make.right.equalTo(firstView.right).offset(-20);
        make.centerY.equalTo(firstView.centerY);
    }];
    UIImageView *userImg = [[UIImageView alloc]init];
    [firstView addSubview:userImg];
    userImg.image = [UIImage imageNamed:@"wanshanziliao_doctor_touxiang"];
    [userImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(90, 75));
        make.right.equalTo(userImg2.right).offset(8);
        make.centerY.equalTo(userImg2.centerY);
    }];
    
   
    
    //昵称部分
    UIView* secondView = [[UIView alloc]init];
    [_scrollView addSubview:secondView];
    secondView.backgroundColor = [UIColor whiteColor];
    secondView.layer.masksToBounds = YES;
    secondView.layer.cornerRadius = 5;
    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(SCREENWIDTH - 30, 300));
        make.top.equalTo(firstView.bottom).offset(15);
        make.centerX.equalTo(self.view.centerX);
    }];

    _leftArr = [[NSMutableArray alloc]initWithObjects:@"昵 称",@"实 名",@"性 别",@"手 机",@"邮 箱",nil];
    _rightArr = [[NSMutableArray alloc]initWithObjects:@"大宝剑",@"盖伦",@"男",@"666666",@"@66.66666.com",nil];
    for(int i = 0; i < 5; i++)
    {
        [self.view layoutIfNeeded];
        ThirdEnrollLittleView *obj = [[ThirdEnrollLittleView alloc] initWithFrame:CGRectMake(0,secondView.bounds.origin.y+(60*i) ,secondView.frame.size.width-1, 58)];
        ThirdEnrollTextModel * objModel = [[ThirdEnrollTextModel alloc]initWithText1:[NSString stringWithFormat:@"%@",_leftArr[i]] andText2:[NSString stringWithFormat:@"%@",_rightArr[i]]];
        [obj setModel:objModel];
        [secondView addSubview:obj];
    }
    self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT*1.5);
    //男女选择
    UIButton* boyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:boyBtn];
    [boyBtn setBackgroundImage:[UIImage imageNamed:@"ziliao_btn_boy"] forState:UIControlStateNormal];
    [boyBtn setBackgroundImage:[UIImage imageNamed:@"ziliao_btn_girl"] forState:UIControlStateHighlighted];
    //[boyBtn addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [boyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(70, 40));
        make.right.equalTo(secondView.right).offset(-20);
        make.centerY.equalTo(secondView.centerY);
    }];
    
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
