//
//  LLTWXibUtil.h
//  FDFullscreenPopGesture
//
//  Created by Lilong on 2018/2/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LLTWWall.h"
@interface LLTWXibUtil : NSObject

/**
 * frame 是主视图的frame，用来计算等比例缩放
 */
- (UIView *)zoomWidthXibName:(NSString *)xibName;

/**
 * frame 是主视图的frame，用来计算等比例缩放
 */
- (NSMutableArray<LLTWWall *> *)getWallsFromXib:(NSString *)xibName;

/**
 *改变地图
 */
- (NSMutableArray<LLTWWall *> *)changeMap:(NSString *)mapName;

- (instancetype)initWithMainView:(UIView *)mainView;

+ (NSMutableArray<LLTWWall *> *)getAllWalls;
@end
