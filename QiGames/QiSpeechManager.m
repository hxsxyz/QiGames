//
//  QiSpeechManager.m
//  QiGames
//
//  Created by huangxianshuai on 2018/10/24.
//  Copyright © 2018年 360.cn. All rights reserved.
//

#import "QiSpeechManager.h"

@interface QiSpeechManager ()

@property (nonatomic, strong) SFSpeechAudioBufferRecognitionRequest *recognitionRequest;
@property (nonatomic, strong) SFSpeechRecognitionTask *recognitionTask;
@property (nonatomic, strong) SFSpeechRecognizer *speechRecognizer;
@property (nonatomic, strong) AVAudioSession *audioSession;
@property (nonatomic, strong) AVAudioEngine *audioEngine;

@property (nonatomic, copy) void(^response)(NSString *);

@end

@implementation QiSpeechManager

+ (instancetype)shareManager {
    
    static QiSpeechManager *manager;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[QiSpeechManager alloc] init];
    });
    
    return manager;
}

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        [SFSpeechRecognizer requestAuthorization:^(SFSpeechRecognizerAuthorizationStatus status) {
            NSLog(@"status is %li", (long)status);
            
            if (status == SFSpeechRecognizerAuthorizationStatusAuthorized) {
                self.speechRecognizer = [[SFSpeechRecognizer alloc] initWithLocale:[NSLocale localeWithLocaleIdentifier:@"zh-CN"]];
                
                self.audioEngine = [[AVAudioEngine alloc] init];
                
                self.audioSession = [AVAudioSession sharedInstance];
                [self.audioSession setCategory:AVAudioSessionCategoryRecord mode:AVAudioSessionModeMeasurement options:AVAudioSessionCategoryOptionDuckOthers error:nil];
                [self.audioSession setActive:YES withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
            }
        }];
    }
    
    return self;
}


#pragma mark - Public functions

- (void)startRecordingWithResponse:(void (^)(NSString * _Nonnull))response {
    
    [self stopRecording];
    
    _response = response;
    
    self.recognitionRequest = [[SFSpeechAudioBufferRecognitionRequest alloc] init];
    self.recognitionRequest.shouldReportPartialResults = YES;
    
    AVAudioInputNode *audioInputNode = _audioEngine.inputNode;
    AVAudioFormat *audioFormat = [audioInputNode outputFormatForBus:0];
    [audioInputNode removeTapOnBus:0];
    [audioInputNode installTapOnBus:0 bufferSize:1024 format:audioFormat block:^(AVAudioPCMBuffer * _Nonnull buffer, AVAudioTime * _Nonnull when) {
        [self.recognitionRequest appendAudioPCMBuffer:buffer];
    }];
    [_audioEngine prepare];
    [_audioEngine startAndReturnError:nil];
    
    _recognitionTask = [_speechRecognizer recognitionTaskWithRequest:_recognitionRequest resultHandler:^(SFSpeechRecognitionResult * _Nullable result, NSError * _Nullable error) {
        NSLog(@"is final: %d  result: %@", result.isFinal, result.bestTranscription.formattedString);
        if (result && self.response) {
            self.response(result.bestTranscription.formattedString);
        }
    }];
}

- (void)stopRecording {
    
    [_audioEngine stop];
    [_audioEngine.inputNode removeTapOnBus:0];
    [_recognitionRequest endAudio];
    [_recognitionTask cancel];
}

@end
