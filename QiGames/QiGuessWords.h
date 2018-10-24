//
//  QiGuessWords.h
//  QiGames
//
//  Created by huangxianshuai on 2018/10/24.
//  Copyright © 2018年 360.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, QiGuessWordsType) {
    QiGuessWordsTypePrimary,
    QiGuessWordsTypeMiddle,
    QiGuessWordsTypeSenior,
    QiGuessWordsTypeComplex,
    QiGuessWordsTypeCustom
};

NS_ASSUME_NONNULL_BEGIN

@interface QiGuessWords : NSObject

@property (nonatomic, copy) NSString *randomWord;

- (NSArray<NSString *> *)randomWordsWithType:(QiGuessWordsType)type count:(NSUInteger)count;

@end

NS_ASSUME_NONNULL_END
