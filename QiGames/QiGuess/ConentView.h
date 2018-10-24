//
//  ConentView.h
//  QiGuess
//
//  Created by wangdacheng on 2018/10/23.
//  Copyright © 2018年 QiShare. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ButtonTag) {
    // 重置
    ButtonTag_Reset = 100,
    // 开始
    ButtonTag_Start,
    // 成功
    ButtonTag_Success,
    // 失败
    ButtonTag_Fail,
};

@class ConentView;

@protocol ConentViewDelegate <NSObject>

- (void)conentView:(ConentView *)contentView clickedButton:(UIButton *)button;

@end

NS_ASSUME_NONNULL_BEGIN



@interface ConentView : UIView

@property (nonatomic, weak) id<ConentViewDelegate> delegate;

- (void)updateContentWithText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
