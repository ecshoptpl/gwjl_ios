//
//  YMLiginOptsViewController.m
//  MyOne3
//
//  Created by meilbn on 2/25/16.
//  Copyright © 2016 meilbn. All rights reserved.
//

#import "YMLoginOptsViewController.h"
#import "YMPoilcyViewController.h"
//#import "OpenShareHeader.h"
//#import "YMTabBarController.h"
#import "AppDelegate.h"
//#import <ShareSDK/ShareSDK.h>
//#import <ShareSDKExtension/SSEThirdPartyLoginHelper.h>

@interface YMLoginOptsViewController ()

@property (strong, nonatomic) UIImageView *bgImageView;
@property (strong, nonatomic) UIVisualEffectView *effectView;
@property (strong, nonatomic) UIButton *closeButton;
@property (strong, nonatomic) UIButton *wechatLoginButton;
@property (strong, nonatomic) UIButton *weiboLoginButton;
@property (strong, nonatomic) UIButton *qqLoginButton;
@property (strong, nonatomic) UIButton *mobileLoginButton;
//@property (strong, nonatomic) UIButton *provisionButton;
@property (strong, nonatomic) AppDelegate *app2;

@end

@implementation YMLoginOptsViewController

#pragma mark - Lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeTop;
    self.hideNavigationBar = YES;
    
    [self initDatas];
    [self setupViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //DDLogDebug(@"_bgImageView.frame = %@, _bgImageView.bounds = %@", NSStringFromCGRect(_bgImageView.frame), NSStringFromCGRect(_bgImageView.bounds));
    [UIView animateWithDuration:12
                          delay:0
                        options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         _bgImageView.frame = CGRectMake(-80, -142, 480, 852);
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

#pragma mark - Private Method

- (void)initDatas {
    
}

- (void)setupViews {
    if (_bgImageView) {
        return;
    }
    
    _bgImageView = ({
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"personalBackgroundImage"]];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        imageView;
    });
    
    _effectView = ({
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        effectView.alpha = 0.7;
        [self.view addSubview:effectView];
        [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        effectView;
    });
    
    _closeButton = ({
        UIButton *button = [YMUIFactory buttonWithImageName:@"close_normal_wight" highlightImageName:@"close_highlighted" target:self action:@selector(close)];
        [_effectView.contentView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@44);
            make.left.equalTo(_effectView.contentView);
            make.top.equalTo(_effectView.contentView).offset(22);
        }];
        
        button;
    });
    
    UILabel *titleLabel = ({
        UILabel *label = [UILabel new];
        label.text = @"登录";
        label.textColor = [UIColor whiteColor];
        label.font = FontWithSize(15);
        [_effectView.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_effectView.contentView);
            make.centerY.equalTo(_closeButton);
        }];
        
        label;
    });
    
    UIView *optsView = ({
        UIView *view = [UIView new];
        [_effectView.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleLabel.mas_bottom).offset(72);
            make.left.equalTo(_effectView.contentView).offset(25);
            make.right.equalTo(_effectView.contentView).offset(-25);
        }];
        
        view;
    });
    
    _wechatLoginButton = ({
        UIButton *button = [YMUIFactory buttonWithBackgroundImageName:@"wechatLogin" highlightImageName:@"wechatLoginHigh" target:self action:@selector(wechatLogin)];
        [optsView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@40);
            make.left.top.right.equalTo(optsView);
        }];
        
        button;
    });
    
    _weiboLoginButton = ({
        UIButton *button = [YMUIFactory buttonWithBackgroundImageName:@"weiboLogin" highlightImageName:@"weiboLoginHigh" target:self action:@selector(weiboLogin)];
        [optsView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@40);
            make.top.equalTo(_wechatLoginButton.mas_bottom).offset(10);
            make.left.right.equalTo(optsView);
        }];
        
        button;
    });
    
    _qqLoginButton = ({
        UIButton *button = [YMUIFactory buttonWithBackgroundImageName:@"qqLogin" highlightImageName:@"qqLoginHigh" target:self action:@selector(qqLogin)];
        [optsView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@40);
            make.top.equalTo(_weiboLoginButton.mas_bottom).offset(10);
            make.left.right.equalTo(optsView);
        }];
        
        button;
    });
    
    UILabel *orLabel = ({
        UILabel *label = [UILabel new];
        label.text = @"或者";
        label.textColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        [optsView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(optsView);
            make.top.equalTo(_qqLoginButton.mas_bottom).offset(10);
        }];
        
        label;
    });
    
    _mobileLoginButton = ({
        UIButton *button = [YMUIFactory buttonWithBackgroundImageName:@"mobileLogin" highlightImageName:nil target:self action:@selector(mobileLogin)];
        [optsView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(orLabel.mas_bottom).offset(10);
            make.centerX.equalTo(optsView);
            make.bottom.equalTo(optsView);
        }];
        
        button;
    });
    
   /* _provisionButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(lookupProvision) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.titleLabel.textColor = [UIColor whiteColor];
        button.titleLabel.font = FontWithSize(10);
        button.titleLabel.numberOfLines = 0;
        NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:@"创建账号即代表您同意\n使用条款和隐私条约" attributes:@{NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle)}];
        [button setAttributedTitle:attributedString forState:UIControlStateNormal];
        [_effectView.contentView addSubview:button];
        NSInteger sideMargin = ceil((SCREEN_WIDTH - 10 * 2) / 3.0) + 10;
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(_effectView.contentView).insets(UIEdgeInsetsMake(0, sideMargin, 10, sideMargin));
        }];
        
        button;
    });*/
}

