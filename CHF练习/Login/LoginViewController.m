//
//  MineViewController.m
//  CHF练习
//
//  Created by apple on 2018/8/9.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "MineViewController.h"
#import "EnrollViewController.h"
#import "InputView.h"
@interface LoginViewController ()
@property(nonatomic , strong) UILabel * titleLab;
@property(nonatomic , strong) InputView * inputView;
//@property(nonatomic , strong) UIImageView* numImg;
//@property(nonatomic , strong) UIImageView * lineImg;
//@property(nonatomic , strong) UIImageView * phoneImg;
//@property(nonatomic , strong) UIImageView * passWordImg;
//@property(nonatomic , strong) UITextField * phoneNum;
//@property(nonatomic , strong) UITextField * passWord;
//@property(nonatomic , strong) UIButton * rememberBtn;
//@property(nonatomic , strong) UILabel * rememberLab;
//@property(nonatomic , strong) UILabel * forgetLab;
@end

@implementation LoginViewController
//登录页面
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationController.navigationBarHidden = YES;//哪一页需要隐藏写在那一页
    //self.tabBarController.tabBar.hidden = YES;//隐藏tabBer
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_b_j1136"]];
    self.navigationItem.title = @"登录";
    //标题
    _titleLab = [[UILabel alloc]init];
    [self.view addSubview:_titleLab];
    _titleLab.text = @"德玛西亚";
    _titleLab.font = [UIFont systemFontOfSize:50.0];
    _titleLab.textColor = [UIColor whiteColor];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(120);
        make.centerX.equalTo(self.view.centerX);
        make.size.equalTo(CGSizeMake(250, 60));
    }];
    //输入框
    _inputView = [[InputView alloc]init];
    [self.view addSubview:_inputView];
    [_inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.bottom).offset(40);
        make.size.equalTo(CGSizeMake(250, 155));
        make.centerX.equalTo(self.view.centerX);
    }];
    _inputView.phoneNum.delegate = self;
    _inputView.passWord.delegate = self;
    [_inputView.rememberBtn addTarget:self action:@selector(remember:) forControlEvents:UIControlEventTouchUpInside];
    
    //登录
    UIButton* loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:loginBtn];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"login_btn_login_lan_xin"] forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"login_btn_login_lan_press_xin"] forState:UIControlStateHighlighted];
    [loginBtn addTarget:self action:@selector(loginView:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(240, 55));
        make.centerX.equalTo(self.inputView.centerX);
        make.top.equalTo(self.inputView.bottom).offset(15);
    }];
    //注册
    UIButton* enrollBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:enrollBtn];
    [enrollBtn setBackgroundImage:[UIImage imageNamed:@"login_btn_register_lan_xin"] forState:UIControlStateNormal];
    [enrollBtn setBackgroundImage:[UIImage imageNamed:@"login_btn_register_lan_press_xin"] forState:UIControlStateHighlighted];
    [enrollBtn addTarget:self action:@selector(enrollView:) forControlEvents:UIControlEventTouchUpInside];
    [enrollBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(200, 55));
        make.centerX.equalTo(self.inputView.centerX);
        make.top.equalTo(loginBtn.bottom).offset(25);
    }];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    //self.tabBarController.tabBar.hidden = YES;
}
int i = 1;//帮助判断第几次点击记住密码
-(void)loginView:(id)sender//登录跳转页面
{
    MineViewController* VC = [[MineViewController alloc]init];
    if(i % 2 == 0)
    {
        [self.navigationController pushViewController:VC animated:YES];
    }
    else if ([self.inputView.phoneNum.text isEqualToString:@"Chang"]&&[self.inputView .passWord.text isEqualToString:@"123456"])
    {
        [self.navigationController pushViewController:VC animated:YES];
    }
}
-(void)remember:(UIButton *)rememberBtn//记住密码不够完善
{
    if(i % 2 == 0)
    {
        [rememberBtn setBackgroundImage:[UIImage imageNamed:@"login_choose_bj"] forState:UIControlStateNormal];
        [self.inputView.phoneNum.text isEqualToString:@"Chang"];
        [self.inputView.passWord.text isEqualToString:@"123456"];
        i++;
    }
    else
    {
        [rememberBtn setBackgroundImage:[UIImage imageNamed:@"login_choose_press"] forState:UIControlStateNormal];
        i++;
    }
}

-(void)enrollView:(id)sender//注册跳转页面
{
    EnrollViewController * VC = [[EnrollViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}
//- (void)viewWillAppear:(BOOL)animated{
//
//    self.tabBarController.tabBar.hidden = NO;
//
//}

//- (void)viewWillDisappear:(BOOL)animated{
//
//    self.tabBarController.tabBar.hidden = YES;
//
//}

- (BOOL)textFieldShouldClear:(UITextField *)textField//清除
{
    return YES;
}
// 键盘推动
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField//开始编辑
{
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = CGRectMake(0, self.view.frame.origin.y - 50, SCREENWIDTH, SCREENHEIGHT);
        if(textField.secureTextEntry)
        {
            self.inputView.passWordImg.image = [UIImage imageNamed:@"login_icon_code_press"];
        }
        else
        {
            self.inputView.phoneImg.image = [UIImage imageNamed:@"login_icon_account_press"];
        }
        
    }];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField//编辑结束
{
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = CGRectMake(0, self.view.frame.origin.y + 50,SCREENWIDTH, SCREENHEIGHT);
        if(textField.secureTextEntry)//判断textFiled是否是密码
        {
            self.inputView.passWordImg.image = [UIImage imageNamed:@"login_icon_code"];
        }
        else
        {
            self.inputView.phoneImg.image = [UIImage imageNamed:@"login_icon_account"];
        }
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];//放弃第一个响应者
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(range.location > 15)
    {
        return NO;
    }
    return YES;
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
