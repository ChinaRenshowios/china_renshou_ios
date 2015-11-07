//
//  AskAndAnswerChooseSegView.h
//  Alumnus
//
//  Created by ksy on 15/11/7.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AskAndAnswerChooseSegViewDelegate <NSObject>

@optional
-(void)chooseIndex:(NSInteger)index;

@end
@interface AskAndAnswerChooseSegView : UIView
@property (weak,nonatomic)id<AskAndAnswerChooseSegViewDelegate> delegate;
-(void)changeToIndex;
@end
