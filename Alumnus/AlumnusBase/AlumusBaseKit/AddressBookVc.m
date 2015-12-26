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

@interface AddressBookVc ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UIView *top;
@property (nonatomic, strong)UISearchBar *searchBar;
@property (nonatomic, strong)UITableView *bookTable;
@property (nonatomic, strong)NSArray *dataList;
@property (nonatomic, strong)UITableView *searchTabel;
@property (nonatomic, strong)UIView *coverView;

@end

@implementation AddressBookVc
#pragma lazy
- (NSArray *)dataList
{
    return @[
             @"总裁室",
             @"办公室|董事会办公室",
             @"战略发展部",
             @"人力资源部",
             @"财务会计部",
             @"投资管理部",
             ];
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

- (UITableView *)bookTable
{
    if (!_bookTable) {
        _bookTable = [[UITableView alloc]init];
        _bookTable.delegate = self;
        _bookTable.dataSource = self;
        _bookTable.tableFooterView = [[UIView alloc]init];
        _bookTable.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self loadData];
            NSLog(@"刷新数据");
        }];
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
    [params setValue:@" AND DEPT_PCODE = '3rin6giCR9vUIv6kHIO3ex' and DEPT_CODE != ODEPT_CODE" forKey:@"_WHERE_"];

    [ALNetWorkApi mobileDeptWithDict:params withResponse:^(BOOL success, id responseData, NSString *message) {
       
        [self.bookTable reloadData];
        [self.bookTable.header endRefreshing];
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
    }
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (tableView == self.bookTable) {
         cell = [tableView dequeueReusableCellWithIdentifier:@"addressBookCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addressBookCell"];
        }
        cell.textLabel.text = self.dataList[indexPath.row];
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
