
//
//  informationView.m
//  DJS
//
//  Created by mac on 2017/12/28.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "informationView.h"
#import "informationTableViewCell.h"
#import "detailsConsultationViewController.h"
@implementation informationView

-(void)creatView{
    self.backgroundColor=_LightGrey;
    _index=0;
    
    UIView *topView=[UIView new];
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(45);
        make.top.mas_equalTo(64);
    }];
    topView.backgroundColor=[UIColor whiteColor];
    
    _topScrollView=[UIScrollView new];
    [topView addSubview:_topScrollView];
    [_topScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(-70);
        make.bottom.mas_equalTo(0);
    }];
    _topScrollView.scrollsToTop = NO;
    _topScrollView.contentSize = CGSizeMake(_titleArr.count*100, 0);
    _topScrollView.showsVerticalScrollIndicator = FALSE;
    _topScrollView.showsHorizontalScrollIndicator = FALSE;

    _labelArr=[NSMutableArray arrayWithCapacity:0];
    _xianView=[NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<_titleArr.count; i++) {
        NSDictionary *dic=_titleArr[i];
        UIView *titleView=[UIView new];
        [_topScrollView addSubview:titleView];
        [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(i*100);
            make.width.mas_equalTo(100);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(45);
        }];
        
        UILabel *label=[UILabel new];
        [titleView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
        }];
        label.text=[dic objectForKey:@"nt_name"];
        label.tag=i;
        label.textAlignment=NSTextAlignmentCenter;
        label.font=[UIFont systemFontOfSize:16];
        label.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dianJi:)];
        [label addGestureRecognizer:tapGesture];

        CGSize size=[ZQTools getNSStringWeight:[dic objectForKey:@"nt_name"] andViewWight:20 andFont:16];
        
        UIView *xianView=[UIView new];
        [titleView addSubview:xianView];
        [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(label);
            make.width.mas_equalTo(size.width);
            make.height.mas_equalTo(1.5);
            make.bottom.mas_equalTo(0);
        }];
        if (_index==i) {
            label.textColor=_backgroundColor;
            xianView.backgroundColor=_backgroundColor;
        }
        else{
            label.textColor=ColorWithRGB(49, 49, 49);
            xianView.backgroundColor=[UIColor clearColor];
        }
        [_xianView addObject:xianView];
        [_labelArr addObject:label];
    }
    _scrollView=[UIScrollView new];
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_topScrollView.mas_bottom).mas_equalTo(10);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    _scrollView.scrollsToTop = NO;
    _scrollView.contentSize = CGSizeMake(_mainW*_titleArr.count, 0);
    _scrollView.showsVerticalScrollIndicator = FALSE;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    _scrollView.pagingEnabled=YES;
    _scrollView.bounces = NO;
    _scrollView.delegate=self;
    _scrollView.tag=100;
    _tableArr=[NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<_titleArr.count; i++) {
        UITableView *tableView=[UITableView new];
        [_scrollView addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(_mainW);
            make.left.mas_equalTo(_mainW*i);
            make.height.mas_equalTo(_mainH-119);
        }];
        tableView.tag=i;
        tableView.delegate=self;
        tableView.dataSource=self;
        tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        [_tableArr addObject:tableView];
    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
   return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    informationTableViewCell *cell=[[informationTableViewCell alloc] init];
   
    cell.dic=_dataArr[indexPath.row];

    [cell creatView];
    //    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic=_dataArr[indexPath.row];
    NSNumber *news_id=[dic objectForKey:@"news_id"];
    detailsConsultationViewController *details=[[detailsConsultationViewController alloc] init];
    details.news_id=[NSString stringWithFormat:@"%@",news_id];
    [ZQTools pushNextViewController:self.viewController andRootController:details];
    
                              
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag==100) {
        
        CGPoint points=scrollView.contentOffset;
        int pages=points.x/_mainW;
        _index=pages;
  
        if (pages<2) {
            _topScrollView.contentOffset=CGPointMake(0, 0);
        }
        else{
            _topScrollView.contentOffset=CGPointMake((pages-1)*100, 0);
        }
        for (int i=0; i<_titleArr.count; i++) {
            UILabel *label=_labelArr[i];
            UIView *xianView=_xianView[i];
            if (i==pages) {
                label.textColor=_backgroundColor;
                xianView.backgroundColor=_backgroundColor;
            }
            else{
                label.textColor=ColorWithRGB(49, 49, 49);
                xianView.backgroundColor=[UIColor clearColor];
            }
            
        }
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.tag==100) {
        [self loadDate];
        
    }
    
    
}
-(void)dianJi:(UITapGestureRecognizer *) tap{
    int abc=(int)tap.view.tag;
    _index=abc;
    if (abc<2) {
        _topScrollView.contentOffset=CGPointMake(0, 0);
    }
    else{
        _topScrollView.contentOffset=CGPointMake((abc-1)*100, 0);
    }
    _scrollView.contentOffset=CGPointMake(abc*_mainW, 0);
    for (int i=0; i<_titleArr.count; i++) {
        UILabel *label=_labelArr[i];
        UIView *xianView=_xianView[i];
        if (i==abc) {
            label.textColor=_backgroundColor;
            xianView.backgroundColor=_backgroundColor;
        }
        else{
            label.textColor=ColorWithRGB(49, 49, 49);
            xianView.backgroundColor=[UIColor clearColor];
        }
        
    }
     [self loadDate];
    
}
-(void)loadDate{
    UITableView *tableView=_tableArr[_index];
    [_dataArr removeAllObjects];
    NSDictionary *typeDic=_titleArr[_index];
    NSNumber *nt_id=[typeDic objectForKey:@"nt_id"];
    NSString *news_nt_id=[NSString stringWithFormat:@"%@",nt_id];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"0",@"page",news_nt_id,@"news_nt_id",@"10",@"pagesize", nil];
    [ZQTools AFNPostDataUrl:@"api/index/news_list" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        
        NSArray *typeArr=responseObject;
        _dataArr=[NSMutableArray arrayWithArray:typeArr];
        [tableView reloadData];
    } anderrorBlock:nil];
}

@end
