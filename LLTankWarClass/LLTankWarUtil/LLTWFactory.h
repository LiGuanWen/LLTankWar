//
//  LLTWFactory.h
//  FDFullscreenPopGesture
//
//  Created by Lilong on 2018/2/23.
//

#import <Foundation/Foundation.h>
#import "LLTWTank.h"
@class LLTWWall;
enum bornLocation {
    bornLocation_left = 0,
    bornLocation_middle,
    bornLocation_right
};

@interface LLTWFactory : NSObject

@property (assign, nonatomic) CGRect tankFrame;
@property (strong, nonatomic) NSMutableArray<UIImageView *> *bomb;
@property (weak, nonatomic) UIView *mainView;
@property (weak, nonatomic) UILabel *info;

+ (bool)isGameover;

+ (void)setIsGameover:(bool)isGameover;

/**
 *  创建坦克
 *
 *  @param tankType 坦克类型
 *  @param dir      坦克方向
 *
 */
- (LLTWTank *)createTank:(TankType)tankType direction:(TankDirectione)dir center:(CGPoint)center;

- (LLTWBullet *)createBullet:(TankDirectione)dir isGood:(BOOL)isGood;

/**
 *  清空全部
 */
+ (void)clearAll;

/**
 * 是否撞击检测
 */
+ (BOOL)checkIsKnockedWithRect:(UIView *)r1 r2:(UIView *)r2;

/**
 * 是否撞击检测,检测全部
 */
+ (LLTWRectangle *)checkIsKnockedWithRectArray:(LLTWRectangle *)r1;

/**
 * 检测是否和任意的坦撞
 */
+ (NSMutableArray<LLTWRectangle *> *)checkKnockWidthTank:(LLTWRectangle *)r1;

/**
 * 检测是否和任意的障碍物相撞
 */
+ (NSMutableArray<LLTWRectangle *> *)checkKnockWidthWall:(LLTWRectangle *)r1;

/**
 * 是否出界
 */
+ (BOOL)outOfMainView:(CGRect)r mainView:(CGRect)mainView;

/**
 * 随机产生一辆敌方坦克，产生后直接显示，不需要加入view
 * 不指定location就随机
 */
- (BOOL)randomBadTank:(NSInteger)location;

+ (NSMutableArray<LLTWRectangle *> *)instanceOfNeedCheckKnocked;

+ (NSMutableArray<LLTWRectangle *> *)instanceOfBadTankArray;

+ (BOOL)isBorining;

@end
