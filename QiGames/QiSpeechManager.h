//
//  QiSpeechManager.h
//  QiGames
//
//  Created by huangxianshuai on 2018/10/24.
//  Copyright © 2018年 360.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Speech/Speech.h>

NS_ASSUME_NONNULL_BEGIN

@interface QiSpeechManager : NSObject

+ (instancetype)shareManager;

- (void)startRecordingWithResponse:(void(^)(NSString *))response;
- (void)stopRecording;

@end

NS_ASSUME_NONNULL_END
