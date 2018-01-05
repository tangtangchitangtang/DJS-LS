//
//  tiXianViewController.m
//  DJS
//
//  Created by mac on 2017/12/27.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "tiXianViewController.h"
#import "tiXianView.h"

@interface tiXianViewController ()
@property(nonatomic,strong)tiXianView *aView;
@end

@implementation tiXianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"提现";
    
    _aView=[tiXianView new];
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
