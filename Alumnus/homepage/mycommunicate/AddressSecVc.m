//
//  AddressSecVc.m
//  Alumnus
//
//  Created by 王智刚 on 15/10/18.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "AddressSecVc.h"
#import "AddressPersonInfo.h"
#import "SwitchBtn.h"
#import "MBProgressHUD+MJ.h"
#import "AddressSecModel.h"

@interface AddressSecVc ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,SwitchBtnDelegate>
@property (nonatomic, strong)UIView *top;
@property (nonatomic, strong)UISearchBar *searchBar;
@property (nonatomic, strong)UITableView *searchTabel;
@property (nonatomic, strong)NSMutableArray *dataList;
@property (nonatomic, strong)UITableView *bookTable;
@property (nonatomic, strong)UIView *switchView;
@property (nonatomic, strong)SwitchBtn *switchBtn;

@end

@implementation AddressSecVc

#pragma lazy
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

- (UITableView *)bookTable
{
    if (!_bookTable) {
        _bookTable = [[UITableView alloc]init];
        _bookTable.delegate = self;
        _bookTable.dataSource = self;
        _bookTable.tableFooterView = [[UIView alloc]init];
        [self.view addSubview:_bookTable];
    }
    return _bookTable;
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
- (instancetype)initWithTitle:(NSString *)title
{
    AddressSecVc *vc = [self init];
    vc.titleString = title;
    return vc;
}


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
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"866769021414134" forKey:@"mobileDeviceId"];
    [params setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"mobileUserCode"] forKey:@"mobileUserCode"];
    [params setValue:@" AND DEPT_PCODE = '3rin6giCR9vUIv6kHIO3ex' and DEPT_CODE != ODEPT_CODE" forKey:@"_WHERE_"];
    [MBProgressHUD showMessage:@"正在加载"];
    [ALNetWorkApi mobileThisDeptWithDict:params withResponse:^(BOOL success, id responseData, NSString *message) {
        self.dataList = [NSMutableArray array];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dict in (NSArray *)responseData) {
            AddressSecModel *model = [AddressSecModel getEntityFromDic:dict];
            [temp addObject:model];
        }
        self.dataList = temp;
        [self.bookTable reloadData];
        [MBProgressHUD hideHUD];
    }];

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
    
    self.bookTable.frame = CGRectMake(0, CGRectGetMaxY(self.top.frame)+40, SIZEWIDTH , self.view.height - CGRectGetMaxY(self.top.frame));
    
    self.searchTabel.frame = CGRectMake(self.bookTable.x, self.bookTable.y, SIZEWIDTH, self.bookTable.height);
}
#pragma mark - public api

#pragma mark - appleDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchTabel) {
        return 3;
    }
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (tableView == self.bookTable) {
        AddressSecModel *model = self.dataList[indexPath.row];
        cell = [tableView dequeueReusableCellWithIdentifier:@"addressBookCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addressBookCell"];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIImageView *icon = [[UIImageView alloc]init];
        icon.backgroundColor = [UIColor greenColor];
        icon.width = 30;
        icon.height = 30;
        icon.x = 20;
        icon.centerY = cell.centerY;
        [cell addSubview:icon];
        
        UILabel *name = [[UILabel alloc]init];
        name.x = CGRectGetMaxX(icon.frame) + 20;
        name.font = [UIFont systemFontOfSize:12];
        name.textColor = [UIColor blackColor];
        name.text = @"李先生";
        [name sizeToFit];
        name.y = icon.y;
        [cell addSubview:name];
        
        UILabel *position = [[UILabel alloc]init];
        position.x = CGRectGetMaxX(name.frame) + 15;
        position.font = [UIFont systemFontOfSize:12];
        position.textColor = [UIColor blackColor];
        position.text = @"项目经理";
        [position sizeToFit];
        position.y = icon.y;
        [cell addSubview:position];
        
        UILabel *depart = [[UILabel alloc]init];
        depart.x = CGRectGetMaxX(position.frame) + 15;
        depart.font = [UIFont systemFontOfSize:12];
        depart.textColor = [UIColor blackColor];
        depart.text = @"投资管理部";
        [depart sizeToFit];
        depart.y = icon.y;
        [cell addSubview:position];
        
        UIImageView *phoneIcon = [[UIImageView alloc]init];
        phoneIcon.backgroundColor = [UIColor greenColor];
        phoneIcon.width = 15;
        phoneIcon.height = 15;
        phoneIcon.x = name.x;
        phoneIcon.y = CGRectGetMaxY(name.frame) + 5;
        [cell addSubview:phoneIcon];
        
        UILabel *phone = [[UILabel alloc]init];
        phone.x = CGRectGetMaxX(phoneIcon.frame) + 15;
        phone.font = [UIFont systemFontOfSize:12];
        phone.textColor = [UIColor lightGrayColor];
        phone.text = @"13911111321";
        [phone sizeToFit];
        phone.y = phoneIcon.y;
        [cell addSubview:phone];
        
        UIImageView *msg = [[UIImageView alloc]init];
        msg.backgroundColor = [UIColor greenColor];
        msg.width = 15;
        msg.height = 15;
        msg.x = CGRectGetMaxX(depart.frame) + 20;
        msg.centerY = cell.centerY;
        [cell addSubview:msg];
        
        UIImageView *person = [[UIImageView alloc]init];
        person.backgroundColor = [UIColor greenColor];
        person.width = 15;
        person.height = 15;
        person.x = CGRectGetMaxX(msg.frame) + 20;
        person.centerY = cell.centerY;
        [cell addSubview:person];
        cell.backgroundColor = ALColor(237, 239, 240);

    }else if(tableView == self.searchTabel){
        cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"searchCell"];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"测试数据%zi",indexPath.row];
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
    if (tableView == self.bookTable) {
        AddressPersonInfo *sec = [[AddressPersonInfo alloc]init];
        sec.titleString = self.titleString;
        [self presentViewController:sec animated:YES completion:nil];
    }else if (tableView == self.searchTabel){
        [self.searchTabel removeFromSuperview];
    }
}

#pragma mark - customDelegate
- (void)SwitchBtnDidClickBtnIndex:(NSUInteger)index
{

}

#pragma mark - property


@end
