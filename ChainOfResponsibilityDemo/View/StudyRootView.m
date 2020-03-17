//
//  StudyRootView.m
//  ChainOfResponsibilityDemo
//
//  Created by gfy on 2020/3/1.
//  Copyright © 2020 gfy. All rights reserved.
//

#import "StudyRootView.h"
#import <Masonry/Masonry.h>
#import "XCLAppDiscoverActivityCell.h"

@interface StudyRootView()<UITableViewDataSource, UITableViewDelegate>

@end
@implementation StudyRootView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setUpSubviews];
        [self setUpContrains];
    }
    return self;
}

- (void)setUpSubviews {
    [self addSubview:self.tableView];
}
- (void)setUpContrains {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 60.0f;
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XCLAppDiscoverActivityCell *emptyCell = (XCLAppDiscoverActivityCell *)[tableView dequeueReusableCellWithIdentifier:@"XCLAppDiscoverActivityCell" forIndexPath:indexPath];
    emptyCell.selectionStyle = UITableViewCellSelectionStyleNone;
    [emptyCell configUI:indexPath];
    __weak typeof(self)weakSelf = self;
//    emptyCell.didSelect = ^(NSIndexPath *indexPath) {
//        [weakSelf handleCellDidSelectAtIndexPath:indexPath];
//    };
    return emptyCell;
}

- (void)handleCellDidSelectAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(studyRootViewCellDidSelectAtIndexPath:)]) {
        [self.delegate studyRootViewCellDidSelectAtIndexPath:indexPath];
    }
}


#pragma mark - Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView registerClass:[XCLAppDiscoverActivityCell class] forCellReuseIdentifier:@"XCLAppDiscoverActivityCell"];
//        _tableView.showsVerticalScrollIndicator = NO;
//        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.estimatedRowHeight = 0;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableView.separatorInset = UIEdgeInsetsZero;
//        _tableView.scrollsToTop = NO;
    }
    
    return _tableView;
}
@end
