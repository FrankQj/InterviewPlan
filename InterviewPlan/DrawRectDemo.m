//
//  DrawRectDemo.m
//  InterviewPlan
//
//  Created by Mike on 15-4-25.
//  Copyright (c) 2015年 Mike. All rights reserved.
//

#import "DrawRectDemo.h"

@implementation DrawRectDemo

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

///*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self drawByCGContextRef];
}
//*/
#pragma mark - UIKit  UIBezierPath

- (void)drawByUIBezierPath {
    UIBezierPath *p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    [[UIColor blueColor] setFill];
    
    [p fill];
}

#pragma mark - Core Graphics CGContextRef

- (void)drawByCGContextRef {
    
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(con, CGRectMake(0, 0, 100, 100));
    
    [[UIColor blueColor] setFill];
    CGContextFillPath(con);
}


@end
