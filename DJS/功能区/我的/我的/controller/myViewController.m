//
//  myViewController.m
//  DJS
//
//  Created by mac on 2017/12/26.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "myViewController.h"
#import "myView.h"
@interface myViewController ()
@property(nonatomic,strong)myView *aView;
@end

@implementation myViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self wr_setNavBarBackgroundAlpha:0];
    
    _aView=[myView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    _aView.viewController=self;
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self loginView];
}

-(void)loginView{
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSString *token=[userDic objectForKey:@"token"];
    NSNumber *waiter_id1=[userDic objectForKey:@"waiter_id"];
    NSString *waiter_id=[NSString stringWithFormat:@"%@",waiter_id1];
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"0",@"waiter_role",@"1",@"user_role",token,@"token",waiter_id,@"waiter_id", nil];
    [ZQTools AFNPostDataUrl:@"waiter/waiter/waiter_info" Dict:dic andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
        [ZQTools cleanViewSubviews:_aView];
        _aView.userDic=responseObject;
        [_aView creatView];
    } anderrorBlock:nil];
    
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
