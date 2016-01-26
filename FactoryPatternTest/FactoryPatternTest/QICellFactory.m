//
//  QICellFactory.m
//  FactoryPatternTest
//
//  Created by Xerses on 16/1/22.
//  Copyright © 2016年 d-Ear. All rights reserved.
//

#import "QICellFactory.h"

#import "QIModel.h"

#import "QIOneCell.h"
#import "QITwoCell.h"
#import "QIThreeCell.h"

@implementation QICellFactory
+ (id)cellWithModel:(QIModel *)model; {
    
    if(QICellTypeOne == model.type){
        return [[QIOneCell alloc]init];
        
    }else if(QICellTypeTwo == model.type){
        return [[QITwoCell alloc]init];
        
    }else if(QICellTypeThree == model.type){
        return [[QIThreeCell alloc]init];
        
    }
    return nil;
}
@end
