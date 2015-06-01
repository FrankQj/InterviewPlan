//
//  AppDelegate.h
//  InterviewPlan
//
//  Created by Mike on 15-4-25.
//  Copyright (c) 2015年 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    dispatch_source_t timer;
}

@property (strong, nonatomic) UIWindow *window;

@end
