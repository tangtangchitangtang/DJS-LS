
//
//  informationTableViewCell.m
//  DJS
//
//  Created by 浪尖渝力 on 2018/1/5.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "informationTableViewCell.h"

@implementation informationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)creatView{

    
    UIImageView *imageView=[UIImageView new];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(70);
        make.width.mas_equalTo(100);
    }];
    NSString *news_cover=[_dic objectForKey:@"news_cover"];
    news_cover=[NSString stringWithFormat:@"%@%@",_addressUrl,news_cover];
    [imageView sd_setImageWithURL:[NSURL URLWithString:news_cover]];
    
    UILabel *tilteLabel2=[UILabel new];
    [self addSubview:tilteLabel2];
    [tilteLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageView.mas_right).mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(-30);
    }];
    tilteLabel2.text=[_dic objectForKey:@"news_content"];
    tilteLabel2.font=[UIFont systemFontOfSize:16];
    tilteLabel2.textColor=ColorWithRGB(49, 49, 49);
    
    NSString *nt_name=[_dic objectForKey:@"nt_name"];
    
    UILabel *nameLabel=[UILabel new];
    [self addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(tilteLabel2);
        make.width.mas_equalTo(70);
        make.centerY.mas_equalTo(20);
    }];
    nameLabel.text=[NSString stringWithFormat:@"【%@】",nt_name];
    nameLabel.font=[UIFont systemFontOfSize:14];
    nameLabel.textColor=ColorWithRGB(149, 149, 149);
    
    NSNumber *time=[_dic objectForKey:@"news_time"];
    
    UILabel *timeLabel=[UILabel new];
    [self addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(nameLabel);
    }];
    timeLabel.text=[ZQTools changeTimeCuo:@"yyyy.MM.dd":[NSString stringWithFormat:@"%@",time] ];
    timeLabel.font=[UIFont systemFontOfSize:14];
    timeLabel.textColor=ColorWithRGB(149, 149, 149);


}
@end
