//
//  QiGuessViewController.m
//  QiGames
//
//  Created by huangxianshuai on 2018/10/24.
//  Copyright © 2018年 360.cn. All rights reserved.
//

#import "QiGuessViewController.h"
#import "QiGuessWords.h"
#import "ConentView.h"
#import "CountView.h"

#define Margin  15
#define Space   100
#define CountViewHeight     130

@interface QiGuessViewController () <ConentViewDelegate>

// 内容视图
@property (nonatomic, strong) ConentView *contentView;
// 计时统计视图
@property (nonatomic, strong) CountView *countView;
// 随机词库
@property (nonatomic, strong) QiGuessWords *guessWords;

@property (nonatomic, strong) NSTimer *countDownTimer;

@end

@implementation QiGuessViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setTitle:@"👻我比划...你来猜🐶"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _guessWords = [[QiGuessWords alloc] init];
    [self initViews];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    [self pauseTimer];
}

- (void)initViews {
    
    CGSize size = self.view.frame.size;
    _countView = [[CountView alloc] initWithFrame:CGRectMake(Margin, Margin, size.width - Margin*2, CountViewHeight)];
    [_countView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [_countView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_countView.layer setBorderWidth:1.0];
    [_countView.layer setCornerRadius:5.0];
    [_countView.layer setMasksToBounds:YES];
    [self.view addSubview:_countView];
    
    _contentView = [[ConentView alloc] initWithFrame:CGRectMake(Margin, Margin*2 + CountViewHeight, size.width - Margin*2, size.height - CountViewHeight - Margin*3)];
    [_contentView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [_contentView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_contentView.layer setBorderWidth:1.0];
    [_contentView.layer setCornerRadius:5.0];
    [_contentView.layer setMasksToBounds:YES];
    _contentView.delegate = self;
    [self.view addSubview:_contentView];
    
}

#pragma mark - timerForProgress
- (void)resumeTimer {
    if (_countDownTimer == nil) {
        _countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCountView) userInfo:nil repeats:YES];
        [_countDownTimer fire];
    }
}

- (void)pauseTimer {
    
    [_countDownTimer invalidate];
    _countDownTimer = nil;
}

- (void)updateCountView {
    
    if (_countView.countDown <= 0) {
        [self pauseTimer];
        
        NSString *title = [NSString stringWithFormat:@"计时结束！猜对个数: %ld", _countView.successAmount];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancelAction];
        [self.navigationController presentViewController:alertController animated:YES completion:nil];
    } else {
        _countView.countDown--;
        [_countView updateContent];
    }
}

#pragma mark - ConentViewDelegate
- (void)conentView:(ConentView *)contentView clickedButton:(UIButton *)button {
    
    switch (button.tag) {
        case ButtonTag_Reset: {
            [self pauseTimer];
            _countView.countDown = 0;
            _countView.successAmount = 0;
            [_countView updateContent];
            [contentView updateContentWithText:@"***"];
            break;
        }
        case ButtonTag_Start: {
            _countView.countDown = TotalTime;
            [_countView updateContent];
            [contentView updateContentWithText:_guessWords.randomWord];
            [self resumeTimer];
            break;
        }
        case ButtonTag_Success: {
            _countView.successAmount++;
            [_countView updateContent];
            [contentView updateContentWithText:_guessWords.randomWord];
            break;
        }
        case ButtonTag_Fail:
            [contentView updateContentWithText:_guessWords.randomWord];
            break;
            
        default:
            break;
    }
}

@end
