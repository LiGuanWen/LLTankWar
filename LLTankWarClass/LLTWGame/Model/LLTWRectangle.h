//
//  LLTWRectangle.h
//  FDFullscreenPopGesture
//
//  Created by Lilong on 2018/2/23.
//

#import <Foundation/Foundation.h>

@interface LLTWRectangle : NSObject {
@protected
    CGPoint _center;
    CGSize _size;
    UIImageView *_imgView;
    UIView *_mainView;
    bool _isDeath;
    bool _isGood;
}
@property (assign, nonatomic) CGPoint center;
@property (assign, nonatomic) CGSize size;
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UIView *mainView;

/**
 *  true : 我方坦克 false：敌方坦克
 */
@property (assign, nonatomic) bool isGood;

/**
 *  是否死亡
 */
@property (assign, nonatomic) bool isDeath;

- (void)setCenter:(CGPoint)center;

@end
