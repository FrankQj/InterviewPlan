//
//  ABaseView.m
//  InterviewPlan
//
//  Created by Mike on 15-4-28.
//  Copyright (c) 2015年 Mike. All rights reserved.
//

#import "ABaseView.h"

@interface ABaseView () {
    UIButton *btn;
}

@end

@implementation ABaseView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)addOtherViews {
    
    btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setFrame:CGRectMake(10, 10, 60, 30)];
    //    bt.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(action2:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"页面跳转" forState:UIControlStateNormal];
    [self addSubview:btn];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 80, 50)];
    scrollView.backgroundColor = [UIColor orangeColor];
    scrollView.alpha = 0.1;
    [self addSubview:scrollView];
}

- (void)action2:(UIButton *)sender {
    
//    NSLog(@"按钮被点击了！！！");
    self.buttonBlock(sender);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    
    CGPoint hitPoint = [btn convertPoint:point fromView:self];
    if ([btn pointInside:hitPoint withEvent:event]) {
        return btn;
    }
    
    return [super hitTest:point withEvent:event];
}


@end
