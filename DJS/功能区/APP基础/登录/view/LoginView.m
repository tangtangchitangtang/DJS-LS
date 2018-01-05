
//
//  LoginView.m
//  DJS
//
//  Created by mac on 2017/12/25.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "LoginView.h"
#import "registerViewController.h"
#import "forgetViewController.h"
@implementation LoginView

-(void)creatView{
    UIView *view=[UIView new];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.top.mas_equalTo(0);
    }];
    [self creatBeiJingView:view];
    
    UIView *logingView=[UIView new];
    [self addSubview:logingView];
    [logingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(_mainW-40);
        make.height.mas_equalTo(300);
    }];
    logingView.backgroundColor=[UIColor whiteColor];
    [self creatLoginView:logingView];
    
    
}


-(void)creatBeiJingView:(UIView *)view{
    UIImageView *topView=[UIImageView new];
    [view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(_mainH*0.45);
    }];
    topView.image=[UIImage imageNamed:@"登陆背景"];
    
    UIView *bottomView=[UIView new];
    [view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(topView.mas_bottom);
    }];
    bottomView.backgroundColor=ColorWithRGB(244, 244, 239);
    
    UIImageView *weiXin=[UIImageView new];
    [self addSubview:weiXin];
    [weiXin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.width.height.mas_equalTo(40);
        make.bottom.mas_equalTo(-70);
    }];
    weiXin.image=[UIImage imageNamed:@"微信好友"];
    
    UILabel *weiXinLabel=[UILabel new];
    [self addSubview:weiXinLabel];
    [weiXinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weiXin);
        make.bottom.mas_equalTo(-30);
    }];
    weiXinLabel.text=@"微信登录";
    weiXinLabel.font=[UIFont systemFontOfSize:16];
    weiXinLabel.textColor=ColorWithRGB(149, 149, 149);
}

-(void)creatLoginView:(UIView *)view{
    
    UIView *phoneView=[UIView new];
    [view addSubview:phoneView];
    [phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(70);
    }];
    
    UIImageView *phoneImage=[UIImageView new];
    [phoneView addSubview:phoneImage];
    [phoneImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.bottom.mas_equalTo(-15);
        make.height.width.mas_equalTo(20);
    }];
    phoneImage.image=[UIImage imageNamed:@"用户名"];
    
    _phoneText=[UITextField new];
    [phoneView addSubview:_phoneText];
    [_phoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(phoneImage.mas_right).mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.centerY.mas_equalTo(phoneImage);
        make.height.mas_equalTo(30);
    }];
    _phoneText.delegate=self;
    _phoneText.placeholder=@"手机号";
    _phoneText.textColor=ColorWithRGB(49, 49, 49);
    _phoneText.font=[UIFont systemFontOfSize:19];
    _phoneText.returnKeyType=UIReturnKeyDone;
    _phoneText.keyboardType=UIKeyboardTypePhonePad;
    
    UIView *xianView=[UIView new];
    [view addSubview:xianView];
    [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneView.mas_bottom);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(1);
    }];
    xianView.backgroundColor=ColorWithRGB(220, 220, 220);

    
    UIView *pwdView=[UIView new];
    [view addSubview:pwdView];
    [pwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(70);
        make.top.mas_equalTo(xianView.mas_bottom);
    }];

    UIImageView *pwdImage=[UIImageView new];
    [pwdView addSubview:pwdImage];
    [pwdImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.bottom.mas_equalTo(-15);
        make.height.width.mas_equalTo(20);
    }];
    pwdImage.image=[UIImage imageNamed:@"密码-(1)"];

    _pwdText=[UITextField new];
    [pwdView addSubview:_pwdText];
    [_pwdText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(pwdImage.mas_right).mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.centerY.mas_equalTo(pwdImage);
        make.height.mas_equalTo(40);
    }];
    _pwdText.placeholder=@"密码";
    _pwdText.textColor=ColorWithRGB(49, 49, 49);
    _pwdText.font=[UIFont systemFontOfSize:19];
    _pwdText.keyboardType=UIKeyboardTypeDefault;
    _pwdText.delegate=self;
    _pwdText.secureTextEntry=YES;//密文
    _pwdText.returnKeyType=UIReturnKeyDone;

    UIView *xianView2=[UIView new];
    [view addSubview:xianView2];
    [xianView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(pwdView.mas_bottom);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(1);
    }];
    xianView2.backgroundColor=ColorWithRGB(230, 230, 230);
    
    UILabel *wangJiLabel=[UILabel new];
    [view addSubview:wangJiLabel];
    [wangJiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.top.mas_equalTo(xianView2.mas_bottom).mas_equalTo(25);
    }];
    wangJiLabel.text=@"忘记密码？";
    wangJiLabel.textColor=ColorWithRGB(186, 151, 89);
    wangJiLabel.font=[UIFont systemFontOfSize:16];
    wangJiLabel.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToForget:)];
    [wangJiLabel addGestureRecognizer:tapGesture];
    
    UILabel *zuCheLabel=[UILabel new];
    [view addSubview:zuCheLabel];
    [zuCheLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(wangJiLabel);
    }];
    zuCheLabel.textColor=ColorWithRGB(186, 151, 89);
    zuCheLabel.text=@"立即注册";
    zuCheLabel.font=[UIFont systemFontOfSize:16];
    
    zuCheLabel.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToRegister:)];
    [zuCheLabel addGestureRecognizer:tapGesture2];
    
    UIButton *loginBtn=[UIButton new];
    [view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-20);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(_mainW*0.75);
    }];
    loginBtn.layer.cornerRadius=20;
    loginBtn.backgroundColor=ColorWithRGB(189, 156, 104);
    [loginBtn setTitle:@"登录" forState:0];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:0];
    [loginBtn addTarget:self action:@selector(loginBtn:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(IBAction)loginBtn:(UIButton *)btn{
    NSString *waiter_phone=_phoneText.text;
   NSString *waiter_pass=_pwdText.text;
    
    if (![ZQTools isMobileNumber:waiter_phone]) {
            [ZQTools svpInfo:@"手机号有误"];
            return;
        }
    if ([ZQTools charIsNil:waiter_pass]||waiter_pass.length<6||waiter_pass.length>16) {
        [ZQTools svpInfo:@"密码必须是6到16位字符组成"];
        return;
    }

    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:waiter_phone,@"waiter_phone",waiter_pass,@"waiter_pass", nil];
    [ZQTools AFNPostDataUrl:@"waiter/Logreg/login" Dict:dic andTableView:nil andView:self andSuccessBlock:^(id responseObject) {
         [NSKeyedArchiver archiveRootObject:responseObject toFile:_userModelFile];
          [self.viewController.navigationController popViewControllerAnimated:YES];
        
    } anderrorBlock:nil];
    
    
}


-(void)pushToRegister:(UITapGestureRecognizer *)tap{
    registerViewController *registerView=[[registerViewController alloc] init];
    [ZQTools pushNextViewController:self.viewController andRootController:registerView];
}
-(void)pushToForget:(UITapGestureRecognizer *)tap{
    forgetViewController *registerView=[[forgetViewController alloc] init];
    [ZQTools pushNextViewController:self.viewController andRootController:registerView];
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
