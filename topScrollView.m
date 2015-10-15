//
//  topScrollView.m
//  Alumnus
//
//  Created by 王智刚 on 15/10/15.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "topScrollView.h"
#import "topScrollBtn.h"

@interface topScrollView()
@property (nonatomic, strong)UIScrollView *topView;
@property (nonatomic, strong)UIView *sliderView;
@property (nonatomic, strong)NSArray *titles;
@end

@implementation topScrollView

#pragma mark - lazy

#pragma mark - lifeCycle

- (instancetype)initWithTitlesDict:(NSDictionary *)dict
{
    topScrollView *view = [[topScrollView alloc]initWithFrame:CGRectMake(0, 64,SIZEWIDTH , SIZEHEIGHT - 64)];
    self.topView.backgroundColor = [UIColor colorWithRed:234 green:234 blue:234 alpha:1];
    [view addSubview:self.topView];
    if (dict.allKeys.count > 0 ) {
        _titleArray = dict.allKeys;
        _titleVcArray = dict.allValues;
//        [self setup];
    }else{
        ALLog(@"titles或对应的视图数组不存在");
    }
    
    return view;
}

- (instancetype)initWithTitles:(NSArray *)titles
{
    topScrollView *view = [[topScrollView alloc]initWithFrame:CGRectMake(0, 64,SIZEWIDTH , SIZEHEIGHT - 64)];

    if (titles.count > 0 ) {
        self.titleArray = titles;
        self.titles = titles;
        [self setup];
    }else{
        ALLog(@"titles不存在");
    }
    
    return view;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
}

#pragma mark - private api
//初始化
- (void)setup
{
    self.topView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SIZEWIDTH, 44)];
    self.topView.backgroundColor = [UIColor colorWithRed:234 green:234 blue:234 alpha:1];
    self.topView.backgroundColor = [UIColor redColor];
    self.topView.bounces = NO;
    self.topView.alwaysBounceVertical = NO;
    self.topView.contentSize = CGSizeMake(SIZEWIDTH, 44);
    [self addSubview:self.topView];
    
    if (self.titleArray.count) {
        CGFloat btnWidth;
        if (self.titleArray.count < 4) {
            btnWidth = SIZEWIDTH/self.titleArray.count;
        }else{
            btnWidth = SIZEWIDTH * 0.25;
        }
        
            self.topView.contentSize = CGSizeMake(self.titleArray.count * SIZEWIDTH * 0.25, 44);
            
            UIView *bottomSlider = [[UIView alloc]initWithFrame:CGRectMake(10, self.topView.height - 1, btnWidth - 20, 1)];
            
            bottomSlider.backgroundColor = [UIColor orangeColor];
            [self.topView addSubview:bottomSlider];
            self.sliderView = bottomSlider;
        
        for (id title in self.titleArray) {
            if ([title isKindOfClass:[NSString class]]) {
                topScrollBtn *titleBtn = [topScrollBtn buttonWithTitle:title];
                titleBtn.tag = [self.titleArray indexOfObject:title];
                titleBtn.width = btnWidth;
                titleBtn.x = titleBtn.tag * titleBtn.width;
                [titleBtn setBackgroundColor:[UIColor greenColor]];
                [titleBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
                [self.topView addSubview:titleBtn];

            }
        }
        
    }else{
        ALLog(@"titles不存在");
    }
    
}

//获取数据
- (void)loadData
{
    
}

//刷新视图
- (void)resetSubViews
{
    
}

#pragma mark - action
- (void)btnClick:(UIButton *)btn
{
    [UIView animateWithDuration:1.0 animations:^{
        self.sliderView.centerX = btn.centerX;
    }];
    if ([self.delegate respondsToSelector:@selector(topScrollViewDidClickButtonIndex:)]) {
        [self.delegate topScrollViewDidClickButtonIndex:btn.tag];
    }
}

#pragma mark - public api

#pragma mark - property
- (void)setContentVc:(UIViewController *)contentVc
{
    _contentVc = contentVc;
    self.content = contentVc.view;
}

- (void)setContent:(UIView *)content
{
    _content = content;
    content.x = 0;
    content.y = 64 + self.topView.height;
    content.width = SIZEWIDTH;
    content.height = SIZEHEIGHT - content.y;
}

@end
