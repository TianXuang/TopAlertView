//
//  UILine.m
//  B2BBusinessSystems
//
//  Created by VeLink on 16/12/26.
//  Copyright © 2016年 VeLink. All rights reserved.
//

#import "UILine.h"
#import "EnquirBlanceAlertView.h"
@implementation UILine

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)init
{
    self=[super init];
    if (self)
    {
        [self creatLineView];
        
    }
    return self;
}
-(void)creatLineView
{
    self.backgroundColor=RGBA(230, 230, 230, 1.0);
}
@end
