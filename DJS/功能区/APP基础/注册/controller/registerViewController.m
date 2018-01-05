//
//  registerViewController.m
//  DJS
//
//  Created by mac on 2017/12/25.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "registerViewController.h"
#import "registerView.h"
@interface registerViewController ()
@property(nonatomic,strong)registerView *aView;
@end

@implementation registerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _aView=[registerView new];
    self.navigationItem.title=@"注册";
    
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
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
