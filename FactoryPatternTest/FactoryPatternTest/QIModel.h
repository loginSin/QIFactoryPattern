//
//  QIModel.h
//  FactoryPatternTest
//
//  Created by Xerses on 16/1/22.
//  Copyright © 2016年 d-Ear. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum : NSUInteger {
    QICellTypeOne = 0,
    QICellTypeTwo,
    QICellTypeThree,
} QICellType;

@interface QIModel : NSObject
//type 0，1，2
@property (nonatomic,assign) QICellType type;
@end
