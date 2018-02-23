//
//  LLTankWarMenuViewController.m
//  FDFullscreenPopGesture
//
//  Created by Lilong on 2018/2/23.
//

#import "LLTankWarMenuViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "LLTankWarGameViewController.h"
#import "YYCGUtilities.h"
@interface LLTankWarMenuViewController ()

@end

@implementation LLTankWarMenuViewController

/**
 隐藏导航栏
 */
- (BOOL)fd_prefersNavigationBarHidden{
    return YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_interactivePopDisabled = YES;  //屏蔽返回手势

    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    LLTankWarGameViewController *vc = [LLTankWarGameViewController new];
    [vc setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:vc animated:YES completion:nil];
//    @weakify(self)
//    vc.quitGameBlock = ^{
//        @strongify(self)
//        [self quitGameAction:nil];
//    };
}


- (IBAction)quitGameAction:(id)sender {
    //直接用present的话页面过渡会不太自然，这里还是用push，然后做出present的效果
    CATransition *transition = [CATransition animation];
    transition.duration = 0.25;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    transition.type = kCATransitionPush;
    transition.subtype  = kCATransitionFromBottom;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    self.navigationController.navigationBarHidden = NO;
    
    NSArray<__kindof UIViewController *> * vcArr = self.navigationController.viewControllers;
    UIViewController *backVC;
    for (int i = 0; i < vcArr.count; i++) {
        UIViewController *currVC = vcArr[i];
        if ([currVC isKindOfClass:[self class]]) {
            if ( i-1 >= 0) {
                backVC = vcArr[i-1];
                break;
            }
        }
    }
    if (backVC) {
        [self.navigationController popToViewController:backVC animated:NO];
    }else{
        [self.navigationController popViewControllerAnimated:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
