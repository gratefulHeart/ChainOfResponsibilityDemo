//
//  UIResponder+Event.h
//  ChainOfResponsibilityDemo
//
//  Created by gfy on 2020/3/15.
//  Copyright © 2020 gfy. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XCLEvent : NSObject
@property (nonatomic,strong)UIResponder *responder;
@property (nonatomic, strong) NSIndexPath *indexPath; ///<


@end
@interface UIResponder (Event)

- (void)responseEvent:(XCLEvent *)event;

@end

NS_ASSUME_NONNULL_END
