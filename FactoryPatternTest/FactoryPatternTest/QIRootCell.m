//
//  QIRootCell.m
//  FactoryPatternTest
//
//  Created by Xerses on 16/1/22.
//  Copyright © 2016年 d-Ear. All rights reserved.
//

#import "QIRootCell.h"

@implementation QIRootCell

+ (id)cell {
    return [[self alloc]init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
