//
//  ChatViewController.m
//  CHF练习
//
//  Created by apple on 2018/8/9.
//  Copyright © 2018年 CHF. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatCell.h"
#import "ChatModel.h"
@interface ChatViewController ()
@property(nonatomic , strong) UIButton * rightBtn;
@property(nonatomic , strong) UITableView * tabView;
@property(nonatomic,strong)NSMutableArray* objArray;
@property(nonatomic,strong)NSMutableArray* NameArray;
@property(nonatomic,strong)NSMutableArray* takeArray;
@property(nonatomic , strong)NSMutableArray * imgArray;
@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //导航条
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary
    dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    self.navigationItem.title = @"交流";
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightBtn setBackgroundImage:[UIImage imageNamed:@"jiaoliu_nav_btn_talk_press"] forState:UIControlStateNormal];
    [_rightBtn setBackgroundImage:[UIImage imageNamed:@"jiaoliu_nav_btn_talk"] forState:UIControlStateHighlighted];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:_rightBtn];
    [self.navigationItem setRightBarButtonItem:rightItem];
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(25, 27));
    }];
    //设置tableView
    _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:(UITableViewStylePlain)];
    //_tabView.bounces = NO;//弹性
    _tabView.showsVerticalScrollIndicator = NO;//滚动条
    _tabView.tableFooterView = [[UIView alloc] init];//无数据的不显示分割线
    _tabView.delegate = self;
    _tabView.dataSource = self;
    [_tabView registerClass:[ChatCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:_tabView];
    
    //domel数组
    _objArray = [[NSMutableArray alloc]initWithCapacity:1];
    _imgArray = [[NSMutableArray alloc]initWithObjects:@"h1.jpg",@"h2.jpg",@"h3.jpg",@"h4.jpg",@"h5.jpg", nil];
    _NameArray = [[NSMutableArray alloc]initWithObjects:@"小路飞",@"小蜘蛛",@"小队长",@"小绿巨",@"小松鼠",nil];
    _takeArray = [[NSMutableArray alloc]initWithObjects:@"天",@"气",@"不",@"错",@"哟", nil];
    for(int i = 0; i < 5; i++)
    {
        ChatModel* cell = [[ChatModel alloc]initWithImgName:[NSString stringWithFormat:@"%@",_imgArray[i]]
            andName:[NSString stringWithFormat:@"%@",_NameArray[i]]
            andTake:[NSString stringWithFormat:@"%@",_takeArray[i]]];
                           
        [_objArray addObject:cell];
    }
  
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatModel* model = _objArray[indexPath.row];
    ChatCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell setChatModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
//删除某一行
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_objArray removeObjectAtIndex:indexPath.row];
    NSIndexPath* path = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationLeft];
    
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_objArray count];
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
