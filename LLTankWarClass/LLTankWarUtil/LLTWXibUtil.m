//
//  LLTWXibUtil.m
//  FDFullscreenPopGesture
//
//  Created by Lilong on 2018/2/23.
//

#import "LLTWXibUtil.h"
#import "LLTWCommonData.h"


static NSMutableArray<LLTWWall *> *walls;
static NSArray<NSString *> *wallNames;

CGRect frame;
UIView *mainView;

@implementation LLTWXibUtil
- (instancetype)initWithMainView:(UIView *)mainView1 {
    self = [super init];
    if (self) {
        frame = mainView1.frame;
        mainView = mainView1;
    }
    return self;
}

- (UIView *)zoomWidthXibName:(NSString *)xibName {
    UIView *view = [[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil].firstObject;
    CGFloat scale = [UIScreen mainScreen].bounds.size.width / 414;
    view.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    
    //比例计算，等比缩放
    for (UIView *v in view.subviews) {
        //        v.transform = CGAffineTransformMakeScale(scale, scale);
        CGPoint p = v.frame.origin;
        CGSize s = v.frame.size;
        v.frame = CGRectMake(scale * p.x, scale * p.y, scale * s.width, scale * s.height);
    }
    return view;
}

- (NSMutableArray<LLTWWall *> *)getWallsFromXib:(NSString *)xibName {
    if (!wallNames) {
        wallNames = @[@"grass", @"brick-1", @"water", @"steel", @"symbol"];
    }
    if (!walls) {
        walls = [NSMutableArray array];
        for (UIView *view in [self zoomWidthXibName:xibName].subviews) {
            if ([view isMemberOfClass:[UIImageView class]]) {
                LLTWWall *wall = [LLTWWall new];
                NSInteger index = ((UIImageView *)view).tag - 300;
                
                if (index != NSNotFound) {
                    //直接赋值有bug
                    //wall.imgView = (UIImageView *)view;
                    wall.wallType = index;
                    wall.imgView = [[UIImageView alloc] initWithFrame:view.frame];
                    wall.imgView.image = [UIImage imageNamed:wallNames[index]];
                    wall.center = CGPointMake(view.center.x - margin_x, view.center.y - margin_y);
                    [walls addObject:wall];
                }
            }
        }
    }
    return walls;
}

- (NSMutableArray<LLTWWall *> *)changeMap:(NSString *)mapName {
    if (!walls) {
        walls = [NSMutableArray array];
    }
    [walls removeAllObjects];
    for (UIView *view in [self zoomWidthXibName:mapName].subviews) {
        if ([view isMemberOfClass:[UIImageView class]]) {
            LLTWWall *wall = [LLTWWall new];
            NSInteger index = ((UIImageView *)view).tag - 300;
            
            if (index != NSNotFound) {
                //直接赋值有bug
                //wall.imgView = (UIImageView *)view;
                wall.wallType = index;
                wall.imgView = [[UIImageView alloc] initWithFrame:view.frame];
                wall.imgView.image = [UIImage imageNamed:wallNames[index]];
                wall.center = CGPointMake(view.center.x - margin_x, view.center.y - margin_y);
                [walls addObject:wall];
            }
        }
    }
    return walls;
}

+ (NSMutableArray<LLTWWall *> *)getAllWalls {
    return walls;
}
@end
