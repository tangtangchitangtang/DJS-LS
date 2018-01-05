//
//  informationViewController.m
//  DJS
//
//  Created by mac on 2017/12/28.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "informationViewController.h"
#import "informationView.h"
@interface informationViewController ()
@property(nonatomic,strong)informationView *aView;

@end

@implementation informationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"资讯";
    _aView=[informationView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    _aView.dataArr=[NSMutableArray arrayWithCapacity:0];
    _aView.viewController=self;
    [self loginView];
}

-(void)loginView{
    [ZQTools AFNPostDataUrl:@"api/index/news_type" Dict:nil andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
        NSMutableArray *tableArr=[NSMutableArray arrayWithCapacity:0];
        NSArray *typeArr=responseObject;
        for (int i=0; i<4; i++) {
           [tableArr addObject:typeArr[0]];
        }
        _aView.titleArr=[NSArray arrayWithArray:tableArr];
        [self loadDate];
    } anderrorBlock:nil];
}
-(void)loadDate{
    NSDictionary *typeDic=_aView.titleArr[0];
    NSNumber *nt_id=[typeDic objectForKey:@"nt_id"];
    NSString *news_nt_id=[NSString stringWithFormat:@"%@",nt_id];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"0",@"page",news_nt_id,@"news_nt_id",@"10",@"pagesize", nil];
    [ZQTools AFNPostDataUrl:@"api/index/news_list" Dict:dic andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
        
        NSArray *typeArr=responseObject;
        _aView.dataArr=[NSMutableArray arrayWithArray:typeArr];
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
