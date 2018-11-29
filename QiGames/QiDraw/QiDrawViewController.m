//
//  QiDrawViewController.m
//  QiGames
//
//  Created by huangxianshuai on 2018/10/24.
//  Copycorrect © 2018年 360.cn. All corrects reserved.
//

#import "QiDrawViewController.h"
#import "QiGuessWords.h"

@interface QiDrawViewController ()

@property (weak, nonatomic) IBOutlet UILabel *wordLabel;//!< 猜题Label
@property (weak, nonatomic) IBOutlet UILabel *secondsLabel;//!< 计时Label
@property (weak, nonatomic) IBOutlet UILabel *correctLabel;//!< 成功计数Label
@property (weak, nonatomic) IBOutlet UILabel *wrongLabel;//!< 失败计数Label

@property (weak, nonatomic) IBOutlet UIButton *correctButton;//!< 成功按钮
@property (weak, nonatomic) IBOutlet UIButton *wrongButton;//!< 失败按钮
@property (weak, nonatomic) IBOutlet UIButton *startButton;//!< 开始按钮

@property (nonatomic, assign) NSUInteger seconds;//!< 剩余时间
@property (nonatomic, assign) NSInteger correctCount;//!< 答对题数
@property (nonatomic, assign) NSInteger wrongCount;//!< 答错题数

@property (nonatomic, strong) QiGuessWords *guessWords;//!< 词条（题目）
@property (nonatomic, strong) NSTimer *timer;//!< 计时器

@end

@implementation QiDrawViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self resetElements];
    
    _guessWords = [[QiGuessWords alloc] init];
    
    [_startButton setTitle:[_startButton titleForState:UIControlStateSelected] forState:(UIControlStateSelected | UIControlStateHighlighted)];
}

- (void)dealloc {
    
    NSLog(@"%s", __func__);
}

- (void)resetElements {
    
    _wordLabel.text = @"";
    
    _seconds = 300;
    _wrongCount = 0;
    _correctCount = 0;
    _secondsLabel.text = [NSString stringWithFormat:@"%li", (long)_seconds];
    _correctLabel.text = [NSString stringWithFormat:@"%li", (long)_correctCount];
    _wrongLabel.text = [NSString stringWithFormat:@"%li", (long)_wrongCount];
    _correctButton.enabled = NO;
    _wrongButton.enabled = NO;
    _startButton.enabled = YES;
    
    [self stopTimer];
}


#pragma mark - Action functions

//! 开始按钮点击事件
- (IBAction)startButtonClicked:(UIButton *)sender {
    
    NSString *message = [NSString stringWithFormat:@"确定要 %@ 吗？", sender.currentTitle];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:sender.currentTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        sender.selected = !sender.selected;
    
        self.correctButton.enabled = !self.correctButton.enabled;
        self.wrongButton.enabled = !self.wrongButton.enabled;
        
        if (sender.selected) {
            self.wordLabel.text = self.guessWords.randomWord;
            [self startTimer];
        } else {
            [self resetElements];
        }
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:confirmAction];
    
    [self.navigationController presentViewController:alertController animated:YES completion:nil];
}

//! 成功按钮点击事件
- (IBAction)correctButtonClicked:(id)sender {
    
    _correctLabel.text = [NSString stringWithFormat:@"%li",(long)++_correctCount];
    _wordLabel.text = _guessWords.randomWord;
}

//! 失败按钮点击事件
- (IBAction)wrongButtonClicked:(id)sender {
    
    _wrongLabel.text = [NSString stringWithFormat:@"%li",(long)++_wrongCount];
    _wordLabel.text = _guessWords.randomWord;
}


#pragma mark - Private functions

- (void)startTimer {
    
    [self stopTimer];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
}

- (void)stopTimer {
    
    [_timer invalidate];
    _timer = nil;
}

- (void)countDown {

    _secondsLabel.text = [NSString stringWithFormat:@"%li", (long)--_seconds];
    
    if (_seconds <= 0) {
        [self stopTimer];
        _correctButton.enabled = NO;
        _wrongButton.enabled = NO;
    }
    else if (_seconds < 30) {
        _secondsLabel.textColor = [UIColor redColor];
    }
}

@end
