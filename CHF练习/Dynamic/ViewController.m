//
//  ViewController.m
//  CHF练习
//
//  Created by apple on 2018/8/9.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "NewstabViewCell.h"
#import "HeadImgView.h"
#import "CellModel.h"
@interface ViewController ()
@property (nonatomic, strong) UITableView *tabView;
@property(nonatomic,strong)HeadImgView* headView;
@property(nonatomic,strong)NSMutableArray* objArray;
@property(nonatomic,strong)NSMutableArray* NameArray;
@property(nonatomic,strong)NSMutableArray* ImgArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //导航条
    //self.navigationController.navigationBar.alpha = 1;
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    self.navigationItem.title = @"动态";
    [self tabView];
    [self setMutableArray];
}
//初始化TableView
- (UITableView *)tabView
{
    if (!_tabView)
    {
        _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, -30, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        //_tabView.bounces = NO;//弹性 不加弹性会卡顿
        _tabView.showsVerticalScrollIndicator = NO;//滚动条
        [_tabView registerClass:[NewstabViewCell class] forCellReuseIdentifier:@"firstCell"];
        _tabView.delegate = self;
        _tabView.dataSource = self;
        [self.view addSubview:_tabView];
    }
    return _tabView;
}
- (void)setMutableArray
{
    //头部背景
    _headView = [[HeadImgView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 270)];
    self.tabView.tableHeaderView = _headView;
    _headView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"b3.jpg"]];
    //domel数组
    _objArray = [[NSMutableArray alloc]initWithCapacity:1];
    _NameArray = [[NSMutableArray alloc]initWithObjects:@"小路飞",@"小蜘蛛",@"小队长",@"小绿巨",@"小松鼠",nil];
    _ImgArray = [[NSMutableArray alloc]initWithObjects:@"g1.jpg",@"g2.jpg",@"g3.jpg",@"g4.jpg",@"g5.jpg",@"g6.jpg",@"g7.jpg",@"g8.jpg",@"g9.jpg",@"g10.jpg", nil];
    for(int i = 0; i < 5; i++)
    {
        CellModel* cell = [[CellModel alloc]initWithImgName:[NSString stringWithFormat:@"h%d.jpg",i + 1] andNameStr:[NSString stringWithFormat:@"%@",_NameArray[i]] andImgName1:[NSString stringWithFormat:@"%@",_ImgArray[i]] andImgName2:[NSString stringWithFormat:@"%@",_ImgArray[i+5]] andImgName4:[NSString stringWithFormat:@"dainzan.png"] andImgName5:[NSString stringWithFormat:@"pinglun.png"] andTitelStr1:@"2018-8-10" andTitelStr2:@"溜溜狗..."];
        [_objArray addObject:cell];
        NSLog(@"%@",_objArray);
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellModel* user = _objArray[indexPath.row];
    NewstabViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
    [cell setModle:user];
    return cell;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}
//点击时跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondViewController* VC = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}
//删除
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath//editingStyle编辑类型
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [_objArray removeObjectAtIndex:indexPath.row];
        NSIndexPath* path = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationLeft];
    }
}
//行数
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_objArray count];//有删除函数，必须用数组的值返回行数
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
