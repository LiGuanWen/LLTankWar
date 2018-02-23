//
//  LLTWTank.h
//  FDFullscreenPopGesture
//
//  Created by Lilong on 2018/2/23.
//

#import <Foundation/Foundation.h>
#import "LLTWRectangle.h"
#import "LLTWBullet.h"
@class LLTWProp;

/**
 坦克
 */
@interface LLTWTank : LLTWRectangle
@property (assign, nonatomic) TankType type;
@property (assign, nonatomic) TankDirectione dir;
@property (assign, nonatomic) CGFloat speed;

@property (assign, nonatomic) bool beCalled;

@property (weak, nonatomic) UILabel *info;

@property (strong, nonatomic) NSMutableArray<LLTWBullet *> *bullets;

@property (assign, nonatomic) int level;

/**
 *  已经检测过，不需要再检测碰撞的坦克和建筑
 */
@property (strong, nonatomic) NSMutableArray<LLTWRectangle *> *notNeedChecks;

/**
 *  有几条命
 */
@property (assign, nonatomic) NSInteger life;


/**
 *  是否能移动
 */
@property (assign, nonatomic) bool canMove;

/**
 *  装甲等级
 */
@property (assign, nonatomic) NSInteger blood;


/**
 *  一次发射几个子弹
 */
@property (assign, nonatomic) NSInteger fireOfBulletCount;

//存储2进制，判断哪些方向不能移动
@property (assign, nonatomic) NSInteger canNotMoveDir;


/**
 *  爆炸中
 */
@property (assign, nonatomic) bool bobming;


+ (NSString *)getImageName:(TankType)type dir:(TankDirectione)dir;

#pragma mark - tank移动
- (void)move:(TankDirectione)dir timer:(NSTimer *)timer;

#pragma mark - 开炮
- (void)fire:(LLTWBullet *)bullet timer:(NSTimer *)timer;

/**
 *  强制死亡
 */
- (void)goDie:(BOOL)prop;


@end
