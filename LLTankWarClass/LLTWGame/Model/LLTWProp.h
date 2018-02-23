//
//  LLTWProp.h
//  FDFullscreenPopGesture
//
//  Created by Lilong on 2018/2/23.
//

#import "LLTWRectangle.h"
#import "LLTWCommonData.h"



/**
 * 奖励品
 */
@interface LLTWProp : LLTWRectangle

+ (instancetype)getInstance;

@property (assign, nonatomic) PropType type;

/**
 * 设置类型
 */
- (void)setType:(PropType)type mainView:(UIView *)mainView;

@end
