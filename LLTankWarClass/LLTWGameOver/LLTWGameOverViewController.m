//
//  LLTWGameOverViewController.m
//  FDFullscreenPopGesture
//
//  Created by Lilong on 2018/2/23.
//

#import "LLTWGameOverViewController.h"

@interface LLTWGameOverViewController ()

@end

@implementation LLTWGameOverViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI {
    self.view.backgroundColor = [UIColor greenColor];
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    imgView.image = [UIImage imageNamed:@"tank_back"];
    [self.view addSubview:imgView];
    
    UILabel *stageLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 200, width - 150, 40)];
    stageLabel.textAlignment = NSTextAlignmentCenter;
    stageLabel.text = self.tip;
    stageLabel.textColor = [UIColor redColor];
    stageLabel.font = [UIFont fontWithName:@"Party LET" size:40];
    //    stageLabel.backgroundColor = [UIColor cyanColor];
    stageLabel.numberOfLines = 0;
    stageLabel.layer.borderColor = [UIColor redColor].CGColor;
    stageLabel.layer.cornerRadius = 20;
    [self.view addSubview:stageLabel];
    
    if (![self.tip isEqualToString:@"GAME OVER"]){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(width / 2 - 75, 260, 150, 40);
        [btn setTitle:@"N E X T" forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor blackColor];
        btn.titleLabel.font = [UIFont fontWithName:@"Party LET" size:40];
        btn.titleLabel.textColor = [UIColor redColor];
        btn.layer.borderColor = [UIColor redColor].CGColor;
        btn.layer.cornerRadius = 20;
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    } else {
        imgView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gameover.jpg" ofType:nil]];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(width / 2 - 75, 260, 150, 40);
        [btn setTitle:@"restart" forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor orangeColor];
        btn.titleLabel.font = [UIFont fontWithName:@"Party LET" size:40];
        btn.titleLabel.textColor = [UIColor redColor];
        btn.layer.borderColor = [UIColor cyanColor].CGColor;
        btn.tag = 111;
        btn.layer.cornerRadius = 20;
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

- (void)click:(UIButton *)sender {
    CATransition *animation = [CATransition animation];
    animation.duration = 1.5;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    //    animation.type = @"pageCurl";
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromLeft;
    [self.view.window.layer addAnimation:animation forKey:nil];
    //[self presentViewController:pv animated:NO completion:nil];
    
    [self dismissViewControllerAnimated:NO completion:nil];
    //此乃restart
    if (111 == sender.tag) {
        if (self.restartGameBlock) {
            self.restartGameBlock();
        }
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
