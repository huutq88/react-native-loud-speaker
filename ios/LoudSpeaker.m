#import "LoudSpeaker.h"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@implementation LoudSpeaker

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(open :(BOOL)isSpeak resolve:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  dispatch_async(dispatch_get_main_queue(), ^{
    if([UIDevice currentDevice].systemVersion.floatValue >= 6.0) {
      if (isSpeak) {
        BOOL ok = [[AVAudioSession sharedInstance] overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:nil];
        if (ok) {
        }
      } else {
        BOOL ok = [[AVAudioSession sharedInstance] overrideOutputAudioPort:AVAudioSessionPortOverrideNone error:nil];
        if (ok) {
        }
      }
    } else {
      UInt32 route;
      if (isSpeak) {
        route = kAudioSessionOverrideAudioRoute_Speaker;
      } else {
        route = kAudioSessionOverrideAudioRoute_None;
      }
      AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute, sizeof(route), &route);
    }
  });
}

RCT_EXPORT_METHOD(about:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  NSString * foo = @"Author: Appota Fullstack team 1/2018";
  resolve(foo);
}

@end
