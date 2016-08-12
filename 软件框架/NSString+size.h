//
//  NSString+size.h
//  Investment
//
//  Created by lzsc on 16/4/6.
//  Copyright © 2016年 zhangteng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
@interface NSString (size)



+ (CGSize)sizeForNoticeTitle:(NSString*)text font:(UIFont*)font;

+ (CGSize)sizeForNoticeTitle:(NSString*)text  size:(CGSize)size font:(UIFont*)font;

@end
