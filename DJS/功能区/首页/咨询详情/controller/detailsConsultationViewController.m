//
//  detailsConsultationViewController.m
//  DJS
//
//  Created by 浪尖渝力 on 2018/1/5.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "detailsConsultationViewController.h"
#import "detailsConsultationView.h"
@interface detailsConsultationViewController ()
@property(nonatomic,strong)detailsConsultationView *aView;
@end

@implementation detailsConsultationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"咨询详情";
    _aView=[detailsConsultationView new];
    [self.view addSubview:_aView];
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    [self loadDate];
    _aView.viewController=self;
}
-(void)loadDate{
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:_news_id,@"news_id", nil];
    [ZQTools AFNPostDataUrl:@"api/index/news_info" Dict:dic andTableView:nil andView:self.view andSuccessBlock:^(id responseObject) {
        _aView.dic=responseObject;
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
