//
//  forgetView.h
//  DJS
//
//  Created by mac on 2017/12/26.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "BaseView.h"

@interface forgetView : BaseView<UITextFieldDelegate>
@property(nonatomic,strong)NSString *forgetStr;
@property(nonatomic,strong)UITextField *phoneText,*codeText,*pwdText;
@property(nonatomic,strong) UIButton *codeBtn;
@property(nonatomic,assign)int timeTick;
@property(nonatomic,strong)NSTimer *timer;
@end
