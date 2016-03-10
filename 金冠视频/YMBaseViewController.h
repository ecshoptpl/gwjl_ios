//
//  YMBaseViewController.h
//  金冠视频
//
//  Created by jin on 16/3/10.
//  Copyright © 2016年 jin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YMPopMenuType) {
    YMPopMenuTypeWechatFrined,// 微信好友
    YMPopMenuTypeMoments,// 朋友圈
    YMPopMenuTypeWeibo,// 微博
    YMPopMenuTypeQQ,// QQ
    YMPopMenuTypeCopyURL,// 复制链接
    YMPopMenuTypeFavorite,// 收藏
};

typedef void(^MenuSelectedBlock)(YMPopMenuType menuType);

@interface YMBaseViewController : UIViewController

@property (nonatomic, assign) BOOL hideNavigationBar;

#pragma mark - HUD

- (void)showHUDWithText:(NSString *)text delay:(NSTimeInterval)delay;
- (void)showHUDDone;
- (void)showHUDDoneWithText:(NSString *)text;
- (void)showHUDErrorWithText : (NSString *)text;
- (void)showHUDNetError;
- (void)showHUDServerError;
- (void)showWithLabelText:(NSString *)showText executing:(SEL)method;
- (void)showHUDWithText:(NSString *)text;
- (void)modelTransformFailedWithError:(NSError *)error;
/**
 *  隐藏当前显示的提示框
 */
- (void)hideHud;

#pragma mark - UI

- (void)addNavigationBarRightItems;

- (void)endRefreshingScrollView:(UIScrollView *)scrollView hasMoreData:(BOOL)hasMoreData;

- (void)showPopMenuViewWithMenuSelectedBlock:(MenuSelectedBlock)block;

#pragma mark - Action

- (void)presentLoginOptsViewController;

- (void)blowUpImage:(UIImage *)image referenceRect:(CGRect)referenceRect referenceView:(UIView *)referenceView;


@end
