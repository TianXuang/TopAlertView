//
//  HKLPickerView.h
//  safeepay-ios-new
//
//  Created by san_xu on 2016/11/28.
//  Copyright © 2016年 com.app.huakala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HKLPickerView : UIView

/**
 *  PickerView数据源
 */
@property (strong,nonatomic)NSArray * dataSource;
/**
 *  动画执行时间
 */
@property (assign,nonatomic)CGFloat animationTime;
/**
 *  背景的透明度
 */
@property (assign,nonatomic)CGFloat BackgroundAlpha;
/**
 *  背景的颜色
 */
@property (strong,nonatomic)UIColor * backgroundViewColor;
/**
 *  按钮的宽
 */
@property (assign,nonatomic)NSInteger buttonWidth;
/**
 *  按钮的高
 */
@property (assign,nonatomic)NSInteger buttonHeight;
/**
 *  pickerView的背景颜色
 */
@property (strong,nonatomic)UIColor * pickerViewBackgroundColor;
/**
 *  pickerView的高度占屏幕的百分比 值为 0 -> 1 ,0是没有高度,1是和屏幕高度一致,默认是0.5
 */
@property (assign,nonatomic)CGFloat  screenHeightPercent;

//获取不同行点击的标识
@property(nonatomic,strong)NSString *selectID;
/**
 *  展示遮盖
 */
- (void)showCoverView;
/**
 *  确定按钮回调
 */
@property (copy,nonatomic)void(^confirmBtnClickBlock)(NSArray * results,NSString *selectID);

@end
