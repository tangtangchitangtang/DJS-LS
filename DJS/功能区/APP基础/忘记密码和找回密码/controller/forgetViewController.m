//
//  forgetViewController.m
//  DJS
//
//  Created by mac on 2017/12/26.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "forgetViewController.h"
#import "forgetView.h"
@interface forgetViewController ()
@property(nonatomic,strong)forgetView *aView;

@end

@implementation forgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"找回密码";

    _aView=[forgetView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    _aView.forgetStr=_forgetStr;
    [_aView creatView];
    _aView.viewController=self;
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
