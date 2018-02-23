//
//  LLTankWarRoute.m
//  LLRoute
//
//  Created by Lilong on 2017/10/10.
//

#import "LLTankWarRoute.h"

#import "LLTankWarAboutViewController.h"  //关于
#import "LLTankWarMenuViewController.h"    // 游戏菜单
#import "LLTWRankingListViewController.h"   //排行榜
@implementation LLTankWarRoute

//注册路径跳转
+ (void)registerRoute{
    [[LLRouteManager sharedManager] registerRoute:[LLTankWarRoute class]];
}

/**
 跳转前缀
 */
+(NSString *)routeName{
    return LLTankWar_SCHEME;
}

/**
 组件scheme跳转   子类重新 参考！！！！！！
 
 @param schemeUrl scheme参数
 @param dic 其他特殊参数
 */
+ (void)routeToSchemeUrl:(NSURL *)schemeUrl parameter:(NSMutableDictionary *)dic{
    UIViewController *currentVC = [dic objectForKey:CURRENT_VC_KEY];
    NSLog(@"当前页面  currvc class = %@",[currentVC class]);
    NSString *hidesBottomStr = [dic objectForKey:HIDESBOTTOMBARWHENPUSHED_KEY];
    BOOL hidesBottom;
    if ([hidesBottomStr isEqualToString:HIDESBOTTOMBARWHENPUSHED_YES]) {
        hidesBottom = YES;
    }else{
        hidesBottom = NO;
    }
    [LLTankWarRoute routeWithUrl:schemeUrl currentVC:currentVC hidesBottomBarWhenPushed:hidesBottom parameterDict:dic];
}

/**
 路径跳转
 
 @param url 跳转的url
 @param currentVC 当前跳转的UIViewController
 @param hidesBottomBarWhenPushed 是否隐藏tabbar
 @param parameterDict 需要传递的参数
 */
+ (LLTankWarRoute *)routeWithUrl:(NSURL *)url currentVC:(UIViewController *)currentVC hidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed parameterDict:(NSMutableDictionary *)parameterDict{
    LLTankWarRoute *route = [[LLTankWarRoute alloc] initWithUrl:url currentVC:currentVC hidesBottomBarWhenPushed:hidesBottomBarWhenPushed parameterDict:parameterDict];
    return route;
}

- (id)initWithUrl:(NSURL *)url currentVC:(UIViewController *)currentVC hidesBottomBarWhenPushed:(BOOL)yes parameterDict:(NSMutableDictionary *)parameterDict{
    self = [super init];
    if (self) {
        self.currentVC = currentVC;
        self.linkUrl = url;
        self.hidesBottom = yes;
        self.parameterDict = parameterDict;
        [self startParsingWithUrl:url];
    }
    return self;
}

#pragma mark - 开始解析
/**
 *  开始解析
 *
 *  @param url url description
 */
-(void)startParsingWithUrl:(NSURL *)url{
    NSString *scheme = url.scheme;
    if ([scheme hasPrefix:LLTankWar_SCHEME]) {
        [self routeToModule:[LLRoute getModuleInfo:url]];
    }else if ([scheme isEqualToString:@"http"]||[scheme isEqualToString:@"https"]||[scheme isEqualToString:@"ftp"])
    {
        [self parseToOtherLinkWithUrl:url.absoluteString];
    }else if ([scheme isEqualToString:@"tel"])
    {
        [self parseToPhoneCallWithUrl:url.absoluteString];
    }else{
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"链接地址错误" message:url.absoluteString delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
//        [alertView show];
    }
}

#pragma mark - 解析到对应的模块
/**
 *  解析模块  (内部)
 *
 *  @param moduleInfo url description
 */
-(void)routeToModule:(LLModuleInfo*)moduleInfo{
    if ([moduleInfo.moduleName isEqualToString:@"game"]) {
        //
        [self routeToGameWithModule:moduleInfo];
    }
    
}
/**
 *  解析为外部链接
 *
 *  @param url url description
 */
-(void)parseToOtherLinkWithUrl:(NSString*)url{
    
}

/**
 *  拨打电话
 *
 *  @param url url description
 */
-(void)parseToPhoneCallWithUrl:(NSString*)url{
    UIWebView*callWebview =[[UIWebView alloc] init] ;
    NSURL *telURL =[NSURL URLWithString:url];
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    [self.currentVC.view addSubview:callWebview];
}


- (void)routeToGameWithModule:(LLModuleInfo*)moduleInfo{
    //开始
    if ([moduleInfo.page isEqualToString:@"/begin"]) {
        [LLTankWarRoute pushToGameBeginWithCurrVC:self.currentVC];
        return;
    }
    //菜单
    if ([moduleInfo.page isEqualToString:@"/menu"]) {
        return;
    }
    //关于
    if ([moduleInfo.page isEqualToString:@"/about"]) {
        [LLTankWarRoute pushToGameAboutWithCurrVC:self.currentVC];
        return;
    }
    //排行榜
    if ([moduleInfo.page isEqualToString:@"/rankingList"]) {
        [LLTankWarRoute pushToGameRankingListWithCurrVC:self.currentVC];
        return;
    }
    //设置
    if ([moduleInfo.page isEqualToString:@"/setting"]) {
        return;
    }
    
}

//开始
+ (void)pushToGameBeginWithCurrVC:(UIViewController *)currVC{
    LLTankWarMenuViewController *vc = [[LLTankWarMenuViewController alloc] init];
//    vc.hidesBottomBarWhenPushed = YES;
//    [currVC.navigationController pushViewController:vc animated:YES];
    UINavigationController *nav = currVC.navigationController;
    //由于音视频聊天里头有音频和视频聊天界面的切换，直接用present的话页面过渡会不太自然，这里还是用push，然后做出present的效果
    CATransition *transition = [CATransition animation];
    transition.duration = 0.25;
    vc.hidesBottomBarWhenPushed = YES;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromTop;
    [nav.view.layer addAnimation:transition forKey:nil];
    nav.navigationBarHidden = YES;
    vc.hidesBottomBarWhenPushed = YES;
    [nav pushViewController:vc animated:NO];
}

//关于
+ (void)pushToGameAboutWithCurrVC:(UIViewController *)currVC{
    LLTankWarAboutViewController *vc = [[LLTankWarAboutViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [currVC.navigationController pushViewController:vc animated:YES];
}

//排行榜
+ (void)pushToGameRankingListWithCurrVC:(UIViewController *)currVC{
    LLTWRankingListViewController *vc = [[LLTWRankingListViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [currVC.navigationController pushViewController:vc animated:YES];
}





@end
