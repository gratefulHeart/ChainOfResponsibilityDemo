//
//  UIResponder+Event.m
//  ChainOfResponsibilityDemo
//
//  Created by gfy on 2020/3/15.
//  Copyright © 2020 gfy. All rights reserved.
//

#import "UIResponder+Event.h"

@implementation XCLEvent


@end
@implementation UIResponder (Event)
- (void)responseEvent:(XCLEvent *)event {
    [self.nextResponder responseEvent:event];
}
@end
