//
//  DocumentChooseSegView.m
//  Alumnus
//
//  Created by ksy on 15/11/7.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "DocumentChooseSegView.h"

@implementation DocumentChooseSegView{
    UIButton *myUploadButton;
    UIButton *popularButton;
    UIButton *newestButton;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = LOGIN_EDGE_COLOR;
        myUploadButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0,frame.size.width/3,frame.size.height)];
        myUploadButton = [self setButtonSytle:myUploadButton];
        [myUploadButton setBackgroundColor:[UIColor whiteColor]];
        [myUploadButton setTitle:@"我上传的文档" forState:UIControlStateNormal];
        [myUploadButton setTitle:@"我上传的文档" forState:UIControlStateSelected];
        myUploadButton.selected = YES;
        myUploadButton.tag = 1;
        [myUploadButton addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:myUploadButton];
        popularButton = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width/3+1,0,frame.size.width/3,frame.size.height)];
        popularButton = [self setButtonSytle:popularButton];
        [popularButton setTitle:@"热门文档" forState:UIControlStateNormal];
        [popularButton setTitle:@"热门文档" forState:UIControlStateSelected];
        popularButton.tag = 2;
        [popularButton addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:popularButton];
        
        newestButton = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width*2/3+2,0,frame.size.width/3,frame.size.height)];
        newestButton = [self setButtonSytle:newestButton];
        [newestButton setTitle:@"最新文档" forState:UIControlStateNormal];
        [newestButton setTitle:@"最新文档" forState:UIControlStateSelected];
        newestButton.tag = 3;
        [newestButton addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:newestButton];
         UIView *upEdgeView = [[UIView alloc] initWithFrame:CGRectMake(0,0,frame.size.width,1)];
        upEdgeView.backgroundColor = LOGIN_EDGE_COLOR;
        [self addSubview:upEdgeView];
        UIView *downEdgeView = [[UIView alloc] initWithFrame:CGRectMake(0,frame.size.height-1,frame.size.width,1)];
        downEdgeView.backgroundColor = LOGIN_EDGE_COLOR;
        [self addSubview:downEdgeView];
    }
    return self;
}
-(UIButton *)setButtonSytle:(UIButton *)btn{
    btn.backgroundColor = VIEW_BG_COLOR_Light;
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    return btn;
}
-(void)didClickButton:(UIButton *)btn{
    if(btn == myUploadButton){
        myUploadButton.backgroundColor = [UIColor whiteColor];
        popularButton.backgroundColor = VIEW_BG_COLOR_Light;
        newestButton.backgroundColor = VIEW_BG_COLOR_Light;
        myUploadButton.selected = YES;
        popularButton.selected = NO;
        newestButton.selected = NO;
    }
    if(btn == popularButton){
        popularButton.backgroundColor = [UIColor whiteColor];
        myUploadButton.backgroundColor = VIEW_BG_COLOR_Light;
        newestButton.backgroundColor = VIEW_BG_COLOR_Light;
        myUploadButton.selected = NO;
        popularButton.selected = YES;
        newestButton.selected = NO;
    }
    if(btn == newestButton){
        myUploadButton.backgroundColor = VIEW_BG_COLOR_Light;
        popularButton.backgroundColor = VIEW_BG_COLOR_Light;
        newestButton.backgroundColor = [UIColor whiteColor];
        myUploadButton.selected = NO;
        popularButton.selected = NO;
        newestButton.selected = YES;
    }
    [_delegate chooseDocumentIndex:btn.tag];
}
-(void)changeToIndex{
    myUploadButton.backgroundColor = [UIColor whiteColor];
    popularButton.backgroundColor = VIEW_BG_COLOR_Light;
    newestButton.backgroundColor = VIEW_BG_COLOR_Light;
    myUploadButton.selected = YES;
    popularButton.selected = NO;
    newestButton.selected = NO;
    [_delegate chooseDocumentIndex:1];
}
@end
