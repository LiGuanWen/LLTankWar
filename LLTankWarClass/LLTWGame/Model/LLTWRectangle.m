//
//  LLTWRectangle.m
//  FDFullscreenPopGesture
//
//  Created by Lilong on 2018/2/23.
//

#import "LLTWRectangle.h"

@implementation LLTWRectangle

- (void)setCenter:(CGPoint)center {
    _center = center;
    self.imgView.center = center;
}

@end
