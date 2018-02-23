//
//  LLTWWall.m
//  FDFullscreenPopGesture
//
//  Created by Lilong on 2018/2/23.
//

#import "LLTWWall.h"
#import <AudioToolbox/AudioToolbox.h>
#import "LLTWFactory.h"
#import "LLTWXibUtil.h"
@implementation LLTWWall

- (void)setIsDeath:(bool)isDeath {
    _isDeath = isDeath;
    if (isDeath) {
        if (self.wallType == WallType_symbol) {
            self.imgView.image = [UIImage imageNamed:@"destory"];
            [LLTWFactory setIsGameover:true];
        } else {
            [self.imgView removeFromSuperview];
        }
        [[LLTWXibUtil getAllWalls] removeObject:self];
    }
}

- (void)playingSoundEffectWith:(NSString *)filename {
    NSURL *fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:filename ofType:nil]];
    if (fileURL != nil) {
        SystemSoundID theSoundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)fileURL, &theSoundID);
        AudioServicesPlaySystemSound(theSoundID);
    }
}

@end
