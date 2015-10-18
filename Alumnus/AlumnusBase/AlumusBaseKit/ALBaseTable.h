//
//  ALBaseTable.h
//  Alumnus
//
//  Created by 王智刚 on 15/10/18.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALBaseTable : UITableView

///**
// *  根据数据初始化Table
// *
// *  @param dataList 数据来源
// */
//- (instancetype)tableWithData:(NSArray *)dataList;

/**
 *  数据
 */
@property (nonatomic, strong)NSArray *dataList;
@end
