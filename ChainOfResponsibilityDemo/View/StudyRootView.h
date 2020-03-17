//
//  StudyRootView.h
//  ChainOfResponsibilityDemo
//
//  Created by gfy on 2020/3/1.
//  Copyright © 2020 gfy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

//#import "UIResponder+Add.h"


@protocol StudyRootViewDelegate <NSObject>
@optional
- (void)studyRootViewCellDidSelectAtIndexPath:(NSIndexPath *_Nullable)indexPath;

@end

NS_ASSUME_NONNULL_BEGIN

@interface StudyRootView : UIView
@property (nonatomic, strong) UITableView *tableView;                       ///< 滚动视图
@property (nonatomic,weak)id<StudyRootViewDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
