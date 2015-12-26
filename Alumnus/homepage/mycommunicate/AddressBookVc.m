//
//  AddressBookVc.m
//  Alumnus
//
//  Created by 王智刚 on 15/10/18.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "AddressBookVc.h"
#import "AddressSecVc.h"
#import "ALNetWorkApi.h"
#import "MBProgressHUD+MJ.h"
#import "AddressBookModel.h"

@interface AddressBookVc ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UIView *top;
@property (nonatomic, strong)UISearchBar *searchBar;
@property (nonatomic, strong)UITableView *bookTable;
@property (nonatomic, strong)NSMutableArray *dataList;
@property (nonatomic, strong)UITableView *searchTabel;
@property (nonatomic, strong)UIView *coverView;

@end

@implementation AddressBookVc
#pragma lazy

- (UITableView *)searchTabel
{
    if (!_searchTabel) {
        _searchTabel = [[UITableView alloc]init];
        _searchTabel.delegate = self;
        _searchTabel.dataSource = self;
        _searchTabel.tableFooterView = [[UIView alloc]init];
        _searchTabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
        _searchTabel.hidden = YES;
        [self.view addSubview:_searchTabel];
        
    }
    
    return _searchTabel;
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

#pragma mark - lifeCycle

- (instancetype)initWithTitle:(NSString *)title
{
    AddressBookVc *vc = [self init];
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
    [params setValue:@"  AND ODEPT_CODE = DEPT_CODE" forKey:@"_WHERE_"];
    [MBProgressHUD showMessage:@"正在加载"];
    [ALNetWorkApi mobileDeptWithDict:params withResponse:^(BOOL success, id responseData, NSString *message) {
        self.dataList = [NSMutableArray array];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dict in (NSArray *)responseData) {
            AddressBookModel *model = [AddressBookModel getEntityFromDic:dict];
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
    
    self.bookTable.frame = CGRectMake(0, CGRectGetMaxY(self.top.frame), SIZEWIDTH, self.view.height - CGRectGetMaxY(self.top.frame));
    
    self.searchTabel.frame = CGRectMake(self.bookTable.x, self.bookTable.y, SIZEWIDTH, self.bookTable.height);
}

#pragma mark - public api

#pragma mark - appleDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchTabel) {
        return 3;
    }else if (tableView == self.bookTable){
        return self.dataList.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (tableView == self.bookTable) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"addressBookCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addressBookCell"];
        }
        AddressBookModel *model = self.dataList[indexPath.row];
        cell.textLabel.text = model.DEPT_NAME;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UIView *bc = [[UIView alloc]initWithFrame:cell.frame];
        bc.backgroundColor = [UIColor orangeColor];
        cell.selectedBackgroundView = bc;
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
        AddressSecVc *sec = [[AddressSecVc alloc]init];
        sec.titleString = self.titleString;
        [self presentViewController:sec animated:YES completion:nil];
    }else if (tableView == self.searchTabel){
        [self.searchTabel removeFromSuperview];
    }
}

#pragma mark - customDelegate

#pragma mark - property


@end
