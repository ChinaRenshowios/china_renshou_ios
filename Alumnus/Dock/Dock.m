//
//  Dock.m
//  AntiquepPie
//
//  Created by ksy on 15/5/6.
//  Copyright (c) 2015年 ksy. All rights reserved.
//


#import "Dock.h"
#import "ZCImageButton.h"

#define DockSize SIZEWIDTH/15   //dock处图标size

@interface Dock()
{
    ZCImageButton *_selectedItem;
}
@end

@implementation Dock

#pragma mark 添加一个选项卡

- (void)addItemWithIcon:(NSString *)icon selectedIcon:(NSString *)selected title:(NSString *)title itemCategory:(NSString *)itemCategory
{
    self.backgroundColor = DOCK_BG_COLOR;
    
    NSInteger count = self.subviews.count;
    CGFloat label_height = self.frame.size.height;// 高度
    CGFloat width = self.frame.size.width / (count+1); // 宽度
    
    for (int i = 0; i<count; i++) {
        
        ZCImageButton *dockItem = self.subviews[i];
        dockItem.tag = i; // 绑定标记
        dockItem.frame = CGRectMake(width * i, 0, width, label_height);
        dockItem.imageView_normal.frame = CGRectMake(width/10,(label_height-DockSize)/2,DockSize,DockSize);
        dockItem.imageView_select.frame = CGRectMake(width/10,(label_height-DockSize)/2,DockSize,DockSize);
        if (i == 1) {
            dockItem.imageView_normal.frame = CGRectMake(width/10,(label_height-DockSize)/2+2,DockSize,DockSize);
            dockItem.imageView_select.frame = CGRectMake(width/10,(label_height-DockSize)/2+2,DockSize,DockSize);
        }
        if (i == 2) {
            dockItem.imageView_normal.frame = CGRectMake(width/10,(label_height-DockSize)/2+5,DockSize,DockSize);
            dockItem.imageView_select.frame = CGRectMake(width/10,(label_height-DockSize)/2+5,DockSize,DockSize);
        }
        dockItem.imageButton.frame = CGRectMake(0, 0, width, label_height);
    }
    
    // 1.创建item
    ZCImageButton *item = [[ZCImageButton alloc] initWithFrame:CGRectMake(width*count, 0, width, label_height)];
    item.imageView_normal.frame = CGRectMake(width/10,(label_height-DockSize)/2,DockSize,DockSize);
    item.imageView_select.frame = CGRectMake(width/10,(label_height-DockSize)/2,DockSize,DockSize);
    item.imageButton.frame = CGRectMake(0, 0, width, label_height);
    item.imageButton.titleLabel.font = [UIFont boldSystemFontOfSize:SIZEHEIGHT>650?13:11];
    item.imageButton.titleEdgeInsets = UIEdgeInsetsMake(0,item.imageView_normal.frame.size.width,0,0);
    [item.imageButton setTitle:title forState:UIControlStateNormal];
    item.imageView_normal.image = [UIImage imageNamed:icon];
    item.imageView_select.image = [UIImage imageNamed:selected];
    
    if (count == 0) {  //默认选择第一个
        _selectedItem = item;
        [item changeSelected:YES];
    }
    
    // 监听item的点击
    [item.imageButton addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
    item.imageButton.tag = count;
    // 2.添加item
    [self addSubview:item];

}



#pragma mark 监听item点击
- (void)itemClick:(id) sender
{
    // 0.通知代理
    if ([_delegate respondsToSelector:@selector(dock:itemSelectedFrom:to:)]) {
        [_delegate dock:self itemSelectedFrom:(int)_selectedItem.tag to:(int)[sender tag]];
    }
    
    // 1.取消选中当前选中的item
    [_selectedItem changeSelected:NO];
    
    // 2.选中点击的item
    ZCImageButton *item = self.subviews[[sender tag]];
    [item changeSelected:YES];
    
    // 3.赋值
    _selectedItem = item;
}
@end
