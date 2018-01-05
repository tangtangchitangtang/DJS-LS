//
//  registerView.m
//  DJS
//
//  Created by mac on 2017/12/25.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "registerView.h"

@implementation registerView

-(void)creatView{
    UILabel *topLabel=[UILabel new];
    [self addSubview:topLabel];
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(75);
    }];
    topLabel.text=@"温馨提示：律师可申请成为专家";
    topLabel.font=[UIFont systemFontOfSize:14];
    topLabel.textColor=ColorWithRGB(186, 151, 89);
    
    _imageArr = [NSMutableArray  arrayWithCapacity:0];
    
    
    UIView *xianView=[UIView new];
    [self addSubview:xianView];
    [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(148);
        make.width.mas_equalTo(160);
        make.height.mas_equalTo(4);
    }];
    xianView.backgroundColor=ColorWithRGB(220, 220, 220);
    
    UIImageView *LvSiIamge=[UIImageView new];
    [self addSubview:LvSiIamge];
    [LvSiIamge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(-80);
        make.top.mas_equalTo(120);
        make.width.height.mas_equalTo(60);
    }];
    LvSiIamge.image=[UIImage imageNamed:@"律师圈-"];
    [_imageArr addObject:LvSiIamge];
    
    UILabel *lvShiLabel=[UILabel new];
    [self addSubview:lvShiLabel];
    [lvShiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(LvSiIamge);
        make.top.mas_equalTo(LvSiIamge.mas_bottom).mas_equalTo(15);
    }];
    lvShiLabel.text=@"成为律师";
    lvShiLabel.font=[UIFont systemFontOfSize:16];
    lvShiLabel.textColor=ColorWithRGB(149, 149, 149);
    
    UIImageView *zhuanJiaImgae=[UIImageView new];
    [self addSubview:zhuanJiaImgae];
    [zhuanJiaImgae mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(80);
        make.centerY.mas_equalTo(LvSiIamge);
        make.width.height.mas_equalTo(30);
    }];
    zhuanJiaImgae.layer.cornerRadius=15;
    zhuanJiaImgae.backgroundColor=ColorWithRGB(220, 220, 220);
    
    UILabel *zhanJiaLabel=[UILabel new];
    [self addSubview:zhanJiaLabel];
    [zhanJiaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(zhuanJiaImgae);
        make.top.mas_equalTo(LvSiIamge.mas_bottom).mas_equalTo(15);
    }];
    zhanJiaLabel.text=@"成为专家";
    zhanJiaLabel.font=[UIFont systemFontOfSize:16];
    zhanJiaLabel.textColor=ColorWithRGB(149, 149, 149);
    
    UIImageView *phoneImage=[UIImageView new];
    [self addSubview:phoneImage];
    [phoneImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(18);
        make.height.mas_equalTo(25);
        make.top.mas_equalTo(lvShiLabel.mas_bottom).mas_equalTo(40);
    }];
    phoneImage.image=[UIImage imageNamed:@"手机-(3)"];
    
    _phoneText=[UITextField new];
    [self addSubview:_phoneText];
    [_phoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(phoneImage.mas_right).mas_equalTo(20);
        make.centerY.mas_equalTo(phoneImage);
        make.width.mas_equalTo(240);
        make.height.mas_equalTo(40);
    }];
    _phoneText.delegate=self;
    _phoneText.placeholder=@"手机号";
    _phoneText.textColor=ColorWithRGB(49, 49, 49);
    _phoneText.font=[UIFont systemFontOfSize:19];
    _phoneText.returnKeyType=UIReturnKeyDone;
    _phoneText.keyboardType=UIKeyboardTypePhonePad;
    
    
    _codeBtn=[UIButton new];
    [self addSubview:_codeBtn];
    [_codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.width.mas_equalTo(-15);
        make.height.mas_equalTo(35);
        make.width.mas_equalTo(130);
        make.centerY.mas_equalTo(_phoneText);
    }];
    _codeBtn.layer.masksToBounds=YES;
    _codeBtn.layer.cornerRadius=5;
    _codeBtn.layer.borderWidth=1;
    _codeBtn.layer.borderColor=ColorWithRGB(230, 230, 230).CGColor;
    [_codeBtn setTitle:@"发送验证码" forState:0];
    [_codeBtn setTitleColor:ColorWithRGB(49, 49, 49) forState:0];
    _codeBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    [_codeBtn  addTarget:self action:@selector(huoQuYanZhen:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *xianView2=[UIView new];
    [self addSubview:xianView2];
    [xianView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(_phoneText.mas_bottom).mas_equalTo(10);
    }];
    xianView2.backgroundColor=ColorWithRGB(230, 230, 230);
    
    
    UIImageView *codeImage=[UIImageView new];
    [self addSubview:codeImage];
    [codeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(18);
        make.height.mas_equalTo(25);
        make.top.mas_equalTo(xianView2.mas_bottom).mas_equalTo(40);
    }];
    codeImage.image=[UIImage imageNamed:@"验证码-(3)"];
    
    _codeText=[UITextField new];
    [self addSubview:_codeText];
    [_codeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(phoneImage.mas_right).mas_equalTo(20);
        make.centerY.mas_equalTo(codeImage);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
    }];
    _codeText.delegate=self;
    _codeText.placeholder=@"请输入数字验证码";
    _codeText.textColor=ColorWithRGB(49, 49, 49);
    _codeText.font=[UIFont systemFontOfSize:19];
    _codeText.returnKeyType=UIReturnKeyDone;
    _codeText.keyboardType=UIKeyboardTypePhonePad;
    
    
    
    UIView *xianView3=[UIView new];
    [self addSubview:xianView3];
    [xianView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(_codeText.mas_bottom).mas_equalTo(10);
    }];
    xianView3.backgroundColor=ColorWithRGB(230, 230, 230);
    
    
    UIImageView *pwdImage=[UIImageView new];
    [self addSubview:pwdImage];
    [pwdImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(18);
        make.height.mas_equalTo(25);
        make.top.mas_equalTo(xianView3.mas_bottom).mas_equalTo(40);
    }];
    pwdImage.image=[UIImage imageNamed:@"密码-(1)"];
    
    _pwdText=[UITextField new];
    [self addSubview:_pwdText];
    [_pwdText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(phoneImage.mas_right).mas_equalTo(20);
        make.centerY.mas_equalTo(pwdImage);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
    }];
    _pwdText.delegate=self;
    _pwdText.placeholder=@"请输入6-16位数字或者字母密码";
    _pwdText.textColor=ColorWithRGB(49, 49, 49);
    _pwdText.font=[UIFont systemFontOfSize:19];
    _pwdText.returnKeyType=UIReturnKeyDone;
    _pwdText.keyboardType=UIKeyboardTypeDefault;
    _pwdText.delegate=self;
    _pwdText.secureTextEntry=YES;//密文
    

    UIView *xianView4=[UIView new];
    [self addSubview:xianView4];
    [xianView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(_pwdText.mas_bottom).mas_equalTo(10);
    }];
    xianView4.backgroundColor=ColorWithRGB(230, 230, 230);
    
    UIImageView *xieYiImage=[UIImageView new];
    [self addSubview:xieYiImage];
    [xieYiImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(phoneImage);
        make.width.height.mas_equalTo(25);
        make.top.mas_equalTo(xianView4.mas_bottom).mas_equalTo(40);
    }];
    xieYiImage.image=[UIImage imageNamed:@"是"];
    
    UILabel *xieYiLabel=[UILabel new];
    [self addSubview:xieYiLabel];
    [xieYiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(xieYiImage.mas_right).mas_equalTo(20);
        make.centerY.mas_equalTo(xieYiImage);
    }];
    NSMutableAttributedString *AttributedStr= [[NSMutableAttributedString alloc]initWithString:@"注册即表示您同意《独角兽平台声明》"];
    
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(149, 149, 149) range:NSMakeRange(0, 8)];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:ColorWithRGB(186, 151, 89) range:NSMakeRange(8, 9)];
    xieYiLabel.attributedText=AttributedStr;
    xieYiLabel.font=[UIFont systemFontOfSize:16];
    
    UIButton *loginBtn=[UIButton new];
    [self addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(xieYiLabel.mas_bottom).mas_equalTo(70);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(_mainW-40);
    }];
    loginBtn.layer.cornerRadius=20;
    loginBtn.backgroundColor=ColorWithRGB(189, 156, 104);
    [loginBtn setTitle:@"注册" forState:0];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:0];
    [loginBtn addTarget:self action:@selector(registerBtn:) forControlEvents:UIControlEventTouchUpInside];
    
}


