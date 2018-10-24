//
//  Tools.h
//  OCRTest
//
//  Created by leeson on 2018/4/20.
//  Copyright © 2018年 李斯芃 ---> 512523045@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject

//MARK: - --- 中文数字转阿拉伯数字（方法一）
+ (NSInteger )chineseNumbersReturnArabicNumerals:(NSString *)chnStr;

///MARK: - --- 文字处理
/*
+ (NSString *)wordsDeal:(NSString *)str;
*/

///MAKR: - --- 文字提取匹配
+ (NSString *)textMatching:(NSString *)str;

//MARK: - --- 中文数字转阿拉伯数字（方法二）
+(NSInteger)elseFun:(NSString *)chnStr;

@end
