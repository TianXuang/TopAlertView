//
//  EnquirBlanceAlertView.h
//  B2BBusinessSystems
//
//  Created by VeLink on 16/12/27.
//  Copyright © 2016年 VeLink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "GYZCustomCalendarPickerView.h"
typedef NS_ENUM(NSInteger,selectStyle)
{
    textFieldStyle,//输入类型
    selectItemStyle,//选择类型
    dateStyle//选择时间类型
};
@protocol EnquirBlanceDelegate <NSObject,UITableViewDelegate>

-(void)sentSoureButton:(NSArray *)DataNotyArray;
/**
 取消按钮的代理
 */
-(void)cancleButton;

@end

#define Font(a) [UIFont systemFontOfSize:a]
#define RGBA(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define customTextColor [UIColor colorWithHexString:@"#585858"]
#define AllCustomColor [UIColor colorWithHexString:@"#47b0c3"]
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@interface EnquirBlanceAlertView : UIView<GYZCustomCalendarPickerViewDelegate,UITextFieldDelegate>
/**
 标题数据源
 */
@property(nonatomic,strong)NSArray *TitleArray;
/**
 设置代理
 */
@property(nonatomic,strong)id<EnquirBlanceDelegate>delegate;
/**
 select 数据源
 二维数组的形式
 */
@property(nonatomic,strong)NSArray *dataArray;
/**
 需要加载的父试图 创建蒙板
 */
@property(nonatomic,strong)UIView *HiddenView;
/**
 存放类型数据，不可写入
 */
@property(nonatomic,strong)NSMutableArray *typeArray;
/**
 区分选择器的数组（用于多个选择的时候,不可写）
 */
@property(nonatomic,strong)NSMutableArray *selectDataArray;
@property(nonatomic,strong)UIView *blackView;
 /**
  获取位置 不可写
  */
@property(nonatomic,assign)CGRect rect;
/**
 参数2 要展现的位置 frame的高度不用处理，随便设置
 参数3 要展示的格式类型
 三种类型
 文字输入类型 输入0
 select类型 输入1
  选择日期 输入2
 */
-(instancetype)initWithFrame:(CGRect)frame withTypeArray:(NSArray *)TypeArray;
/**
 显示
 */
-(void)EnquirBlanceShow;
/**
 隐藏
 */
-(void)EnquirBlanceHidden;
@end
