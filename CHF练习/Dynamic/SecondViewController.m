//
//  SecondViewController.m
//  CHF练习
//
//  Created by apple on 2018/8/11.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"
#import "SecondVCFirstView.h"
#import "SecondVCSecondView.h"
#import "SecondVCThirdView.h"
#import "SecondVCForthView.h"
@interface SecondViewController ()
@property(nonatomic , strong) SecondVCFirstView * firstView;
@property(nonatomic , strong) SecondVCSecondView * secondView;
@property(nonatomic , strong) SecondVCThirdView * thirdView;
@property(nonatomic , strong) SecondVCForthView * forthView;
@property(nonatomic, strong) UIDatePicker *datePicker;


@property(nonatomic , strong)NSLocale * datelocale;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航条
    self.view.backgroundColor = UIColorFromRGB(0xE5E6E7);
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    self.navigationItem.title = @"发个心情";
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //leftBtn.frame = CGRectMake(0, 0, 18, 22);//不能缩小图标
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"-register_nav_icon_back_press"] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"-register_nav_icon_back"] forState:UIControlStateSelected];
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(20, 22));//缩小图标
    }];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"保存" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:18.0];
    //[rightBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    [self.navigationItem setRightBarButtonItem:rightItem];
    //第一块白块视图  设置frame，否则自定义控件中没法用self.frame
    _firstView = [[SecondVCFirstView alloc]init];
    [self.view addSubview:_firstView];
    _firstView.backgroundColor = [UIColor whiteColor];
    _firstView.layer.masksToBounds = YES;
    _firstView.layer.cornerRadius = 5;
    _firstView.dataNum.delegate = self;
    _firstView.weightNum.delegate = self;
    _firstView.BMINum.delegate = self;
    [_firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(SCREENWIDTH - 30, 180));
        make.top.equalTo(90);
        make.centerX.equalTo(self.view.centerX);
    }];
    
    //第二块白块视图，TextView
    _secondView = [[SecondVCSecondView alloc]init];
    [self.view addSubview:_secondView];
    _secondView.why.delegate = self;
    [_secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(SCREENWIDTH - 30, 120));
        make.top.equalTo(self.firstView.bottom).offset(20);
        make.centerX.equalTo(self.view.centerX);
    }];
    
    //第三块白块视图
     _thirdView = [[SecondVCThirdView alloc]init];
    [self.view addSubview:_thirdView];
    [_thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(SCREENWIDTH - 30, 80));
        make.top.equalTo(self.secondView.bottom).offset(20);
        make.centerX.equalTo(self.view.centerX);
    }];
    
    //第四块白块视图
    _forthView = [[SecondVCForthView alloc]init];
    [self.view addSubview:_forthView];
    [_forthView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(SCREENWIDTH - 30, 60));
        make.top.equalTo(self.thirdView.bottom).offset(20);
        make.centerX.equalTo(self.view.centerX);
    }];
    
}
//日期改动时
-(void)valueChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat : @"yyyy-MM-dd"];
    [dateFormatter setLocale:_datelocale];
    self.firstView.dataNum.text = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:datePicker.date]];
}
//返回
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
//清除
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;
}
//开始编辑推出键盘或者日期
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    [UIView animateWithDuration:0.3 animations:^{
        if(textField.tag == 66)
        {
            [textField resignFirstResponder];
            self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT-280, SCREENWIDTH, 280)];
            self.datePicker.datePickerMode = UIDatePickerModeDate;
            self.datePicker.maximumDate = [NSDate date];
            self.datelocale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_zn"];//设置时区
            self.datePicker.locale = self.datelocale;
            [self.datePicker addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
            //[self.view addSubview:self.datePicker];
           self.firstView.dataNum.inputView = self.datePicker;
        }
    }];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField//编辑结束
{
    [UIView animateWithDuration:0.3 animations:^{
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
//textView使键盘推动
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    self.view.frame = CGRectMake(0, self.view.frame.origin.y - 60, SCREENWIDTH, SCREENHEIGHT);
    self.secondView.zhanWeiFu.alpha = 0;
    return YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    self.view.frame = CGRectMake(0, self.view.frame.origin.y + 60, SCREENWIDTH, SCREENHEIGHT);
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    //把回车键当做退出键盘的响应键。
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
    
}
- (BOOL)textViewShouldRerurn:(UITextView *)textView
{
    [textView resignFirstResponder];//放弃第一个响应者
    return YES;
}
//自定义占位符
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    //将要停止编辑(不是第一响应者时)
    if (textView.text.length == 0) {
        self.secondView.zhanWeiFu.alpha = 1;//透明
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
