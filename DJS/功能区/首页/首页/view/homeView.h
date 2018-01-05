//
//  homeView.h
//  DJS
//
//  Created by mac on 2017/12/26.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "BaseView.h"

@interface homeView : BaseView
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)NSArray *CarouselArr;
@property(nonatomic,strong)NSArray *tableArr;
-(void)creatLunBo;
-(void)creatTbaleView;
@end
