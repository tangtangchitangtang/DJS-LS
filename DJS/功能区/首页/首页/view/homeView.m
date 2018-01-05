//
//  homeView.m
//  DJS
//
//  Created by mac on 2017/12/26.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "homeView.h"
#import "informationViewController.h"

@implementation homeView

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
    
    UIView *topView=[UIView new];
    [_scrollView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(_mainH*0.34+24);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(120);
    }];
    topView.backgroundColor=[UIColor whiteColor];
    [self creatTopView:topView];
    _scrollView.contentSize = CGSizeMake(0, _mainH*0.34+70+120);


}

-(void)creatTbaleView{
    UIView *view=[UIView new];
    [_scrollView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(100*_tableArr.count+50);
        make.top.mas_equalTo(_mainH*0.34+154);
    }];
    view.backgroundColor=[UIColor whiteColor];
    
    UIView *titleView=[UIView new];
    [view addSubview:titleView];
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    
    titleView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToInformation:)];
    [titleView addGestureRecognizer:tapGesture2];
    
    UIView *xianView=[UIView new];
    [titleView addSubview:xianView];
    [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(24);
        make.width.mas_equalTo(3);
    }];
    xianView.backgroundColor=_backgroundColor;
    
    UILabel *titleLabel=[UILabel new];
    [titleView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(xianView.mas_right).mas_equalTo(7);
        make.centerY.mas_equalTo(0);
    }];
    titleLabel.text=@"最新资讯";
    titleLabel.font=[UIFont systemFontOfSize:15];
    titleLabel.textColor=ColorWithRGB(90, 90, 90);
    
    UIImageView *imageView=[UIImageView new];
    [titleView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(20);
    }];
    imageView.image=[UIImage imageNamed:@"更多"];
    
    for (int i=0; i<_tableArr.count; i++) {
        NSDictionary *tableDic=_tableArr[i];
        UIView *beiJiView=[UIView new];
        [view addSubview:beiJiView];
        [beiJiView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(50+i*100);
            make.height.mas_equalTo(99);
        }];
        
        UIImageView *imageView=[UIImageView new];
        [beiJiView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.centerY.mas_equalTo(0);
            make.height.mas_equalTo(70);
            make.width.mas_equalTo(100);
        }];
        NSString *news_cover=[tableDic objectForKey:@"news_cover"];
        news_cover=[NSString stringWithFormat:@"%@%@",_addressUrl,news_cover];
        [imageView sd_setImageWithURL:[NSURL URLWithString:news_cover]];
        
        UILabel *tilteLabel2=[UILabel new];
        [beiJiView addSubview:tilteLabel2];
        [tilteLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.centerY.mas_equalTo(-30);
        }];
        tilteLabel2.text=[tableDic objectForKey:@"news_content"];
        tilteLabel2.font=[UIFont systemFontOfSize:16];
        tilteLabel2.textColor=ColorWithRGB(49, 49, 49);
        
        NSString *nt_name=[tableDic objectForKey:@"nt_name"];
        
        UILabel *nameLabel=[UILabel new];
        [beiJiView addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(tilteLabel2);
            make.width.mas_equalTo(70);
            make.centerY.mas_equalTo(20);
        }];
        nameLabel.text=[NSString stringWithFormat:@"【%@】",nt_name];
        nameLabel.font=[UIFont systemFontOfSize:14];
        nameLabel.textColor=ColorWithRGB(149, 149, 149);
        
        NSNumber *time=[tableDic objectForKey:@"news_time"];
        
        UILabel *timeLabel=[UILabel new];
        [beiJiView addSubview:timeLabel];
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-15);
            make.centerY.mas_equalTo(nameLabel);
        }];
        timeLabel.text=[ZQTools changeTimeCuo:@"yyyy.MM.dd":[NSString stringWithFormat:@"%@",time] ];
        timeLabel.font=[UIFont systemFontOfSize:14];
        timeLabel.textColor=ColorWithRGB(149, 149, 149);
        
        
        if (_tableArr.count-1!=i) {
            UIView *xianView=[UIView new];
            [view addSubview:xianView];
            [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(15);
                make.right.mas_equalTo(-15);
                make.height.mas_equalTo(1);
                make.top.mas_equalTo(beiJiView.mas_bottom);
            }];
            xianView.backgroundColor=_LightGrey;
        }
      
    }
    
    
    
}
-(void)creatLunBo{
    NSMutableArray *imageArr=[NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<_CarouselArr.count; i++) {
        NSDictionary *dic=_CarouselArr[i];
        NSString *imageStr=[dic objectForKey:@"carousel_img"];
        imageStr=[NSString stringWithFormat:@"%@%@",_addressUrl,imageStr];
        [imageArr addObject:imageStr];
    }
    
    [ZQTools getHederImage:CGRectMake(0, 24, _mainW,  _mainH*0.34) :imageArr :40 :_scrollView :^(int value) {
        NSLog(@"%d",value);
    }];
}

-(void)creatTopView:(UIView *)view{
    NSArray *nameArr=[NSArray arrayWithObjects:@"法律咨询",@"代写文书",@"案件委托",@"个性服务", nil];
    int index=0;
    for (int i=0; i<2; i++) {
        for (int j=0;j<2 ; j++) {
            UIView *beiJingView=[UIView new];
            [view addSubview:beiJingView];
            [beiJingView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(i*(_mainW)/2);
                make.width.mas_equalTo((_mainW)/2);
                make.top.mas_equalTo(j*60);
                make.height.mas_equalTo(60);
            }];
            
            UIImageView *image=[UIImageView new];
            [beiJingView addSubview:image];
            [image mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.centerX.mas_equalTo(-50);
                make.width.height.mas_equalTo(25);
            }];
            image.image=[UIImage imageNamed:nameArr[index]];
            
            UILabel *label=[UILabel new];
            [beiJingView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(image);
                make.left.mas_equalTo(image.mas_right).mas_equalTo(20);
            }];
            label.text=nameArr[index];
            label.textColor=ColorWithRGB(49, 49, 49);
            label.font=[UIFont systemFontOfSize:16];
            index+=1;
        }
    }
    UIView *xianView=[UIView new];
    [view addSubview:xianView];
    [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
        make.centerY.mas_equalTo(0);
    }];
    xianView.backgroundColor=_LightGrey;
    
    UIView *xianView2=[UIView new];
    [view addSubview:xianView2];
    [xianView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(1);
    }];
    xianView2.backgroundColor=_LightGrey;
}

-(void)pushToInformation:(UITapGestureRecognizer *)tap{
    informationViewController *information=[[informationViewController alloc] init];
    [ZQTools pushNextViewController:self.viewController andRootController:information];
}


@end