#pragma mark - Action

- (void)close {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)wechatLogin {
//    NSLog(@"微信登录");
//   // [OpenShare WeixinAuth:@"snsapi_userinfo" Success:^(NSDictionary *message) {
//        NSLog(@"微信登录成功:\n%@",message);
//    } Fail:^(NSDictionary *message, NSError *error) {
//        NSLog(@"微信登录失败:\n%@\n%@",message,error);
//    }];
}

- (void)weiboLogin {
    
}

- (void)qqLogin {
//    UIApplication *app = [UIApplication sharedApplication];
//    AppDelegate *app2 = app.delegate;
//    YMTabBarController *temp = [[YMTabBarController alloc] init];
//    app2.window.rootViewController = temp;
//    [SSEThirdPartyLoginHelper loginByPlatform:SSDKPlatformTypeQQ
//        onUserSync:^(SSDKUser *user, SSEUserAssociateHandler associateHandler) {
//            
//            //在此回调中可以将社交平台用户信息与自身用户系统进行绑定，最后使用一个唯一用户标识来关联此用户信息。
//            //在此示例中没有跟用户系统关联，则使用一个社交用户对应一个系统用户的方式。将社交用户的uid作为关联ID传入associateHandler。
//            associateHandler (user.uid, user, user);
//            NSLog(@"dd%@",user.rawData);
//            NSLog(@"dd%@",user.credential);
//            
//        }
//     onLoginResult:^(SSDKResponseState state, SSEBaseUser *user, NSError *error) {
//         
//         if (state == SSDKResponseStateSuccess)
//         {
//             UIApplication *app = [UIApplication sharedApplication];
//             AppDelegate *app2 = app.delegate;
//             YMTabBarController *temp = [[YMTabBarController alloc] init];
//             app2.window.rootViewController = temp;
//         }
    
   //  }];
    /*[ShareSDK getUserInfo:SSDKPlatformTypeQQ
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
     {
         if (state == SSDKResponseStateSuccess)
         {
             
             NSLog(@"uid=%@",user.uid);
             NSLog(@"%@",user.credential);
             NSLog(@"token=%@",user.credential.token);
             NSLog(@"nickname=%@",user.nickname);
             UIApplication *app = [UIApplication sharedApplication];
             AppDelegate *app2 = app.delegate;
             YMTabBarController *temp = [[YMTabBarController alloc] init];
             app2.window.rootViewController = temp;
         }
         
         else
         {
             NSLog(@"%@",error);
         }
         
     }];*/

    //NSLog(@"QQ登录");
        /*[OpenShare QQAuth:@"get_user_info" Success:^(NSDictionary *message) {
        NSLog(@"微信登录成功:\n%@",message);
    } Fail:^(NSDictionary *message, NSError *error) {
        NSLog(@"微信登录失败:\n%@\n%@",message,error);
    }];*/
}

- (void)mobileLogin {
    
}

- (void)lookupProvision {
  //  [self.navigationController pushViewController:[YMPoilcyViewController new] animated:YES];
}

#pragma mark - Network Request




@end
