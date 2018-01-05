//
//  myView.m
//  DJS
//
//  Created by mac on 2017/12/26.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "myView.h"
#import "tiXianViewController.h"
@implementation myView

-(void)creatView{
    self.backgroundColor=_LightGrey;
    
    _scrollView=[UIScrollView new];
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    _scrollView.scrollsToTop =NO;
    
    _scrollView.showsVerticalScrollIndicator = FALSE;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    _scrollView.bounces = NO;
    _scrollView.contentSize = CGSizeMake(0,720);
    
    UIImageView *beiJing=[UIImageView new];
    [_scrollView addSubview:beiJing];
    [beiJing mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(230);
    }];
    beiJing.image=[UIImage imageNamed:@"个人中心背景"];
    
    [self creatTopView];
    
    UIView *centerView=[UIView new];
    [_scrollView addSubview:centerView];
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(5);
        make.width.mas_equalTo(_mainW-10);
        make.top.mas_equalTo(beiJing.mas_bottom).mas_equalTo(50);
        make.height.mas_equalTo(200);
    }];
    centerView.backgroundColor=[UIColor whiteColor];
    centerView.layer.masksToBounds=YES;
    centerView.layer.cornerRadius=5;
    [self creatCenterView:centerView];
    
    UIView *bottomView=[UIView new];
    [_scrollView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(5);
        make.width.mas_equalTo(_mainW-10);
        make.top.mas_equalTo(centerView.mas_bottom).mas_equalTo(10);
        make.height.mas_equalTo(150);
    }];
    bottomView.backgroundColor=[UIColor whiteColor];
    bottomView.layer.masksToBounds=YES;
    bottomView.layer.cornerRadius=5;
    [self creatBottomView:bottomView];

}
-(void)creatTopView{
    
    UIView *topView=[UIView new];
    [_scrollView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(_mainW-40);
        make.top.mas_equalTo(100);
        make.height.mas_equalTo(170);
    }];
    topView.backgroundColor=[UIColor whiteColor];
    topView.layer.masksToBounds=YES;
    topView.layer.cornerRadius=5;
    
    UIView  *beiJingImage=[UIView new];
    [_scrollView addSubview:beiJingImage];
    [beiJingImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(topView);
        make.width.height.mas_equalTo(80);
        make.top.mas_equalTo(60);
    }];
    beiJingImage.backgroundColor=[UIColor whiteColor];
    beiJingImage.layer.masksToBounds=YES;
    beiJingImage.layer.cornerRadius=40;
    
    UIImageView *userIamge=[UIImageView new];
    [_scrollView addSubview:userIamge];
    [userIamge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(beiJingImage);
        make.width.height.mas_equalTo(78);
    }];
    userIamge.layer.masksToBounds=YES;
    userIamge.layer.cornerRadius=39;
    NSString *wl_practice_photo=[_userDic objectForKey:@"wl_practice_photo"];
    if ([ZQTools charIsNil:wl_practice_photo]) {
        userIamge.image=[UIImage imageNamed:@"未登录头像"];
    }
    else
    {
        
    }
    userIamge.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToLogin:)];
    [userIamge addGestureRecognizer:tapGesture];
    
    UILabel *userLabel=[UILabel new];
    [topView addSubview:userLabel];
    [userLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(beiJingImage.mas_bottom).mas_equalTo(10);
    }];
    
    userLabel.text=@"登录/注册";
    userLabel.textColor=ColorWithRGB(49, 49, 49);
    userLabel.font=[UIFont systemFontOfSize:20];
    userLabel.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToLogin:)];
    [userLabel addGestureRecognizer:tapGesture2];

    
    UIView *yuEView=[UIView new];
    [topView addSubview:yuEView];
    [yuEView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.mas_equalTo(0);
        make.width.mas_equalTo((_mainW-40)/3);
        make.height.mas_equalTo(60);
    }];
    
    UILabel *numLAbel=[UILabel new];
    [yuEView addSubview:numLAbel];
    [numLAbel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(-15);
    }];
    NSNumber *waiter_balance=[_userDic objectForKey:@"waiter_balance"];
    
    numLAbel.text=[NSString stringWithFormat:@"%@",waiter_balance];
    numLAbel.textColor=ColorWithRGB(149, 149, 149);
    numLAbel.font=[UIFont systemFontOfSize:15];
    
    UILabel *yuELabel=[UILabel new];
    [yuEView addSubview:yuELabel];
    [yuELabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(15);
    }];
    yuELabel.text=@"余额(元)";
    yuELabel.font=[UIFont systemFontOfSize:15];
    yuELabel.textColor=ColorWithRGB(149, 149, 149);
    
    
    UIView *shouYiView=[UIView new];
    [topView addSubview:shouYiView];
    [shouYiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(yuEView.mas_right);
        make.width.mas_equalTo((_mainW-40)/3);
        make.height.mas_equalTo(60);
    }];
    
    UILabel *numLAbel2=[UILabel new];
    [shouYiView addSubview:numLAbel2];
    [numLAbel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(-15);
    }];
    NSNumber *waiter_line_income=[_userDic objectForKey:@"waiter_line_income"];
    numLAbel2.text=[NSString stringWithFormat:@"%@",waiter_line_income];
    numLAbel2.textColor=ColorWithRGB(149, 149, 149);
    numLAbel2.font=[UIFont systemFontOfSize:15];
    
    UILabel *shouYiELabel=[UILabel new];
    [shouYiView addSubview:shouYiELabel];
    [shouYiELabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(15);
    }];
    shouYiELabel.text=@"线下收益(元)";
    shouYiELabel.font=[UIFont systemFontOfSize:15];
    shouYiELabel.textColor=ColorWithRGB(149, 149, 149);
    
    
    UIView *tiXianView=[UIView new];
    [topView addSubview:tiXianView];
    [tiXianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(shouYiView.mas_right);
        make.width.mas_equalTo((_mainW-40)/3);
        make.height.mas_equalTo(60);
    }];
    
    UIImageView *tiXianImga=[UIImageView new];
    [tiXianView addSubview:tiXianImga];
    [tiXianImga mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(-15);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(18);
    }];
    tiXianImga.image=[UIImage imageNamed:@"提现"];
    tiXianImga.userInteractionEnabled=YES;
    UITapGestureRecognizer *tiXianTp = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToTiXian:)];
    [tiXianImga addGestureRecognizer:tiXianTp];
    
    UILabel *tiXianELabel=[UILabel new];
    [tiXianView addSubview:tiXianELabel];
    [tiXianELabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(15);
    }];
    tiXianELabel.text=@"提现";
    tiXianELabel.font=[UIFont systemFontOfSize:15];
    tiXianELabel.textColor=ColorWithRGB(149, 149, 149);
    tiXianELabel.userInteractionEnabled=YES;
    UITapGestureRecognizer *tiXianTp2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToTiXian:)];
    [tiXianELabel addGestureRecognizer:tiXianTp2];
}
-(void)creatCenterView:(UIView *)view{
    NSArray *nameArr=[NSArray arrayWithObjects:@"我的评价",@"我的收藏",@"成为专家",@"绑定银行卡", nil];
    for (int i=0; i<4; i++) {
        UIView *beiJingView=[UIView new];
        [view addSubview:beiJingView];
        [beiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(50);
            make.top.mas_equalTo(50*i);
        }];
        
        UIImageView *imageView=[UIImageView new];
        [beiJingView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(0);
            make.width.height.mas_equalTo(25);
        }];
        imageView.image=[UIImage imageNamed:nameArr[i]];
        
        UILabel *label=[UILabel new];
        [beiJingView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(15);
            make.centerY.mas_equalTo(0);
        }];
        label.text=nameArr[i];
        label.textColor=ColorWithRGB(49, 49, 49);
        label.font=[UIFont systemFontOfSize:16];
        
        UIImageView *jianTou=[UIImageView new];
        [beiJingView addSubview:jianTou];
        [jianTou mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.mas_equalTo(0);
            make.width.mas_equalTo(10);
            make.height.mas_equalTo(15);
        }];
        jianTou.image=[UIImage imageNamed:@"iconfont-fanhui-拷贝-3"];
    }
    
}
-(void)creatBottomView:(UIView *)view{
    NSArray *nameArr=[NSArray arrayWithObjects:@"消息",@"设置",@"意见反馈", nil];
    for (int i=0; i<3; i++) {
        UIView *beiJingView=[UIView new];
        [view addSubview:beiJingView];
        [beiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(50);
            make.top.mas_equalTo(50*i);
        }];
        
        UIImageView *imageView=[UIImageView new];
        [beiJingView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(0);
            make.width.height.mas_equalTo(25);
        }];
        imageView.image=[UIImage imageNamed:nameArr[i]];
        
        UILabel *label=[UILabel new];
        [beiJingView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(15);
            make.centerY.mas_equalTo(0);
        }];
        label.text=nameArr[i];
        label.textColor=ColorWithRGB(49, 49, 49);
        label.font=[UIFont systemFontOfSize:16];
        
        UIImageView *jianTou=[UIImageView new];
        [beiJingView addSubview:jianTou];
        [jianTou mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.mas_equalTo(0);
            make.width.mas_equalTo(10);
            make.height.mas_equalTo(15);
        }];
        jianTou.image=[UIImage imageNamed:@"iconfont-fanhui-拷贝-3"];
    }
    
}

-(void)pushToLogin:(UITapGestureRecognizer *)tap{
    if (_userDic.count==0) {
        _loginWithVc(self.viewController);
    }
    else{
        
        
    }
    
}

-(void)pushToTiXian:(UITapGestureRecognizer *)tap{
    tiXianViewController *tiXian=[[tiXianViewController alloc] init];
    [ZQTools pushNextViewController:self.viewController andRootController:tiXian];
}

@end
