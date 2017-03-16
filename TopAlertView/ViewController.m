//
//  ViewController.m
//  TopAlertView
//
//  Created by VeLink on 17/3/16.
//  Copyright © 2017年 VeLink. All rights reserved.
//

#import "ViewController.h"
#import "EnquirBlanceAlertView.h"
@interface ViewController ()<EnquirBlanceDelegate>
{
    EnquirBlanceAlertView *ReturnView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ReturnView=[[EnquirBlanceAlertView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0) withTypeArray:@[@"0",@"0",@"1",@"2",@"2"]];
    ReturnView.dataArray=@[@[@"CS订单",@"B2B订单"]];
    ReturnView.HiddenView=self.view;
    ReturnView.TitleArray=@[@"品牌名称:",@"政策编码:",@"审核状态",@"单据日期(起)",@"单据日期(止)"];
    ReturnView.delegate=self;
    [self.view addSubview:ReturnView];
}
- (IBAction)show:(id)sender {
    
    [ReturnView EnquirBlanceShow];

}
-(void)sentSoureButton:(NSArray *)DataNotyArray
{
    [ReturnView EnquirBlanceHidden];
    
}
/**
 取消按钮的代理
 */
-(void)cancleButton
{
    [ReturnView EnquirBlanceHidden];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
