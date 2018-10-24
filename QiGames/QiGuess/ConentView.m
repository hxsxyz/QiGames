//
//  ConentView.m
//  QiGuess
//
//  Created by wangdacheng on 2018/10/23.
//  Copyright © 2018年 QiShare. All rights reserved.
//

#import "ConentView.h"

#define ButtonWidth     120
#define ButtonHeight    120
#define Margin          15

@interface ConentView()

@property (nonatomic, strong) UIButton *resetBtn;
@property (nonatomic, strong) UIButton *startBtn;
@property (nonatomic, strong) UIButton *successBtn;
@property (nonatomic, strong) UIButton *failBtn;

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation ConentView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        _resetBtn = [self createCustomButton:@"重置" tag:ButtonTag_Reset];
        [self addSubview:_resetBtn];
        
        _startBtn = [self createCustomButton:@"开始" tag:ButtonTag_Start];
        [self addSubview:_startBtn];
        
        _successBtn = [self createCustomButton:@"正确" tag:ButtonTag_Success];
        [self addSubview:_successBtn];
        _successBtn.enabled = NO;
        
        _failBtn = [self createCustomButton:@"错误" tag:ButtonTag_Fail];
        [self addSubview:_failBtn];
        _failBtn.enabled = NO;
        
        _contentLabel = [self createCustomLabel];
        [_contentLabel setFont:[UIFont systemFontOfSize:120]];
        [_contentLabel setText:@"***"];
        [self addSubview:_contentLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize size = self.frame.size;
    _resetBtn.center = CGPointMake(Margin + ButtonWidth/2, size.height/4);
    _startBtn.center = CGPointMake(Margin + ButtonWidth/2, size.height*3/4);
    _successBtn.center = CGPointMake(size.width - Margin - ButtonWidth/2, size.height/4);
    _failBtn.center = CGPointMake(size.width - Margin - ButtonWidth/2, size.height*3/4);
    _contentLabel.frame = CGRectMake(ButtonWidth + Margin*2, Margin, size.width-ButtonWidth*2-Margin*4, size.height-Margin*2);
}

- (UIButton *)createCustomButton:(NSString *)title tag:(NSInteger)tag {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, ButtonWidth, ButtonHeight);
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button.titleLabel setFont:[UIFont systemFontOfSize:45]];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTag:tag];
    [button.layer setCornerRadius:5.0];
    [button.layer setMasksToBounds:YES];
    
    return button;
}

- (UILabel *)createCustomLabel {
    
    UILabel *label = [[UILabel alloc] init];
    [label setTextAlignment:NSTextAlignmentCenter];
    label.numberOfLines = 0;
    [label.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [label.layer setBorderWidth:0.5];
    [label.layer setCornerRadius:5.0];
    [label.layer setMasksToBounds:YES];
    
    return label;
}

- (void)updateContentWithText:(NSString *)text {
    
    [_contentLabel setText:text];
}

#pragma mark - Actions
- (void)buttonClicked:(UIButton *)button {
    
    if (_delegate && [_delegate respondsToSelector:@selector(conentView:clickedButton:)]) {
        [_delegate conentView:self clickedButton:button];
    }
    
    if (button.tag == ButtonTag_Reset) {
        _successBtn.enabled = NO;
        _failBtn.enabled = NO;
    }
    if (button.tag == ButtonTag_Start) {
        _successBtn.enabled = YES;
        _failBtn.enabled = YES;
    }
}


@end
