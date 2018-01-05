//
//  LawListView.h
//  DJS
//
//  Created by 浪尖渝力 on 2018/1/5.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "BaseView.h"

@interface LawListView : BaseView<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property(nonatomic,strong)UILabel *Btn1,*Btn2,*Btn3;
@property(nonatomic,strong)UIImageView *imageView1,*imageView2,*imageView3;
@property(nonatomic,strong)BaseTableView *tabelView1,*tabelView2,*tabelView3;
@property(nonatomic,strong) UIScrollView *scrollView;

@property(nonatomic,assign)int abc;

@property(nonatomic,strong)NSMutableArray *tableArr1,*tableArr2,*tableArr3;

@property(nonatomic,assign)int total1,total2,total3;
@property(nonatomic,assign) int page1,page2,page3;

@end
