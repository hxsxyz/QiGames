//
//  CountView.m
//  QiGuess
//
//  Created by wangdacheng on 2018/10/24.
//  Copyright © 2018年 QiShare. All rights reserved.
//

#import "CountView.h"

#define Margin      15
#define FontSize    40

@interface CountView()

@property (nonatomic, strong) UILabel *totalTimeTitle;
@property (nonatomic, strong) UILabel *countdownTitle;
@property (nonatomic, strong) UILabel *countdownLabel;
@property (nonatomic, strong) UILabel *successAmountTitle;
@property (nonatomic, strong) UILabel *successAmountLabel;

@end

@implementation CountView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        _totalTimeTitle = [self createCustomLabel];
        [_totalTimeTitle setText:[NSString stringWithFormat:@"总时间: %d s", TotalTime]];
        [_totalTimeTitle sizeToFit];
        [self addSubview:_totalTimeTitle];
        
        _countdownTitle = [self createCustomLabel];
        [_countdownTitle setText:@"倒计时: "];
        [_countdownTitle sizeToFit];
        [self addSubview:_countdownTitle];
        _countdownLabel = [self createCustomLabel];
        [_countdownLabel setTextColor:[UIColor redColor]];
        [_countdownLabel setText:@"0"];
        [_countdownLabel sizeToFit];
        [self addSubview:_countdownLabel];
        
        _successAmountTitle = [self createCustomLabel];
        [_successAmountTitle setText:@"正确数: "];
        [_successAmountTitle sizeToFit];
        [self addSubview:_successAmountTitle];
        _successAmountLabel = [self createCustomLabel];
        [_successAmountLabel setTextColor:[UIColor redColor]];
        [_successAmountLabel setText:@"0"];
        [_successAmountLabel sizeToFit];
        [self addSubview:_successAmountLabel];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGSize size = self.frame.size;
    _totalTimeTitle.center = CGPointMake(Margin + CGRectGetWidth(_totalTimeTitle.frame)/2, size.height/2);
    _countdownTitle.center = CGPointMake(CGRectGetMaxX(_totalTimeTitle.frame) + Margin*2 + CGRectGetWidth(_countdownTitle.frame)/2, size.height/2);
    _countdownLabel.center = CGPointMake(CGRectGetMaxX(_countdownTitle.frame) + Margin + CGRectGetWidth(_countdownLabel.frame)/2, size.height/2);
    _successAmountTitle.center = CGPointMake(CGRectGetMaxX(_countdownLabel.frame) + Margin*2 + CGRectGetWidth(_successAmountTitle.frame)/2, size.height/2);
    _successAmountLabel.center = CGPointMake(CGRectGetMaxX(_successAmountTitle.frame) + Margin + CGRectGetWidth(_successAmountLabel.frame)/2 , size.height/2);
}

- (UILabel *)createCustomLabel {
    
    UILabel *label = [[UILabel alloc] init];
    [label setFont:[UIFont systemFontOfSize:FontSize]];
    [label setTextColor:[UIColor grayColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    return label;
}

- (void)updateContent{
    
    [_countdownLabel setText:[NSString stringWithFormat:@"%ld", (long)_countDown]];
    [_countdownLabel sizeToFit];
    [_successAmountLabel setText:[NSString stringWithFormat:@"%ld", (long)_successAmount]];
    [_successAmountLabel sizeToFit];
    
    [self setNeedsLayout];
}

@end
