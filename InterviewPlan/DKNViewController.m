//
//  DKNViewController.m
//  InterviewPlan
//
//  Created by Mike on 15-4-26.
//  Copyright (c) 2015年 Mike. All rights reserved.
//

#import "DKNViewController.h"

@interface DKNViewController () {
    DNKView *aView;
}

@end

@implementation DKNViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
/**  delegate  **/
    aView = [[DNKView alloc]init];
    aView.delegate = self;
    [self.view addSubview:aView];
    
/**  NSNotification  **/
    
//    注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xxx_notification:) name:@"xxx_notification" object:nil];
    
    
//    发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"xxx_notification" object:self userInfo:nil];
    
/**  KVO  **/
  
/**
    NSKeyValueObservingOptionNew    把更改之前的值提供给处理方法
 
    NSKeyValueObservingOptionOld    把更改之后的值提供给处理方法
 
    NSKeyValueObservingOptionInitial    把初始化的值提供给处理方法，一旦注册，立马就会调用一次。通常它会带有新值，而不会带有旧值。
 
    NSKeyValueObservingOptionPrior      分2次调用。在值改变之前和值改变之后。
**/
    [aView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    
    @synchronized(self) {
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - DNKViewDelegate

- (void)view:(DNKView *)view method1:(NSString *)arg1 {
    
}

#pragma mark - NSNotification
- (void)xxx_notification:(NSNotification *)notification {
    
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
}



- (void)dealloc {
    
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"xxx_notification" object:nil];
    
    //移除KVO
    [aView removeObserver:self forKeyPath:@"frame"];
}
@end
