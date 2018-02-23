//
//  LLTWGameOverViewController.h
//  FDFullscreenPopGesture
//
//  Created by Lilong on 2018/2/23.
//

#import <UIKit/UIKit.h>

@interface LLTWGameOverViewController : UIViewController

@property (strong, nonatomic) NSString *tip;

@property (copy, nonatomic) void (^restartGameBlock)(void);

@end
