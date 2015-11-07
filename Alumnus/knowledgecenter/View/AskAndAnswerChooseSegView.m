//
//  AskAndAnswerChooseSegView.m
//  Alumnus
//
//  Created by ksy on 15/11/7.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import "AskAndAnswerChooseSegView.h"

@implementation AskAndAnswerChooseSegView{
    UIButton *myAskButton;
    UIButton *myConsernButton;
    UIButton *allQuestionButton;
    UIButton *allpyMeAnswerButton;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = VIEW_BG_COLOR_Light;
    UILabel *withMeLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTEDGE/2,0,frame.size.width,frame.size.height/6)];
    withMeLabel.textAlignment = NSTextAlignmentLeft;
    withMeLabel.font = [UIFont boldSystemFontOfSize:15];
    withMeLabel.text = @"与我相关的问题";
    [self addSubview:withMeLabel];
    UIView *firstDownEdge = [[UIView alloc] initWithFrame:CGRectMake(0,withMeLabel.frame.size.height-1,frame.size.width,1)];
    firstDownEdge.backgroundColor = LOGIN_EDGE_COLOR;
    [self addSubview:firstDownEdge];
    myAskButton = [[UIButton alloc] initWithFrame:CGRectMake(LEFTEDGE,withMeLabel.frame.origin.y+withMeLabel.frame.size.height,frame.size.width/2,frame.size.height/6)];
    [myAskButton setTitle:@"我提出的问题" forState:UIControlStateNormal];
    [myAskButton setTitle:@"我提出的问题" forState:UIControlStateSelected];
    myAskButton = [self setButtonStyle:myAskButton];
    myAskButton.selected = YES;
    myAskButton.tag = 1;
    [self addSubview:myAskButton];
    myConsernButton = [[UIButton alloc]initWithFrame:CGRectMake(LEFTEDGE,myAskButton.frame.origin.y+myAskButton.frame.size.height,frame.size.width/2,frame.size.height/6)];
    [myConsernButton setTitle:@"我关注的问题" forState:UIControlStateNormal];
    [myConsernButton setTitle:@"我关注的问题" forState:UIControlStateSelected];
    myConsernButton = [self setButtonStyle:myConsernButton];
    myConsernButton.selected = NO;
    myConsernButton.tag = 2;
   
    [self addSubview:myConsernButton];
    UIView *secondDownEdge = [[UIView alloc] initWithFrame:CGRectMake(0,myConsernButton.frame.origin.y+myConsernButton.frame.size.height-1,frame.size.width,1)];
    secondDownEdge.backgroundColor = LOGIN_EDGE_COLOR;
    [self addSubview:secondDownEdge];
    UILabel *waitMeLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFTEDGE/2,myConsernButton.frame.origin.y+myConsernButton.frame.size.height,frame.size.width,frame.size.height/6)];
    waitMeLabel.font = [UIFont boldSystemFontOfSize:15];
    waitMeLabel.text = @"等您来答复";
    [self addSubview:waitMeLabel];
    UIView *thirdDownEdge = [[UIView alloc] initWithFrame:CGRectMake(0,waitMeLabel.frame.origin.y+waitMeLabel.frame.size.height-1,frame.size.width,1)];
    thirdDownEdge.backgroundColor = LOGIN_EDGE_COLOR;
    [self addSubview:thirdDownEdge];
    
    allQuestionButton = [[UIButton alloc]initWithFrame:CGRectMake(LEFTEDGE,waitMeLabel.frame.origin.y+waitMeLabel.frame.size.height,frame.size.width/2,frame.size.height/6)];
    [allQuestionButton setTitle:@"全部问题" forState:UIControlStateNormal];
    [allQuestionButton setTitle:@"全部问题" forState:UIControlStateSelected];
    allQuestionButton = [self setButtonStyle:allQuestionButton];
    allQuestionButton.selected = NO;
    allQuestionButton.tag = 3;

    [self addSubview:allQuestionButton];
    
    allpyMeAnswerButton = [[UIButton alloc] initWithFrame:CGRectMake(LEFTEDGE,allQuestionButton.frame.origin.y+allQuestionButton.frame.size.height,frame.size.width/2,frame.size.height/6)];
    [allpyMeAnswerButton setTitle:@"请您来回复的问题" forState:UIControlStateNormal];
    [allpyMeAnswerButton setTitle:@"请您来回复的问题" forState:UIControlStateSelected];
    allpyMeAnswerButton = [self setButtonStyle:allpyMeAnswerButton];
    allpyMeAnswerButton.selected = NO;
    allpyMeAnswerButton.tag = 4;
    [self addSubview:allpyMeAnswerButton];
    
    UIView *fourEdge = [[UIView alloc] initWithFrame:CGRectMake(0,allpyMeAnswerButton.frame.origin.y+allpyMeAnswerButton.frame.size.height-1,frame.size.width, 1)];
    fourEdge.backgroundColor = LOGIN_EDGE_COLOR;
    [self addSubview:fourEdge];
    return self;
}
-(void)didClickButton:(UIButton *)btn{
    if (btn == myAskButton) {
        myAskButton.selected = YES;
        myConsernButton.selected = NO;
        allpyMeAnswerButton.selected = NO;
        allQuestionButton.selected = NO;
    }
    if (btn == myConsernButton) {
        myAskButton.selected = NO;
        myConsernButton.selected = YES;
        allpyMeAnswerButton.selected = NO;
        allQuestionButton.selected = NO;
    }
    if (btn == allQuestionButton) {
        myAskButton.selected = NO;
        myConsernButton.selected = NO;
        allpyMeAnswerButton.selected = NO;
        allQuestionButton.selected = YES;
    }
    if (btn == allpyMeAnswerButton) {
        myAskButton.selected = NO;
        myConsernButton.selected = NO;
        allpyMeAnswerButton.selected = YES;
        allQuestionButton.selected = NO;
    }
    [_delegate chooseIndex:btn.tag];
}
-(UIButton *)setButtonStyle:(UIButton *)btn{
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:DOCK_SELECT_COLOR forState:UIControlStateSelected];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
-(void)changeToIndex{
    myAskButton.selected = YES;
    myConsernButton.selected = NO;
    allpyMeAnswerButton.selected = NO;
    allQuestionButton.selected = NO;
    [_delegate chooseIndex:1];
}
@end
