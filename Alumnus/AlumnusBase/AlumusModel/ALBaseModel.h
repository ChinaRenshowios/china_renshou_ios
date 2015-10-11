//
//  ALBaseModel.h
//  Alumnus
//
//  Created by 王智刚 on 15/9/17.
//  Copyright © 2015年 wiipu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+MJProperty.h"

@interface ALBaseModel : NSObject

/**
 *  字典转模型(可嵌套模型),嵌套数组模型的时候需实现newObjectClassInArray;
 */
+ (instancetype)getEntityFromDic:(NSDictionary *)dic;
///**
// *  设置模型中嵌套数组中的模型
// *
// *  @param objectClassInArray 数组中的模型类型
// */
//+ (void)newObjectClassInArray:(MJObjectClassInArray)objectClassInArray;
//
///**
// *  转换过程替换key值
// *
// *  @param replaceKeyFromPropertyName 需要替换的键值对
// */
//+ (void)newReplaceKeyFromPropertyName:(MJReplacedKeyFromPropertyName)replaceKeyFromPropertyName;
//
///**
// *  字典转模型,嵌套数组模型newObjectClassInArray;
// */
//+ (instancetype)newGetEntityFromDic:(NSDictionary *)dic WithObjectClassInArray:(MJObjectClassInArray)objectClassInArray;
//
///**
// *  字典转模型,转换过程替换key值;
// */
//+ (instancetype)newGetEntityFromDic:(NSDictionary *)dic WithReplaceKeyFromPropertyName:(MJReplacedKeyFromPropertyName)replaceKeyFromPropertyName;


/**
 *  模型转字典
 */
- (NSDictionary *)getDicFromEntity;


@end
