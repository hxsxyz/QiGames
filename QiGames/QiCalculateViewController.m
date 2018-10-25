//
//  QiCalculateViewController.m
//  QiGames
//
//  Created by huangxianshuai on 2018/10/23.
//  Copyright © 2018年 360.cn. All rights reserved.
//

#import "QiCalculateViewController.h"
#import "QiSpeechManager.h"

@interface QiCalculateViewController ()

@property (weak, nonatomic) IBOutlet UILabel *factorLabel1;
@property (weak, nonatomic) IBOutlet UILabel *factorLabel2;
@property (weak, nonatomic) IBOutlet UILabel *factorLabel3;
@property (weak, nonatomic) IBOutlet UILabel *operatorLabel1;
@property (weak, nonatomic) IBOutlet UILabel *operatorLabel2;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *recordingLabel;
@property (weak, nonatomic) IBOutlet UIButton *questionButton;
@property (weak, nonatomic) IBOutlet UIButton *resultButton;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (nonatomic, strong) QiSpeechManager *speechManager;

@property (nonatomic, strong) NSTimer *timer;//!< 计时器

@end

@implementation QiCalculateViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self resetElements];
    
    [_startButton setTitle:[_startButton titleForState:UIControlStateSelected] forState:(UIControlStateSelected | UIControlStateHighlighted)];
}

- (void)dealloc {
    
    NSLog(@"%s", __func__);
}


#pragma mark - Action functions

- (IBAction)questionButtonClicked:(id)sender {
    
    _questionButton.enabled = NO;
    _resultButton.enabled = YES;
    
    [self setQuestion];
    
    if (_speechManager) {
        _recordingLabel.text = @"";
        _recordingLabel.layer.borderWidth = .0;
        
        [_speechManager startRecordingWithResponse:^(NSString * _Nonnull formatString) {
            self.recordingLabel.text = [formatString componentsSeparatedByString:@" "].lastObject;
        }];
    }
}

- (IBAction)resultButtonClicked:(id)sender {
    
    _questionButton.enabled = YES;
    _resultButton.enabled = NO;
    
    _resultLabel.text = @([self calculate]).stringValue;
    
    if (_speechManager) {
        [_speechManager stopRecording];
        
        _recordingLabel.layer.borderWidth = 1.0;
        if ([_recordingLabel.text isEqualToString:_resultLabel.text]) {
            _recordingLabel.layer.borderColor = [UIColor greenColor].CGColor;
        } else {
            _recordingLabel.layer.borderColor = [UIColor redColor].CGColor;
        }
    }
}

- (IBAction)startButtonClicked:(UIButton *)sender {
    
    NSString *message = [NSString stringWithFormat:@"确定要 %@ 吗？", sender.currentTitle];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:sender.currentTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        sender.selected = !sender.selected;
        
        
        self.resultButton.enabled = !self.resultButton.enabled;
        
        if (sender.selected) {
            [self resetElements];
            [self startTimer];
        } else {
            [self stopTimer];
        }
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:confirmAction];
    
    [self.navigationController presentViewController:alertController animated:YES completion:nil];
}


#pragma mark - Private functions

- (void)setQuestion {
    
    _resultLabel.text = @"";
    
    _factorLabel1.text = [self generateFactor];
    _factorLabel2.text = [self generateFactor];
    _factorLabel3.text = [self generateFactor];
    
    _operatorLabel1.text = [self generateOperator];
    _operatorLabel2.text = [self generateOperator];
}

- (NSInteger)calculate {
    
    NSUInteger factor1 = _factorLabel1.text.integerValue;
    NSUInteger factor2 = _factorLabel2.text.integerValue;
    NSUInteger factor3 = _factorLabel3.text.integerValue;
    
    NSString *operator1 = _operatorLabel1.text;
    NSString *operator2 = _operatorLabel2.text;
    
    NSInteger result = [self calculateWithOperator:operator1 leftFactor:factor1 rightFactor:factor2];
    if ([operator2 isEqualToString:@"x"]) {
        result = [self calculateWithOperator:operator2 leftFactor:factor2 rightFactor:factor3];
        result = [self calculateWithOperator:operator1 leftFactor:factor1 rightFactor:result];
    } else {
        result = [self calculateWithOperator:operator2 leftFactor:result rightFactor:factor3];
    }
    
    return result;
}

- (NSString *)generateFactor {
    
    NSUInteger r = arc4random() % 10;
    NSUInteger max = r < 4? 10: r < 7? 20: r < 9? 50: 100;
    NSUInteger factor = arc4random() % max;
    
    return @(factor).stringValue;
}

- (NSString *)generateOperator {
    
    NSUInteger r = arc4random() % 5;
    NSString *operator = r < 2? @"+": r < 4? @"-": @"x";
    
    return operator;
}

- (NSUInteger)calculateWithOperator:(NSString *)operator leftFactor:(NSUInteger)leftFactor rightFactor:(NSUInteger)rightFactor  {
    
    NSInteger result = leftFactor;
    
    if ([operator isEqualToString:@"+"]) {
        result += rightFactor;
    } else if ([operator isEqualToString:@"-"]) {
        result -= rightFactor;
    } else {
        result *= rightFactor;
    }
    
    return result;
}

- (void)resetElements {
    
    _factorLabel1.text = @"0";
    _factorLabel2.text = @"0";
    _factorLabel3.text = @"0";
    
    _operatorLabel1.text = @"+";
    _operatorLabel2.text = @"+";
    
    _resultLabel.text = @"0";
    _recordingLabel.text = @"0";
    
    _questionButton.enabled = YES;
    _resultButton.enabled = YES;
}

- (void)startTimer {
    
    [self stopTimer];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countUp) userInfo:nil repeats:YES];
}

- (void)stopTimer {
    
    [_timer invalidate];
    _timer = nil;
}

- (void)countUp {
    
    NSInteger count = _recordingLabel.text.integerValue;
    _recordingLabel.text = @(++count).stringValue;
}

@end
