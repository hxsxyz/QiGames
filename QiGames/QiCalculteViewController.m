//
//  QiCalculteViewController.m
//  QiGames
//
//  Created by huangxianshuai on 2018/10/23.
//  Copyright © 2018年 360.cn. All rights reserved.
//

#import "QiCalculteViewController.h"

@interface QiCalculteViewController ()

@property (weak, nonatomic) IBOutlet UILabel *factorLabel1;
@property (weak, nonatomic) IBOutlet UILabel *factorLabel2;
@property (weak, nonatomic) IBOutlet UILabel *factorLabel3;

@property (weak, nonatomic) IBOutlet UILabel *operatorLabel1;
@property (weak, nonatomic) IBOutlet UILabel *operatorLabel2;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation QiCalculteViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}


#pragma mark - Action functions

- (IBAction)setQuestion:(id)sender {
    
    [self resetFactorsAndOperators];
    
    _factorLabel1.text = [self generateFactor];
    _factorLabel2.text = [self generateFactor];
    _factorLabel3.text = [self generateFactor];
    
    _operatorLabel1.text = [self generateOperator];
    _operatorLabel2.text = [self generateOperator];
}

- (IBAction)calculate:(id)sender {
    
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
    
    _resultLabel.text = @(result).stringValue;
}


#pragma mark - Private functions

- (NSString *)generateFactor {
    
    NSUInteger i = arc4random() % 10;
    NSUInteger max = i < 4? 10: i < 7? 20: i < 9? 50: 100;
    NSUInteger factor = arc4random() % max;
    
    return @(factor).stringValue;
}

- (NSString *)generateOperator {
    
    NSUInteger i = arc4random() % 5;
    NSString *operator = i < 2? @"+": i < 4? @"-": @"x";
    
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

- (void)resetFactorsAndOperators {
    
    _factorLabel1.text = @"";
    _factorLabel2.text = @"";
    _factorLabel3.text = @"";
    
    _operatorLabel1.text = @"";
    _operatorLabel2.text = @"";
    
    _resultLabel.text = @"";
}

@end
