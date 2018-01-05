//
//  tiXianView.m
//  DJS
//
//  Created by mac on 2017/12/27.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "tiXianView.h"

@implementation tiXianView

-(void)creatView{
    self.backgroundColor=[UIColor whiteColor];
    _slectPay=YES;
    UIView *shouKuanView=[UIView new];
    [self addSubview:shouKuanView];
    [shouKuanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(64);
        make.height.mas_equalTo(50);
    }];
    UILabel *shouKuaLabel=[UILabel new];
    [shouKuanView addSubview:shouKuaLabel];
    [shouKuaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    shouKuaLabel.text=@"收款方式";
    shouKuaLabel.textColor=ColorWithRGB(49, 49, 49);
    shouKuaLabel.font=[UIFont systemFontOfSize:16];
    
    UILabel *yingHangLabel=[UILabel new];
    [shouKuanView addSubview:yingHangLabel];
    [yingHangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(50);
    }];
    yingHangLabel.text=@"银行卡";
    yingHangLabel.textColor=ColorWithRGB(149, 149, 149);
    yingHangLabel.font=[UIFont systemFontOfSize:14];
    
    _imageArr=[NSMutableArray arrayWithCapacity:0];
    UIImageView *imageView=[UIImageView new];
    [shouKuanView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(yingHangLabel.mas_left).mas_equalTo(-5);
        make.width.height.mas_equalTo(20);
        make.centerY.mas_equalTo(0);
    }];
    
    
    
    UILabel *zhiFuBaoLabel=[UILabel new];
    [shouKuanView addSubview:zhiFuBaoLabel];
    [zhiFuBaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(imageView.mas_left).mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(50);
    }];
    zhiFuBaoLabel.text=@"支付宝";
    zhiFuBaoLabel.textColor=ColorWithRGB(149, 149, 149);
    zhiFuBaoLabel.font=[UIFont systemFontOfSize:14];
    
    
    UIImageView *imageView2=[UIImageView new];
    [shouKuanView addSubview:imageView2];
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(zhiFuBaoLabel.mas_left).mas_equalTo(-5);
        make.width.height.mas_equalTo(20);
        make.centerY.mas_equalTo(0);
    }];
    if (_slectPay) {
        imageView2.image=[UIImage imageNamed:@"是"];
        imageView.image=[UIImage imageNamed:@"否"];
    }
    [_imageArr addObject:imageView];
    [_imageArr addObject:imageView2];
    
    UIView *xianView=[UIView new];
    [self addSubview:xianView];
    [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(shouKuanView.mas_bottom);
    }];
    xianView.backgroundColor=_LightGrey;
    
    UIView *zhanHaoView=[UIView new];
    [self addSubview:zhanHaoView];
    [zhanHaoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(xianView.mas_bottom);
    }];
    
    UILabel *zhangHaoLabel=[UILabel new];
    [zhanHaoView addSubview:zhangHaoLabel];
    [zhangHaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    zhangHaoLabel.text=@"收款账号";
    zhangHaoLabel.textColor=ColorWithRGB(49, 49, 49);
    zhangHaoLabel.font=[UIFont systemFontOfSize:16];
    
    _numText=[UITextField new];
    [zhanHaoView addSubview:_numText];
    [_numText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(250);
    }];
    _numText.placeholder=@"请输入账号";
    _numText.textColor=ColorWithRGB(49, 49, 49);
    _numText.font=[UIFont systemFontOfSize:16];
    _numText.delegate=self;
    _numText.returnKeyType=UIReturnKeyDone;
    _numText.textAlignment=NSTextAlignmentRight;
    
    UIView *xianView2=[UIView new];
    [self addSubview:xianView2];
    [xianView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.mas_equalTo(xianView);
        make.top.mas_equalTo(zhanHaoView.mas_bottom);
    }];
    xianView2.backgroundColor=_LightGrey;
    
    UIView *nameView=[UIView new];
    [self addSubview:nameView];
    [nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(xianView2.mas_bottom);
    }];
    
    UILabel *nameLabel=[UILabel new];
    [nameView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    nameLabel.text=@"账号收款人";
    nameLabel.textColor=ColorWithRGB(49, 49, 49);
    nameLabel.font=[UIFont systemFontOfSize:16];
    
    _nameText=[UITextField new];
    [nameView addSubview:_nameText];
    [_nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(250);
    }];
    _nameText.placeholder=@"请输入账号收款人的真实姓名";
    _nameText.textColor=ColorWithRGB(49, 49, 49);
    _nameText.font=[UIFont systemFontOfSize:16];
    _nameText.delegate=self;
    _nameText.returnKeyType=UIReturnKeyDone;
    _nameText.textAlignment=NSTextAlignmentRight;
    
    UIView *xianView3=[UIView new];
    [self addSubview:xianView3];
    [xianView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.mas_equalTo(xianView);
        make.top.mas_equalTo(nameView.mas_bottom);
    }];
    xianView3.backgroundColor=_LightGrey;
    
    UIView *qianView=[UIView new];
    [self addSubview:qianView];
    [qianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(xianView3.mas_bottom);
    }];
    
    UILabel *qianLabel=[UILabel new];
    [qianView addSubview:qianLabel];
    [qianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    qianLabel.text=@"提现金额";
    qianLabel.textColor=ColorWithRGB(49, 49, 49);
    qianLabel.font=[UIFont systemFontOfSize:16];
    
    _qianText=[UITextField new];
    [qianView addSubview:_qianText];
    [_qianText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(250);
    }];
    _qianText.placeholder=@"请输入提现金额，可提现金额300.00元";
    _qianText.textColor=ColorWithRGB(49, 49, 49);
    _qianText.font=[UIFont systemFontOfSize:16];
    _qianText.delegate=self;
    _qianText.returnKeyType=UIReturnKeyDone;
    _qianText.textAlignment=NSTextAlignmentRight;
    _qianText.keyboardType=UIKeyboardTypeNumberPad;
    
    UIView *xianView4=[UIView new];
    [self addSubview:xianView4];
    [xianView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.mas_equalTo(xianView);
        make.top.mas_equalTo(qianView.mas_bottom);
    }];
    xianView4.backgroundColor=_LightGrey;
    
    UILabel *tiShiLabel=[UILabel new];
    [self addSubview:tiShiLabel];
    [tiShiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(xianView4.mas_bottom).mas_equalTo(20);
    }];
    tiShiLabel.text=@"温馨提示:一次提现最多1000元";
    tiShiLabel.textColor=_backgroundColor;
    tiShiLabel.font=[UIFont systemFontOfSize:14];
    
    UIButton *loginBtn=[UIButton new];
    [self addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(tiShiLabel.mas_bottom).mas_equalTo(50);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(_mainW-20);
    }];
    loginBtn.layer.cornerRadius=14;
    loginBtn.backgroundColor=ColorWithRGB(189, 156, 104);
    [loginBtn setTitle:@"申请提现" forState:0];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:0];
    [loginBtn addTarget:self action:@selector(loginBtn:) forControlEvents:UIControlEventTouchUpInside];
    }

