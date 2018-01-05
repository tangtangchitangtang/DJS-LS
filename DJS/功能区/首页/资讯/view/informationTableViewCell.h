//
//  informationTableViewCell.h
//  DJS
//
//  Created by 浪尖渝力 on 2018/1/5.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface informationTableViewCell : BaseTableViewCell
@property(nonatomic,strong)NSDictionary *dic;
-(void)creatView;

@end
