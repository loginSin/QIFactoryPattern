//
//  ViewController.m
//  FactoryPatternTest
//
//  Created by Xerses on 16/1/22.
//  Copyright © 2016年 d-Ear. All rights reserved.
//

#import "ViewController.h"
#import "QIModel.h"
#import "QIRootCell.h"
#import "QICellFactory.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation ViewController

- (UITableView *)tableView {
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.dataSource= self;
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSArray *)dataArray {
    if(!_dataArray){
        NSMutableArray *tmpArray = [NSMutableArray array];
        for(int i=0;i<20;i++){
            QIModel *model = [[QIModel alloc]init];
            model.type = arc4random()%3;
            [tmpArray addObject:model];
        }
        _dataArray = tmpArray;
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView registerClass:[QIRootCell class] forCellReuseIdentifier:@"QIRootCell"];
}

#pragma mark --UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QIModel *model = self.dataArray[indexPath.row];
#pragma mark -- 工厂模式的精髓就在这一行代码
    QIRootCell *cell  = [QICellFactory cellWithModel:model];
    return cell;
}

#pragma mark -- 自定义左划多个按钮，但是只能用在iOS8之后
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * action, NSIndexPath * indexPath) {
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    }];
    deleteAction.backgroundColor = [UIColor redColor];
    
    UITableViewRowAction *topRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"置顶" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        QIModel *model = self.dataArray[indexPath.row];
        for(int i=(int)indexPath.row;i>0;i--){
            self.dataArray[i] = self.dataArray[i-1];
        }
        self.dataArray[0] = model;
        [tableView reloadData];
    }];
    topRowAction.backgroundColor = [UIColor greenColor];
    
    UITableViewRowAction *moreAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"更多" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"更多");
//        [tableView reloadData];
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
//    topRowAction.backgroundColor = [UIColor grayColor];
    topRowAction.backgroundEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    
    return @[deleteAction,topRowAction,moreAction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