-(IBAction)loginBtn:(id)sender{
    NSDictionary *userDic = [NSKeyedUnarchiver unarchiveObjectWithFile:_userModelFile];
    NSString *token=[userDic objectForKey:@"token"];
    NSNumber *waiter_id1=[userDic objectForKey:@"waiter_id"];
    NSString *waiter_id=[NSString stringWithFormat:@"%@",waiter_id1];
    
    NSString *cash_type=@"0";
    NSString *cash_account=_numText.text;
    NSString *cash_money=_qianText.text;
    
    if (cash_money.intValue<=0||[ZQTools charIsNil:cash_money]) {
        [ZQTools svpInfo:@"请输入提现金额"];
        return;
    }
    if (cash_money.intValue>1000) {
        [ZQTools svpInfo:@"每次体现金额最多为1000"];
        return;
    }
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:token,@"token",@"1",@"user_role",waiter_id,@"waiter_id",cash_type,@"cash_type",cash_account,@"cash_account",cash_money,@"cash_money", nil];
    [ZQTools AFNPostDataUrl:@"waiter/account/cash_apply" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        NSLog(@"%@",responseObject);
    } anderrorBlock:nil];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string{
    if ([[[UITextInputMode currentInputMode]primaryLanguage] isEqualToString:@"emoji"]) {
        return NO;
    }
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
