//
//  ColorHelper.h
//  QRCode
//
//  Created by wugang on 13-5-6.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIColor(ColorHelper)
+(CGFloat)colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length;
+(UIColor*)colorWithHexString:(NSString *)hexString;
+(UIImage *) createImageWithColor: (UIColor *) color;
@end
