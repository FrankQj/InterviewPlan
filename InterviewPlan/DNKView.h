//
//  DNKView.h
//  InterviewPlan
//
//  Created by Mike on 15-4-26.
//  Copyright (c) 2015年 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DNKViewDelegate;

@interface DNKView : UIView

@property (nonatomic, weak) id <DNKViewDelegate> delegate;

@end

@protocol DNKViewDelegate <NSObject>

@required
-(void)view:(DNKView *)view method1:(NSString *)arg1;

@optional
-(void)view:(DNKView *)view method2:(NSString *)arg2;

@end
