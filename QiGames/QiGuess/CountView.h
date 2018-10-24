//
//  CountView.h
//  QiGuess
//
//  Created by wangdacheng on 2018/10/24.
//  Copyright © 2018年 QiShare. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TotalTime           180

NS_ASSUME_NONNULL_BEGIN

@interface CountView : UIView

@property (nonatomic, assign) NSInteger countDown;
@property (nonatomic, assign) NSInteger successAmount;

- (void)updateContent;

@end

NS_ASSUME_NONNULL_END
