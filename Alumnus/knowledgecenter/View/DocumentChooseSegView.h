//
//  DocumentChooseSegView.h
//  Alumnus
//
//  Created by ksy on 15/11/7.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DocumentChooseSegViewDelegate <NSObject>

@optional
-(void)chooseDocumentIndex:(NSInteger)index;
@end
@interface DocumentChooseSegView : UIView

@property(weak,nonatomic)id<DocumentChooseSegViewDelegate>delegate;
-(void)changeToIndex;
@end
