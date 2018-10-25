//
//  SecondEnrollView.m
//  CHF练习
//
//  Created by apple on 2018/8/12.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "SecondEnrollViewController.h"
#import "ThirdEnrollViewController.h"
@interface SecondEnrollViewController ()
@property(nonatomic , strong) UITextField * passWord1;
@property(nonatomic , strong) UITextField * passWord2;
@end

@implementation SecondEnrollViewController
//注册页面二
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xE5E5E5);
    //导航条
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    self.navigationItem.title = @"设置密码";
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"-register_nav_icon_back_press"] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"-register_nav_icon_back"] forState:UIControlStateSelected];
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(20, 22));//缩小图标
    }];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"完成" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:18.0];
    [rightBtn addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    [self.navigationItem setRightBarButtonItem:rightItem];
    //密码输入框
    UIView* firstView = [[UIView alloc]init];
    [self.view addSubview:firstView];
    firstView.backgroundColor = [UIColor whiteColor];
    firstView.layer.masksToBounds = YES;
    firstView.layer.cornerRadius = 5;
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(SCREENWIDTH-30, 60));
        make.top.equalTo(100);
        make.centerX.equalTo(self.view.centerX);
    }];
    _passWord1 = [[UITextField alloc]init];
    [firstView addSubview:_passWord1];
    _passWord1.delegate = self;
    _passWord1.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"密码" attributes:[NSDictionary dictionaryWithObject:[UIColor grayColor] forKey:NSForegroundColorAttributeName]];
    _passWord1.clearButtonMode = UITextFieldViewModeAlways;
    [_passWord1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(SCREENWIDTH-50, 35));
        make.centerX.equalTo(firstView.centerX);
        make.centerY.equalTo(firstView.centerY);
    }];
    //重复输入框
    UIView* secondView = [[UIView alloc]init];
    [self.view addSubview:secondView];
    secondView.backgroundColor = [UIColor whiteColor];
    secondView.layer.masksToBounds = YES;
    secondView.layer.cornerRadius = 5;
    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(SCREENWIDTH-30, 60));
        make.top.equalTo(firstView.bottom).offset(20);
        make.centerX.equalTo(self.view.centerX);
    }];
    _passWord2 = [[UITextField alloc]init];
    [secondView addSubview:_passWord2];
    _passWord2.delegate = self;
    _passWord2.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"重新输入密码" attributes:[NSDictionary dictionaryWithObject:[UIColor grayColor] forKey:NSForegroundColorAttributeName]];
    _passWord2.clearButtonMode = UITextFieldViewModeAlways;
    [_passWord2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(SCREENWIDTH-50, 35));
        make.centerX.equalTo(secondView.centerX);
        make.centerY.equalTo(secondView.centerY);
    }];
}
//返回
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
//跳转下一页
-(void)next:(UIButton*)btn
{
    ThirdEnrollViewController* VC = [[ThirdEnrollViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];//放弃第一个响应者
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField//清除
{
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(range.location >= 10)
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
