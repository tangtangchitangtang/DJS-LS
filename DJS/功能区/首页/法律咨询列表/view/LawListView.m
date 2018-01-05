

//
//  LawListView.m
//  DJS
//
//  Created by 浪尖渝力 on 2018/1/5.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "LawListView.h"
#import "LawListViewTableViewCell.h"

@implementation LawListView

-(void)creatView{
    self.backgroundColor=_LightGrey;
    UIView *topView=[UIView new];
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(45);
    }];
    topView.backgroundColor=[UIColor whiteColor];
    
    _Btn1=[UILabel new];
    [topView addSubview:_Btn1];
    [_Btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(-_mainW/4);
    }];
    _Btn1.text=@"带接受";
    _Btn1.font=[UIFont fontWithName:@"Helvetica" size:15 ];
    
    _Btn1.userInteractionEnabled=YES;
    _Btn1.tag=0;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectZhuangTai:)];
    [_Btn1 addGestureRecognizer:tapGesture];


    _imageView1=[UIImageView new];
    [topView addSubview:_imageView1];
    [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(_Btn1);
        make.height.width.mas_equalTo(6);
    }];
    _imageView1.image=[UIImage imageNamed:@"三角形"];
    
    
    _Btn2=[UILabel new];
    [topView addSubview:_Btn2];
    [_Btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
    }];
    _Btn2.text=@"进行中";
    _Btn2.font=[UIFont fontWithName:@"Helvetica" size:15];
    _Btn2.userInteractionEnabled=YES;
    _Btn2.tag=1;
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectZhuangTai:)];
    [_Btn2 addGestureRecognizer:tapGesture2];
    
    _imageView2=[UIImageView new];
    [topView addSubview:_imageView2];
    [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(_Btn2);
        make.height.width.mas_equalTo(6);
    }];
    _imageView2.image=[UIImage imageNamed:@"三角形"];
    
    _Btn3=[UILabel new];
    [topView addSubview:_Btn3];
    [_Btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(_mainW/4);
    }];
    _Btn3.text=@"已完成";
    _Btn3.font=[UIFont fontWithName:@"Helvetica" size:15 ];
    
    _Btn3.userInteractionEnabled=YES;
    _Btn3.tag=2;
    
    UITapGestureRecognizer *tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectZhuangTai:)];
    [_Btn3 addGestureRecognizer:tapGesture3];
    
    
    _imageView3=[UIImageView new];
    [topView addSubview:_imageView3];
    [_imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(_Btn3);
        make.height.width.mas_equalTo(6);
    }];
    _imageView3.image=[UIImage imageNamed:@"三角形"];
    
    
    _scrollView=[UIScrollView new];
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom).mas_equalTo(6);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    _scrollView.scrollsToTop = NO;
    _scrollView.contentSize = CGSizeMake(_mainW*3, 0);
    _scrollView.showsVerticalScrollIndicator = FALSE;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    _scrollView.pagingEnabled=YES;
    _scrollView.bounces = NO;
    _scrollView.delegate=self;
    _scrollView.tag=10;
    
    _tabelView1=[BaseTableView new];
    [_scrollView addSubview:_tabelView1];
    [_tabelView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(_mainH-115);
    }];
    _tabelView1.tag=1;
    _tabelView1.delegate=self;
    _tabelView1.dataSource=self;
    
    _tabelView2=[BaseTableView new];
    [_scrollView addSubview:_tabelView2];
    [_tabelView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(_mainW);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(_mainH-115);
    }];
    _tabelView2.tag=2;
    _tabelView2.delegate=self;
    _tabelView2.dataSource=self;
    
    _tabelView3=[BaseTableView new];
    [_scrollView addSubview:_tabelView3];
    [_tabelView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(_mainW*2);
        make.width.mas_equalTo(_mainW);
        make.height.mas_equalTo(_mainH-115);
    }];
    _tabelView3.tag=3;
    _tabelView3.delegate=self;
    _tabelView3.dataSource=self;
    
    if (_abc==0) {
        
        _scrollView.contentOffset=CGPointMake(0, 0);
        _Btn1.textColor=_backgroundColor;
        _Btn2.textColor=ColorWithRGB(50, 50, 50);
        _Btn3.textColor=ColorWithRGB(50, 50, 50);
       
        
        _imageView1.hidden=NO;
        _imageView2.hidden=YES;
        _imageView3.hidden=YES;
        
    }
    if (_abc==1) {
        _scrollView.contentOffset=CGPointMake(_mainW, 0);
        
        _Btn1.textColor=ColorWithRGB(50, 50, 50);
        _Btn2.textColor=_backgroundColor;
        _Btn3.textColor=ColorWithRGB(50, 50, 50);
        
        
        _imageView1.hidden=YES;
        _imageView2.hidden=NO;
        _imageView3.hidden=YES;
    }
    if (_abc==2) {
        _scrollView.contentOffset=CGPointMake(_mainW*2, 0);
        _Btn1.textColor=ColorWithRGB(50, 50, 50);
        _Btn2.textColor=ColorWithRGB(50, 50, 50);
        _Btn3.textColor=_backgroundColor;
        
        
        _imageView1.hidden=YES;
        _imageView2.hidden=YES;
        _imageView3.hidden=NO;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    if (tableView.tag==1) {
        return _tableArr1.count;
    }else if (tableView.tag==2) {
        return _tableArr2.count;
    }else if (tableView.tag==3) {
        return _tableArr3.count;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LawListViewTableViewCell *cell=[[LawListViewTableViewCell alloc] init];
    
    if (tableView.tag==1) {
        cell.tableDic=_tableArr1[indexPath.row];
    }else if (tableView.tag==2) {
        cell.tableDic=_tableArr2[indexPath.row];
    }else if (tableView.tag==3) {
        cell.tableDic=_tableArr3[indexPath.row];
    }
    [cell creatView];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag==10) {
        
        CGPoint points=scrollView.contentOffset;
        int pages=points.x/_mainW;
        _abc=pages;
        if (pages==0) {
            _Btn1.textColor=_backgroundColor;
            _Btn2.textColor=ColorWithRGB(50, 50, 50);
            _Btn3.textColor=ColorWithRGB(50, 50, 50);
           
            _imageView1.hidden=NO;
            _imageView2.hidden=YES;
            _imageView3.hidden=YES;
            
        }
        if (pages==1) {
            _Btn1.textColor=ColorWithRGB(50, 50, 50);
            _Btn2.textColor=_backgroundColor;
            _Btn3.textColor=ColorWithRGB(50, 50, 50);
            
            _imageView1.hidden=YES;
            _imageView2.hidden=NO;
            _imageView3.hidden=YES;
        }
        if (pages==2) {
            _Btn1.textColor=ColorWithRGB(50, 50, 50);
            _Btn2.textColor=ColorWithRGB(50, 50, 50);
            _Btn3.textColor=_backgroundColor;
            
            _imageView1.hidden=YES;
            _imageView2.hidden=YES;
            _imageView3.hidden=NO;
            
        }
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.tag==10) {
//        [self LoginDic1];
        
    }
}
-(void)selectZhuangTai:(UITapGestureRecognizer *)tap{
    _abc=(int)tap.view.tag;
    if (tap.view.tag==0) {
        
        _scrollView.contentOffset=CGPointMake(0, 0);
        _Btn1.textColor=_backgroundColor;
        _Btn2.textColor=ColorWithRGB(50, 50, 50);
        _Btn3.textColor=ColorWithRGB(50, 50, 50);
        
        _imageView1.hidden=NO;
        _imageView2.hidden=YES;
        _imageView3.hidden=YES;
        
    }
    if (tap.view.tag==1) {
        _scrollView.contentOffset=CGPointMake(_mainW, 0);
        
        _Btn1.textColor=ColorWithRGB(50, 50, 50);
        _Btn2.textColor=_backgroundColor;
        _Btn3.textColor=ColorWithRGB(50, 50, 50);
        
        _imageView1.hidden=YES;
        _imageView2.hidden=NO;
        _imageView3.hidden=YES;
    }
    if (tap.view.tag==2) {
        _scrollView.contentOffset=CGPointMake(_mainW*2, 0);
        _Btn1.textColor=ColorWithRGB(50, 50, 50);
        _Btn2.textColor=ColorWithRGB(50, 50, 50);
        _Btn3.textColor=_backgroundColor;
        
        _imageView1.hidden=YES;
        _imageView2.hidden=YES;
        _imageView3.hidden=NO;
        
    }
    
//    [self LoginDic1];
}
@end
