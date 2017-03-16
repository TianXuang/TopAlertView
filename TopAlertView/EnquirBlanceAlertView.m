//
//  EnquirBlanceAlertView.m
//  B2BBusinessSystems
//
//  Created by VeLink on 16/12/27.
//  Copyright © 2016年 VeLink. All rights reserved.
//
#import "EnquirBlanceAlertView.h"
#import "HKLPickerView.h"
#import "MyControl.h"
#import "Masonry.h"
#import "ColorHelper.h"


@implementation EnquirBlanceAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame withTypeArray:(NSArray *)TypeArray
{
    //计算位置
    CGRect rct=CGRectMake(frame.origin.x, -(30*TypeArray.count+20+5*TypeArray.count+30+20), frame.size.width, 30*TypeArray.count+20+5*TypeArray.count+30+20);
    
    self=[super initWithFrame:rct];
    _rect=CGRectMake(frame.origin.x, 0, frame.size.width, 30*TypeArray.count+20+5*TypeArray.count+30+20);
    if (self)
    {
        [self creatUIWitType:TypeArray];
        self.backgroundColor=[UIColor whiteColor];
    }
    return self;
}
-(void)creatBlackView
{
    
    _blackView=[[UIView alloc]init];
    _blackView.userInteractionEnabled=YES;
    _blackView.frame=_HiddenView.bounds;
    _blackView.hidden=YES;
    _blackView.backgroundColor=RGBA(0, 0, 0, 0.2);
    [_HiddenView addSubview:_blackView];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapBlackReturn)];
    [_blackView addGestureRecognizer:tap];

}
-(void)TapBlackReturn
{

    [self EnquirBlanceHidden];
    
}
-(void)setHiddenView:(UIView *)HiddenView
{
    _HiddenView=HiddenView;
    [self creatBlackView];
}
-(void)creatUIWitType:(NSArray *)typeArr
{
    //收集类型
    _typeArray=[NSMutableArray new];
    for (int i=0; i<typeArr.count; i++)
    {
        NSInteger type=[typeArr[i] integerValue];
        
        switch (type)
        {
            case (NSInteger)0:
            {
                type=0;
                [_typeArray addObject:[NSNumber numberWithInteger:textFieldStyle]];
                
                break;
            }
            case (NSInteger)1:
            {
                type=1;
                [_typeArray addObject:[NSNumber numberWithInteger:selectItemStyle]];
                break;
            }
            case (NSInteger)2:
            {
                type=2;
                [_typeArray addObject:[NSNumber numberWithInteger:dateStyle]];                break;
            }
        }
        
    }
    
    //操作分好的类型数组
    for (int i=0; i<_typeArray.count; i++)
    {
        UILabel *titleLa=[MyControl createLabelWithFont:13.0 Text:@"" andTextColor:customTextColor andtextAlig:NSTextAlignmentLeft];
        titleLa.tag=1500+i;
        [self addSubview:titleLa];
        titleLa.frame=CGRectMake(15, 30*i+20+5*i, 80, 30);
        if (_typeArray[i]==[NSNumber numberWithInteger:textFieldStyle])
        {
            UITextField *field=[[UITextField alloc]init];
            field.borderStyle=UITextBorderStyleNone;
            field.layer.borderColor=RGBA(230, 230, 230, 1).CGColor;
            field.font=Font(14.0);
            field.textColor=customTextColor;
            UIView *leftViewq=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 30)];
            field.leftView=leftViewq;
            field.leftViewMode= UITextFieldViewModeAlways;
            field.layer.borderWidth=1.0;
            field.delegate=self;
            [self addSubview:field];
            field.tag=1510+i;
            [field mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(250, 30));
                make.left.equalTo(titleLa.mas_right).offset(5);
                make.centerY.equalTo(titleLa);
            }];

        }else
        {
            UIButton *selectButt=[MyControl createButtonWithFont:14 target:self SEL:@selector(SelectButtonClick:) title:@"" withTextColor:customTextColor andImage:nil];
            selectButt.layer.borderColor=RGBA(230, 230, 230, 1).CGColor;
            selectButt.tag=1510+i;
            selectButt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            selectButt.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
            selectButt.layer.borderWidth=1;
            [self addSubview:selectButt];
            [selectButt mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(250, 30));
                make.left.equalTo(titleLa.mas_right).offset(5);
                make.centerY.equalTo(titleLa);
            }];
            
        }
        
        
    }
    
    
    UIView*BootView=[[UIView alloc]init];
    BootView.backgroundColor=AllCustomColor;
    [self addSubview:BootView];
    [BootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.bottom.equalTo(self.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(screenWidth, 30));
    }];
    
    UIButton *searchBut=[MyControl createButtonWithFont:12.0 target:self SEL:@selector(SearbutClick) title:@"确认" withTextColor:AllCustomColor andImage:nil];
    searchBut.backgroundColor=[UIColor whiteColor];
    searchBut.layer.cornerRadius=2;
    [BootView addSubview:searchBut];
    [searchBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 20));
        make.right.equalTo(BootView.mas_right).offset(-15);
        make.centerY.equalTo(BootView);
        
    }];
    
    UIButton *CancleBut=[MyControl createButtonWithFont:12.0 target:self SEL:@selector(canclebutClick) title:@"取消" withTextColor:AllCustomColor andImage:nil];
    CancleBut.backgroundColor=[UIColor whiteColor];
    CancleBut.layer.cornerRadius=2;
    [BootView addSubview:CancleBut];
    [CancleBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 20));
        make.left.equalTo(BootView.mas_left).offset(15);
        make.centerY.equalTo(BootView);
        
    }];
    
}
-(void)setTitleArray:(NSArray *)TitleArray
{
    for (int i=0; i<TitleArray.count; i++)
    {
        UILabel *li=[self viewWithTag:1500+i];
        li.text=TitleArray[i];
    }
    _TitleArray=TitleArray;
}
#pragma mark-选中按钮
-(void)SelectButtonClick:(UIButton *)but
{

    if (_typeArray[but.tag-1510]==[NSNumber numberWithInteger:selectItemStyle])
    {
        NSMutableArray *buttonArray=[NSMutableArray new];
        for (int i=0; i<_typeArray.count; i++)
        {
            UIView *vv=[self viewWithTag:1510+i];
            if ([vv isKindOfClass:[UIButton class]])
            {
                [buttonArray addObject:vv];
            }
        }
        for (int i=0; i<buttonArray.count; i++)
        {
            if (buttonArray[i]==but)
            {
                _selectDataArray=_dataArray[i];
            }
        }
        HKLPickerView * pickView = [[HKLPickerView alloc]init];
        //2,数据源属性赋值
        pickView.dataSource =@[_selectDataArray];
        //3,显示
        [pickView showCoverView];
        pickView.selectID=[NSString stringWithFormat:@"%ld",(long)but.tag];
        //4,可选(个性化设置,可点进入HKLPickerView.h文件，查看具体可以设置的属性)
        pickView.animationTime = 0.1;
        pickView.BackgroundAlpha = 0.1;
        
        //5,Block回调，拿到选中的内容  contents是存放选中结果的字符串数组
        WS(ws);
        [pickView setConfirmBtnClickBlock:^(NSArray * contents,NSString *selectID) {
            
            UIButton *but=[ws viewWithTag:[selectID integerValue]];
            [but setTitle:contents[0] forState:UIControlStateNormal];
            
        }];
        
    }else if(_typeArray[but.tag-1510]==[NSNumber numberWithInteger:dateStyle])
    {
        GYZCustomCalendarPickerView *pickerView = [[GYZCustomCalendarPickerView alloc]initWithTitle:@"选择日期"];
        pickerView.delegate = self;
        pickerView.SelectID=[NSString stringWithFormat:@"%ld",(long)but.tag];
        pickerView.calendarType = GregorianCalendar;//日期类型
        [pickerView show];
    }
    
}
#pragma mark-搜索按钮
-(void)SearbutClick
{
    NSMutableArray *dataArr=[NSMutableArray new];
    
    
    for (int i=0; i<_typeArray.count; i++)
    {
        if (_typeArray[i]==[NSNumber numberWithInteger:textFieldStyle])
        {
            UITextField*field=[self viewWithTag:1510+i];
            [dataArr addObject:field.text];
        }else
        {
            UIButton*but=[self viewWithTag:1510+i];
            [dataArr addObject:but.currentTitle];

        }
    }
    if ([self.delegate respondsToSelector:@selector(sentSoureButton:)])
    {
        [self.delegate sentSoureButton:dataArr];
    }
    
}
-(void)canclebutClick
{
    [self.delegate cancleButton];
    
}
#pragma QTCustomCalendarPickerViewDelegate
//接收日期选择器选项变化的通知
- (void)notifyNewCalendar:(IDJCalendar *)cal andSelectCElls:(NSString *)SelectCells
{
    NSString *result = @"点击";
    if ([cal isMemberOfClass:[IDJCalendar class]]) {//阳历
        
        NSString *year =[NSString stringWithFormat:@"%@",cal.year];
        NSString *month = [cal.month intValue] > 9 ? cal.month:[NSString stringWithFormat:@"0%@",cal.month];
        NSString *day = [cal.day intValue] > 9 ? cal.day:[NSString stringWithFormat:@"0%@",cal.day];
        result = [NSString stringWithFormat:@"%@-%@-%@",year,month, day];
        
        //        返回的日期
        
        
    } else if ([cal isMemberOfClass:[IDJChineseCalendar class]]) {//阴历
        
        IDJChineseCalendar *_cal=(IDJChineseCalendar *)cal;
        
        NSArray *array=[_cal.month componentsSeparatedByString:@"-"];
        NSString *dateStr = @"";
        if ([[array objectAtIndex:0]isEqualToString:@"a"]) {
            dateStr = [NSString stringWithFormat:@"%@%@",dateStr,[_cal.chineseMonths objectAtIndex:[[array objectAtIndex:1]intValue]-1]];
        } else {
            dateStr = [NSString stringWithFormat:@"%@闰%@",dateStr,[_cal.chineseMonths objectAtIndex:[[array objectAtIndex:1]intValue]-1]];
        }
        result = [NSString stringWithFormat:@"%@%@",dateStr, [NSString stringWithFormat:@"%@", [_cal.chineseDays objectAtIndex:[_cal.day intValue]-1]]];
    }
    
    NSLog(@"%@",result);
    UIButton *but=[self viewWithTag:[SelectCells integerValue]];
    [but setTitle:result forState:UIControlStateNormal];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)EnquirBlanceShow
{
    [UIView animateWithDuration:0.2 animations:^{
        self.frame=_rect;
    }];
    _blackView.hidden=NO;
}
-(void)EnquirBlanceHidden
{
    CGRect rct=CGRectMake(_rect.origin.x, -_rect.size.height, _rect.size.width, _rect.size.height);
    [UIView animateWithDuration:0.2 animations:^{
        self.frame=rct;
    }];
    _blackView.hidden=YES;

}
@end
