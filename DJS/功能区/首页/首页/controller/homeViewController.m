//
//  homeViewController.m
//  DJS
//
//  Created by mac on 2017/12/26.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "homeViewController.h"
#import "homeView.h"

@interface homeViewController ()
@property(nonatomic,strong)homeView *aView;
@end

@implementation homeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self wr_setNavBarBackgroundAlpha:0]
    ;
    _aView=[homeView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    [_aView creatView];
    _aView.viewController=self;
    [self loginView];
    [self loadZiXun];
}


-(void)loginView{
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"0",@"carousel_type", nil];
    [ZQTools AFNPostDataUrl:@"api/index/banner_list" Dict:dic andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
        _aView.CarouselArr=responseObject;
        [_aView creatLunBo];
    } anderrorBlock:nil];
}
-(void)loadZiXun{
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"0",@"page",@"10",@"pagesize",@"0",@"news_nt_id", nil];
    [ZQTools AFNPostDataUrl:@"api/index/news_list" Dict:dic andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
        NSLog(@"%@",responseObject);
        _aView.tableArr=responseObject;
        [_aView creatTbaleView];
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
