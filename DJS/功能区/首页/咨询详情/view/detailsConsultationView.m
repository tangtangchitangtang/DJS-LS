//
//  detailsConsultationView.m
//  DJS
//
//  Created by 浪尖渝力 on 2018/1/5.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "detailsConsultationView.h"

@implementation detailsConsultationView

-(void)creatView{
    self.backgroundColor=[UIColor whiteColor];
    
    _scrollView=[UIScrollView new];
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    _scrollView.scrollsToTop =NO;
    _scrollView.showsVerticalScrollIndicator = FALSE;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    _scrollView.bounces = NO;
    
    UIImageView *imageView=[UIImageView new];
    [_scrollView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(_mainH*0.25);
    }];
    NSString *news_cover=[_dic objectForKey:@"news_cover"];
    NSURL *imageURL=[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",_addressUrl,news_cover]];
    [imageView sd_setImageWithURL:imageURL];
    
    NSString *news_title=[_dic objectForKey:@"news_title"];
    
    CGSize size1=[ZQTools getNSStringSize:news_title andViewWight:_mainW-30 andFont:20];
    
    UILabel *titleLabel=[UILabel new];
    [_scrollView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(imageView);
        make.top.mas_equalTo(imageView.mas_bottom).mas_equalTo(20);
        make.width.mas_equalTo(_mainW-30);
    }];
    titleLabel.numberOfLines=0;
    titleLabel.text=news_title;
    titleLabel.textColor=ColorWithRGB(49, 49, 49);
    titleLabel.font=[UIFont systemFontOfSize:20];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    
    NSString *news_author=[_dic objectForKey:@"news_author"];
    UILabel *authorLabel=[UILabel new];
    [_scrollView addSubview:authorLabel];
    [authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLabel);
        make.top.mas_equalTo(titleLabel.mas_bottom).mas_equalTo(25);
        make.width.mas_equalTo(_mainW/2-40);
    }];
    authorLabel.numberOfLines=0;
    authorLabel.textColor=ColorWithRGB(149, 149, 149);
    authorLabel.font=[UIFont systemFontOfSize:16];
    authorLabel.textAlignment=NSTextAlignmentCenter;
    authorLabel.text=[NSString stringWithFormat:@"作者:%@",news_author];
    
    NSNumber *time=[_dic objectForKey:@"news_time"];
    
    UILabel *timeLabel=[UILabel new];
    [_scrollView addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(titleLabel);
        make.centerY.mas_equalTo(authorLabel);
        make.width.mas_equalTo(_mainW/2-40);
    }];
    timeLabel.numberOfLines=0;
    NSString *news_time=[ZQTools changeTimeCuo:@"yyyy-MM-dd HH:mm":[NSString stringWithFormat:@"%@",time] ];
    timeLabel.text=[NSString stringWithFormat:@"发布时间:%@",news_time];
    timeLabel.font=[UIFont systemFontOfSize:16];
    timeLabel.textColor=ColorWithRGB(149, 149, 149);
    timeLabel.textAlignment=NSTextAlignmentCenter;
    
    NSString *news_content=[_dic objectForKey:@"news_content"];
    
    CGSize size2=[ZQTools getNSStringSize:[NSString stringWithFormat:@"\t%@",news_content] andViewWight:_mainW-30 andFont:18];
    
    UILabel *contentLabel=[UILabel new];
    [_scrollView addSubview:contentLabel];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(imageView);
        make.top.mas_equalTo(timeLabel.mas_bottom).mas_equalTo(15);
        make.width.mas_equalTo(_mainW-30);
    }];
    contentLabel.numberOfLines=0;
    contentLabel.text= [NSString stringWithFormat:@"\t%@",news_content];
    contentLabel.textColor=ColorWithRGB(99, 99, 99);
    contentLabel.font=[UIFont systemFontOfSize:18];
    
    _scrollView.contentSize = CGSizeMake(0,_mainH*0.25+120+size1.height+size2.height);
}

@end
