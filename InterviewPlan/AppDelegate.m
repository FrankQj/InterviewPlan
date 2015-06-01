//
//  AppDelegate.m
//  InterviewPlan
//
//  Created by Mike on 15-4-25.
//  Copyright (c) 2015年 Mike. All rights reserved.
//

#import "AppDelegate.h"
#import "MultyThreadVC.h"
#import "CoreGraphicsVC.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    MultyThreadVC *rootVC = [[MultyThreadVC alloc]init];
    UINavigationController *rootNav = [[UINavigationController alloc]initWithRootViewController:rootVC];
    self.window.rootViewController = rootNav;
//    self.window.rootViewController = [[CoreGraphicsVC alloc]init];
    
    int i = 1 , j = 2;
    NSLog(@"i = %d",i++);
    
    NSLog(@"j = %d",++j);
    
    NSString *str = @"https://svn.ipadorz.com/svn/iss_mobile_core_property/核心组织过程资产/3项目资料/上海烟草/进度计划表/";
    str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:str];
    NSLog(@"url:\n%@",url);
    
    int sums = sum(3, 4);
    
    
    
    //1.0
//    NSTimer *timers = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timers forMode:NSDefaultRunLoopMode];
    
    
    
    //2.0
//    NSTimeInterval period = 1.0; //设置时间间隔
//    
//    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
//    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0 * NSEC_PER_SEC);//每秒执行
//    dispatch_source_set_event_handler(timer, ^{
//        NSLog(@"dispatch source timer");
////        dispatch_source_cancel(timer);
//    });
//    dispatch_resume(timer);
    
    
    
    //3.0
    [NSThread detachNewThreadSelector:@selector(timerInit) toTarget:self withObject:nil];
    
    
    return YES;
    
}

- (void)timerInit {
    //1.
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
    

    //2.
    NSTimer *aTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:aTimer forMode:NSDefaultRunLoopMode];
    
    
    
    [[NSRunLoop currentRunLoop] run];
}

- (void)timeAction:(NSTimer *)timer {
    
    NSLog(@"timer  run!");
}

int sum(a,b)
int a; int b;
{
    return a + b;
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 推送


@end
