//
//  informationView.h
//  DJS
//
//  Created by mac on 2017/12/28.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "BaseView.h"

@interface informationView : BaseView<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray *titleArr;
@property(nonatomic,strong)NSMutableArray<UILabel *> *labelArr;
@property(nonatomic,strong)NSMutableArray<UIView *> *xianView;
@property(nonatomic,strong)NSMutableArray<UITableView *> *tableArr;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIScrollView *topScrollView;
@property(nonatomic,assign)int index;
@property(nonatomic,strong)NSNumber *page;



@end