-(IBAction)huoQuYanZhen:(UIButton *)sender{
    
    NSString *mobile=_phoneText.text;
    if (![ZQTools isMobileNumber:mobile]) {
        [ZQTools svpInfo:@"手机号错误"];
        return;
    }
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:mobile,@"phone",@"0",@"code_type",@"1",@"user_role", nil];
    [ZQTools AFNPostDataUrl:@"api/index/get_code" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
        _codeBtn.enabled=NO;
        _timeTick=60;
        _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
        
        _codeText.text=[NSString stringWithFormat:@"%@",responseObject];
        
    } anderrorBlock:nil];
    
}

-(void)timeFireMethod
{
    if (_timeTick==0) {
        _codeBtn.enabled=YES;
        [_codeBtn setTitle:@"发送验证码" forState:0];
        _codeBtn.backgroundColor=_backgroundColor;
        [_timer invalidate];
        return;
    }
    _timeTick--;
    [_codeBtn setTitle:[NSString stringWithFormat:@"%dS重发",_timeTick] forState:0];
    _codeBtn.backgroundColor=_DarkGrey;
}
-(IBAction)registerBtn:(UIButton *)btn{
    
    NSString *waiter_phone=_phoneText.text;
    NSString *waiter_pass=_pwdText.text;
    NSString *codeStr=_codeText.text;
    
    if (![ZQTools isMobileNumber:waiter_phone]) {
        [ZQTools svpInfo:@"手机号有误"];
        return;
    }
    if ([ZQTools charIsNil:codeStr]) {
        [ZQTools svpInfo:@"验证码不能为空"];
        return;
    }
    if ([ZQTools charIsNil:waiter_pass]||waiter_pass.length<6||waiter_pass.length>16) {
        [ZQTools svpInfo:@"密码必须是6到16位字符组成"];
        return;
    }
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:waiter_phone,@"waiter_phone",waiter_pass,@"waiter_pass",@"0",@"waiter_role",codeStr,@"verify_code", nil];
    [ZQTools AFNPostDataUrl:@"waiter/Logreg/register" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
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
