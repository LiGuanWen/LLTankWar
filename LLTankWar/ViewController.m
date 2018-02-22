//
//  ViewController.m
//  LLTankWar
//
//  Created by Lilong on 2018/2/22.
//  Copyright © 2018年 第七代目. All rights reserved.
//

#import "ViewController.h"
#import "LLTankWarGameViewController.h"
#import "LLTWRankingListViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"坦克大战";
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)begainGameAction:(id)sender {
    LLTankWarGameViewController *vc = [LLTankWarGameViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)rankingListAction:(id)sender {
    LLTWRankingListViewController *vc = [LLTWRankingListViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
