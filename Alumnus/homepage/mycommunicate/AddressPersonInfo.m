 //
//  AddressPersonInfo.m
//  Alumnus
//
//  Created by 王智刚 on 15/10/18.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "AddressPersonInfo.h"
#import "SwitchBtn.h"

@interface AddressPersonInfo ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,SwitchBtnDelegate>
@property (nonatomic, strong)UIView *top;
@property (nonatomic, strong)UISearchBar *searchBar;
@property (nonatomic, strong)UITableView *searchTabel;
@property (nonatomic, strong)NSArray *dataList;
@property (nonatomic, strong)SwitchBtn *switchBtn;
@property (nonatomic, strong)UIView *info;
@property (nonatomic, strong)UILabel *name;
@property (nonatomic, strong)UILabel *position;
@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UITableView *infoTabel;
@property (nonatomic, strong)UIButton *sendMsg;
@end

@implementation AddressPersonInfo

#pragma lazy
- (UIView *)info
{
    if (!_info) {
        _info = [[UIView alloc]init];
        _info.backgroundColor = [UIColor whiteColor];
        
        UILabel *name = [[UILabel alloc]init];
        name.text = @"李冰";
        name.font = [UIFont systemFontOfSize:16];
        self.name = name;
        [_info addSubview:name];
        
        UILabel *position = [[UILabel alloc]init];
        position.text = @"部门助理";
        position.font = [UIFont systemFontOfSize:14];
        [_info addSubview:position];
        self.position = position;
        
        UIImageView *icon = [[UIImageView alloc]init];
        icon.backgroundColor = [UIColor greenColor];
        self.icon = icon;
        [_info addSubview:icon];
        
        UITableView *table = [[UITableView alloc]init];
        table.delegate = self;
        table.dataSource = self;
        table.tableFooterView = [[UIView alloc]init];
        self.infoTabel = table;
        [_info addSubview:table];
        
        UIButton *send = [UIButton buttonWithType:UIButtonTypeCustom];
        [send addTarget:self action:@selector(send:) forControlEvents:UIControlEventTouchUpInside];
        [send setTitle:@"发送消息" forState:UIControlStateNormal];
        [send setBackgroundColor:ALColor(19, 140, 80)];
        self.sendMsg = send;
        [_info addSubview:send];
        
        [self.view addSubview:_info];
    }
    return _info;
}

- (SwitchBtn *)switchBtn
{
    if (!_switchBtn) {
        _switchBtn = [[SwitchBtn alloc]initWithTitle:@"投资管理部"];
        _switchBtn.delegate = self;
        [self.view addSubview:_switchBtn];
        [self.view bringSubviewToFront:_switchBtn];
    }
    return _switchBtn;
}
- (UIView *)top
{
    if (!_top) {
        _top = [[UIView alloc]init];
        _top.backgroundColor = [UIColor whiteColor];
        
        UISearchBar *search = [[UISearchBar alloc]init];
        search.placeholder = @"搜索...";
        search.delegate = self;
        search.searchBarStyle = UISearchBarStyleMinimal;
        search.delegate = self;
        self.searchBar = search;
        
        [_top addSubview:search];
        
        [self.view addSubview:_top];
    }
    return _top;
}

- (UITableView *)searchTabel
{
    if (!_searchTabel) {
        _searchTabel = [[UITableView alloc]init];
        _searchTabel.delegate = self;
        _searchTabel.dataSource = self;
        _searchTabel.tableFooterView = [[UIView alloc]init];
        _searchTabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
        
        
        [self.view addSubview:_searchTabel];
        
    }
    
    return _searchTabel;
}

#pragma mark - lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化
    [self setup];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //获取数据
    [self loadData];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    //刷新视图
    [self resetSubViews];
}

#pragma mark - private api
//初始化
- (void)setup
{
    
}

//获取数据
- (void)loadData
{
    
}

//刷新视图
- (void)resetSubViews
{
    self.top.frame = CGRectMake(0, self.nav.height, SIZEWIDTH, 100);
    self.searchBar.width = self.view.width - 30;
    self.searchBar.height = self.top.height;
    self.searchBar.centerX = self.top.centerY;
    self.searchBar.x = 15;
    
    self.switchBtn.frame = CGRectMake(0, CGRectGetMaxY(self.top.frame), SIZEWIDTH, 40);
    
    self.info.frame = CGRectMake(0, CGRectGetMaxY(self.top.frame)+40, SIZEWIDTH, self.view.height - CGRectGetMaxY(self.top.frame));
    
    self.searchTabel.frame = CGRectMake(0, CGRectGetMaxY(self.top.frame)+40, SIZEWIDTH, self.view.height - CGRectGetMaxY(self.top.frame));
    
    [self.name sizeToFit];
    self.name.centerX = self.view.width * 0.5;
    self.name.y = 25;
    self.position.centerX = self.name.centerX;
    self.position.y = CGRectGetMaxY(self.name.frame) + 5;
    [self.position sizeToFit];
    self.icon.centerX = self.name.centerX;
    self.icon.width = 100;
    self.icon.height = 100;
    self.icon.y = CGRectGetMaxY(self.position.frame) + 10;
    
    self.infoTabel.width = self.view.width - 30;
    self.infoTabel.height = 180;
    self.infoTabel.y = CGRectGetMaxY(self.icon.frame)+ 20;
    self.infoTabel.x = 15;
    
    self.sendMsg.width = 80;
    self.sendMsg.height = 44;
    self.sendMsg.centerX = self.view.width * 0.5;
    self.sendMsg.y = CGRectGetMaxY(self.infoTabel.frame) + 10;
    
}

#pragma mark - action
- (void)send:(UIButton *)btn
{

}

#pragma mark - public api

#pragma mark - appleDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchTabel) {
        return 3;
    }
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
  if(tableView == self.searchTabel){
        cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"searchCell"];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"测试数据%zi",indexPath.row];
  }else{
      cell = [tableView dequeueReusableCellWithIdentifier:@"infoCell"];
      if (!cell) {
          cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"infoCell"];
      }
      cell.textLabel.text = @"个人信息";
      cell.detailTextLabel.text = @"测试";

  }
    return cell;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    self.searchTabel.hidden = NO;
    [self.view bringSubviewToFront:self.searchTabel];
    
    if (searchText.length == 0) {
        self.searchTabel.hidden = YES;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.searchTabel){
        [self.searchTabel removeFromSuperview];
    }else{
    
    }
}

#pragma mark - customDelegate
- (void)SwitchBtnDidClickBtnIndex:(NSUInteger)index
{

}
#pragma mark - property

@end
