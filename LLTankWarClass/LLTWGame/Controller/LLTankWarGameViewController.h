//
//  LLTankWarGameViewController.h
//  FDFullscreenPopGesture
//
//  Created by Lilong on 2018/2/22.
//

#import <UIKit/UIKit.h>

@interface LLTankWarGameViewController : UIViewController

@property (copy, nonatomic) void (^quitGameBlock)(void);
/*
 *  游戏暂停
 */
+ (void)pauseGame;

/*
 *  重新开始
 */
- (void)restart;

+ (void)stopBadTankIn6s;


@end
