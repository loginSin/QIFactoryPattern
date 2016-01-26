//
//  QICellFactory.h
//  FactoryPatternTest
//
//  Created by Xerses on 16/1/22.
//  Copyright © 2016年 d-Ear. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QIModel;

@interface QICellFactory : NSObject
+ (id)cellWithModel:(QIModel *)model;
@end
