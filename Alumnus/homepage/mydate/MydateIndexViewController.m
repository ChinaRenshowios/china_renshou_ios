//
//  MydateIndexViewController.m
//  Alumnus
//
//  Created by ksy on 15/9/17.
//  Copyright (c) 2015年 wiipu. All rights reserved.
//

#import "MydateIndexViewController.h"
#import "CalendarView.h"
#import "DataIndexCollectionViewController.h"
#import "AddDataViewController.h"

@interface MydateIndexViewController ()<CalendarDelegate,CalendarDataSource>{
    UIScrollView *mainView;
    UIButton *myDataButton;
    UIButton *shareDataButton;
    DataIndexCollectionViewController *collectionVC;
}

@property (nonatomic, strong) CalendarView * customCalendarView;
@property (nonatomic, strong) NSCalendar * gregorian;
@property (nonatomic, assign) NSInteger currentYear;
@end

@implementation MydateIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark 右上添加按钮
    UIView *addView = [[UIView alloc] initWithFrame:CGRectMake(SIZEWIDTH-50,20,40,40)];
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [addButton setTitle:@"+" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:30];
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addView addSubview:addButton];
    [addButton addTarget:self action:@selector(didClickAddData) forControlEvents:UIControlEventTouchUpInside];
    [self.nav addSubview:addView];
#pragma mark 定义滑动页面
    mainView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0, SIZEWIDTH, SIZEHEIGHT)];
    [self.view addSubview:mainView];
    [self.view bringSubviewToFront:self.nav];
#pragma mark 日历
    _gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    _customCalendarView                             = [[CalendarView alloc]initWithFrame:CGRectMake(0,64,SIZEWIDTH, 360)];
    _customCalendarView.delegate                    = self;
    _customCalendarView.datasource                  = self;
    _customCalendarView.calendarDate                = [NSDate date];
    _customCalendarView.allowsChangeMonthByButtons  = YES;
    _customCalendarView.borderColor                 = DOCK_BG_COLOR;
    _customCalendarView.borderWidth                 = 2;
    _customCalendarView.monthAndDayTextColor        = DOCK_BG_COLOR;
    _customCalendarView.dayTxtColorWithData         = DOCK_BG_COLOR;
    _customCalendarView.dayBgColorSelected          = DOCK_SELECT_COLOR;
    _customCalendarView.dayTxtColorWithoutData      = [UIColor blackColor];
    dispatch_async(dispatch_get_main_queue(), ^{
        [mainView addSubview:_customCalendarView];
        _customCalendarView.center = CGPointMake(self.view.center.x, _customCalendarView.center.y);
    });
    
    NSDateComponents * yearComponent = [_gregorian components:NSCalendarUnitYear fromDate:[NSDate date]];
    _currentYear = yearComponent.year;
    
#pragma mark 选项卡
    UIView *chooseView = [[UIView alloc] initWithFrame:CGRectMake(0,_customCalendarView.frame.origin.y+_customCalendarView.frame.size.height,SIZEWIDTH,50)];
    chooseView.backgroundColor = VIEW_BG_COLOR_Light;
    //我的日程
    myDataButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0, SIZEWIDTH/2, chooseView.frame.size.height)];
    [myDataButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [myDataButton setTitle:@"本人日程" forState:UIControlStateNormal];
    [myDataButton addTarget:self action:@selector(didClickMyData) forControlEvents:UIControlEventTouchUpInside];
    //[myDataButton setBackgroundColor:DOCK_SELECT_COLOR];
    [chooseView addSubview:myDataButton];
    
    //共享日程
    shareDataButton = [[UIButton alloc] initWithFrame:CGRectMake(SIZEWIDTH/2,0,SIZEWIDTH/2,chooseView.frame.size.height)];
    [shareDataButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shareDataButton setTitle:@"共享日程" forState:UIControlStateNormal];
    [shareDataButton addTarget:self action:@selector(didClickShareData) forControlEvents:UIControlEventTouchUpInside];
    [chooseView addSubview:shareDataButton];
    [mainView addSubview:chooseView];
    ////  展示数据
    _datasource = [[NSMutableArray alloc] init];
    [_datasource addObject:@"da"];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.itemSize = CGSizeMake(SIZEWIDTH,50);
    CGFloat paddingY = 1;
    CGFloat paddingX = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
    flowLayout.minimumLineSpacing = paddingY;
    collectionVC = [[DataIndexCollectionViewController alloc] initWithCollectionViewLayout:flowLayout source:_datasource];
    collectionVC.type = @"1";
    collectionVC.collectionView.scrollEnabled = NO;
    collectionVC.collectionView.frame = CGRectMake(0,chooseView.frame.origin.y+chooseView.frame.size.height,SIZEWIDTH,collectionVC.collectionView.frame.size.height);
    collectionVC.collectionView.backgroundColor = VIEW_BG_COLOR_Light;
    [self addChildViewController:collectionVC];
    [mainView addSubview:collectionVC.collectionView];
    
    

    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)didClickAddData{
    AddDataViewController *vc = [[AddDataViewController alloc] init];
    vc.titleString = @"添加日程";
    [self presentViewController:vc animated:YES completion:nil];
}
-(void)didClickMyData{
    [myDataButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [shareDataButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}
-(void)didClickShareData{
    [myDataButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shareDataButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
}
#pragma mark - Gesture recognizer

-(void)swipeleft:(id)sender
{
    [_customCalendarView showNextMonth];
}

-(void)swiperight:(id)sender
{
    [_customCalendarView showPreviousMonth];
}

#pragma mark - CalendarDelegate protocol conformance

-(void)dayChangedToDate:(NSDate *)selectedDate
{
    NSLog(@"dayChangedToDate %@(GMT)",selectedDate);
}

#pragma mark - CalendarDataSource protocol conformance

-(BOOL)isDataForDate:(NSDate *)date
{
    if ([date compare:[NSDate date]] == NSOrderedAscending)
        return YES;
    return NO;
}

-(BOOL)canSwipeToDate:(NSDate *)date
{
    NSDateComponents * yearComponent = [_gregorian components:NSYearCalendarUnit fromDate:date];
    return (yearComponent.year == _currentYear || yearComponent.year == _currentYear+1);
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
