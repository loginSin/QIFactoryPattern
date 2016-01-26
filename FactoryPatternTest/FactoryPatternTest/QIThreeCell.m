//
//  QIThreeCell.m
//  FactoryPatternTest
//
//  Created by Xerses on 16/1/22.
//  Copyright © 2016年 d-Ear. All rights reserved.
//

#import "QIThreeCell.h"

@implementation QIThreeCell
- (void)initView {
    self.textLabel.text = @"THREE";
//    CGRect frame = self.textLabel.bounds;
//    NSDictionary* attrs =@{NSForegroundColorAttributeName:[UIColor blackColor],
//                           NSFontAttributeName:[UIFont systemFontOfSize:18],
//                           };
////    [@"THREE" drawInRect:frame withAttributes:attrs];
//    [@"THREE" drawAtPoint:frame.origin withAttributes:attrs];
    self.backgroundColor = [UIColor blueColor];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
