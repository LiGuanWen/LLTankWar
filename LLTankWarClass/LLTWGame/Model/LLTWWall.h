//
//  LLTWWall.h
//  FDFullscreenPopGesture
//
//  Created by Lilong on 2018/2/23.
//

#import <Foundation/Foundation.h>
#import "LLTWRectangle.h"


typedef NS_ENUM(NSUInteger, WallType) {
    /**草*/
    WallType_grss = 0,
    /**砖*/
    WallType_brick,
    /**水*/
    WallType_water,
    /**铁*/
    WallType_steel,
    /**boss */
    WallType_symbol,
    /**保护罩 */
    WallType_cover,
};

@interface LLTWWall : LLTWRectangle

@property (assign, nonatomic) WallType wallType;

@end
