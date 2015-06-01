//
//  TimersDemo.m
//  InterviewPlan
//
//  Created by Mike on 15-5-26.
//  Copyright (c) 2015年 Mike. All rights reserved.
//

#import "TimersDemo.h"

@implementation TimersDemo



#pragma mark - NSTimer
- (void)nsTimerMethod {
    
    NSTimeInterval timeInterval = 3;
    //NSTimer初始化方法一
    NSTimer *timerInCurrentRunLoop = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    
    //NSTimer初始化方法二
    NSTimer *timer = [NSTimer timerWithTimeInterval:timeInterval target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    [timerInCurrentRunLoop invalidate];
}

#pragma mark - CADisplayLink

- (void)displayLinkMethod {
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLink:)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
//    [displayLink invalidate];
}

- (void)handleDisplayLink:(CADisplayLink *)displayLink {
    
}


#pragma mark - GCD Timer
#pragma mark - dispatch_after(执行一次)
- (void)dispatchAfterMethod {
    
    double delayInSeconds = 2.0;
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        NSLog(@"dispatch_after delay Timer");
    });
    
    
}


#pragma mark - dispatch_source_t Timer(重复执行)
- (void)dispatchSourceTimerMethod {
    
    NSTimeInterval period = 1.0; //设置时间间隔
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, period * NSEC_PER_SEC, 0 * NSEC_PER_SEC);//每秒执行
//    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0 * NSEC_PER_SEC);//每秒执行
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"dispatch source timer");
    });
    dispatch_resume(timer);
    
//    dispatch_source_cancel(timer);
    
}


@end
