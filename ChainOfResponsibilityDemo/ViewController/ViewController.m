//
//  ViewController.m
//  ChainOfResponsibilityDemo
//
//  Created by gfy on 2020/3/1.
//  Copyright © 2020 gfy. All rights reserved.
//

#import "ViewController.h"
#import "StudyRootView.h"
#import <Masonry/Masonry.h>
#import "UIResponder+Event.h"

@interface ViewController ()<StudyRootViewDelegate>
@property (nonatomic, strong) StudyRootView *rootView; ///<
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.rootView];
    self.rootView.delegate = self;
    [self.rootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}




#pragma mark - StudyRootViewDelegate
- (void)studyRootViewCellDidSelectAtIndexPath:(NSIndexPath *_Nullable)indexPath {
 
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"点击了第%ld个",indexPath.row] preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void)responseEvent:(XCLEvent *)event {
    NSLog(@"点击了第%ld个",event.indexPath.row);

}


#pragma mark - Lazy
- (StudyRootView *)rootView {
    if (!_rootView) {
        _rootView = [[StudyRootView alloc]init];
        _rootView.backgroundColor = [UIColor greenColor];
    }
    return _rootView;
}
@end
