//
//  tiXianView.h
//  DJS
//
//  Created by mac on 2017/12/27.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "BaseView.h"

@interface tiXianView : BaseView<UITextFieldDelegate>
@property(nonatomic,strong)NSMutableArray<UIImageView *> *imageArr;
@property(nonatomic,assign)BOOL slectPay;
@property(nonatomic,strong)UITextField *numText,*nameText,*qianText;
@end
