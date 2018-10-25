//
//  EnrollView.m
//  CHF练习
//
//  Created by apple on 2018/8/12.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "EnrollViewController.h"
#import "SecondEnrollViewController.h"
@interface EnrollViewController ()
@property(nonatomic , strong) UITextField * numText;
@property(nonatomic , strong) UITextField * timeText;
@property(nonatomic , strong) UILabel * time;
@property(nonatomic , strong) UIButton * timeBtn;
@property(nonatomic , strong) NSTimer * timer;
@property(nonatomic , strong) UIButton * rememberBtn;
@end

@implementation EnrollViewController
//注册页面一
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor = UIColorFromRGB(0xE5E5E5);
    //导航条
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    self.navigationItem.title = @"填写验证码";
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"-register_nav_icon_back_press"] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"-register_nav_icon_back"] forState:UIControlStateSelected];
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(20, 22));
    }];
    //提示
    UILabel * tishi = [[UILabel alloc]init];
    [self.view addSubview:tishi];
    tishi.text = @"我们已发送短信验证码到这个手机号";
    tishi.textColor = [UIColor grayColor];
    tishi.font = [UIFont systemFontOfSize:14.0];
    [tishi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(250, 20));
        make.top.equalTo(self.view.top).offset(80);
        make.centerX.equalTo(self.view.centerX).offset(36);
    }];
    _rememberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_rememberBtn];
    _rememberBtn.layer.masksToBounds = YES;
    _rememberBtn.layer.cornerRadius = 10;
    [_rememberBtn setBackgroundImage:[UIImage imageNamed:@"login_choose_bj"] forState:UIControlStateNormal];
    [_rememberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(20, 20));
        make.top.equalTo(self.view.top).offset(80);
        make.right.equalTo(tishi.left).offset(-5);
    }];
    //输入验证码
    UIView* firstView = [[UIView alloc]init];
    [self.view addSubview:firstView];
    firstView.backgroundColor = [UIColor whiteColor];
    firstView.layer.masksToBounds = YES;
    firstView.layer.cornerRadius = 5;
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake((SCREENWIDTH-40)/3*2, 60));
        make.top.equalTo(self.rememberBtn.bottom).offset(30);
        make.left.equalTo(15);
    }];
    _numText = [[UITextField alloc]init];
    [firstView addSubview:_numText];
    _numText.delegate = self;
    _numText.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入四位数验证码" attributes:[NSDictionary dictionaryWithObject:[UIColor grayColor] forKey:NSForegroundColorAttributeName]];
    _numText.clearButtonMode = UITextFieldViewModeAlways;
    [_numText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake((SCREENWIDTH-70)/3*2, 35));
        make.left.equalTo(firstView.left).offset(15);
        make.centerY.equalTo(firstView.centerY);
    }];
    //倒计时
    _timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_timeBtn];
    _timeBtn.layer.masksToBounds = YES;
    _timeBtn.layer.cornerRadius = 5;
    [_timeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_timeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _timeBtn.backgroundColor = [UIColor orangeColor];
    [_timeBtn addTarget:self action:@selector(time:) forControlEvents:UIControlEventTouchUpInside];
    [_timeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake((SCREENWIDTH-45)/3, 60));
        make.top.equalTo(self.rememberBtn.bottom).offset(30);
        make.left.equalTo(firstView.right).offset(10);
    }];
    //下一步按钮
    UIButton* nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:nextBtn];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextBtn setBackgroundImage:[UIImage imageNamed:@"login_btn_login_lan"] forState:UIControlStateNormal];
    [nextBtn setBackgroundImage:[UIImage imageNamed:@"login_btn_login_lan_press"] forState:UIControlStateHighlighted];
    [nextBtn addTarget:self action:@selector(nextView:) forControlEvents:UIControlEventTouchUpInside];
    [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(SCREENWIDTH-30, 55));
        make.centerX.equalTo(self.view.centerX);
        make.top.equalTo(firstView.bottom).offset(15);
    }];
}
//计时器
//创建按钮, 添加点击方法;
//用NSTimer定时器, 每秒执行一次, 定时改变Button的title,改变Button的样式, 设置Button不可点击;
//若倒计时结束, 定时器关闭, 并改变Button的样式, 可以点击;

-(void)time:(UIButton*)btn
{
    // 开启倒计时效果
        __block NSInteger time = 59; //倒计时时间
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
        dispatch_source_set_event_handler(_timer, ^{
            if(time <= 0)
            {
                //倒计时结束，关闭
                dispatch_source_cancel(_timer);
                dispatch_async(dispatch_get_main_queue(), ^{
                    //设置按钮的样式
                    [self.timeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                    [self.timeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    self.timeBtn.userInteractionEnabled = YES;
                });
            }
            else
            {
                int seconds = time % 60;
                dispatch_async(dispatch_get_main_queue(), ^{
                    //设置按钮显示读秒效果
                    [self.timeBtn setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                    [self.timeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    self.timeBtn.userInteractionEnabled = NO;
                });
                time--;
            }
        });
        dispatch_resume(_timer);
}



-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)nextView:(UIButton*)btn
{
    
    SecondEnrollViewController* VC = [[SecondEnrollViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

// 键盘
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
    if(range.location >= 4)
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
