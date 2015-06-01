//
//  DrawLayerDemo.m
//  InterviewPlan
//
//  Created by Mike on 15-4-25.
//  Copyright (c) 2015年 Mike. All rights reserved.
//

#import "DrawLayerDemo.h"

@interface DrawLayerDemo () {
    MyLayerDelegate * _layerDelegate;
}

@end

@implementation DrawLayerDemo

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)drawSomethingOnLayer {
    CALayer *myLayer = [CALayer layer];
    myLayer.bounds = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    myLayer.position = CGPointMake(CGRectGetWidth(self.frame)/2.0, CGRectGetHeight(self.frame)/2.0);
     _layerDelegate = [[MyLayerDelegate alloc]init];
    //    myLayer.backgroundColor = [UIColor redColor].CGColor;
    myLayer.delegate = _layerDelegate;
    [self.layer addSublayer:myLayer];
    [myLayer setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc {
    
//    _layerDelegate = nil;
    NSLog(@"DrawLayerDemo dealloc !!!");
}

@end



@implementation MyLayerDelegate

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    
    [self drawLayerByUIBezierPath:ctx];
}

#pragma mark - UIKit  UIBezierPath

- (void)drawLayerByUIBezierPath:(CGContextRef)ctx {
    
    UIGraphicsPushContext(ctx);
    
    UIBezierPath *p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    [[UIColor blueColor] setFill];
    
    [p fill];
    
    UIGraphicsPopContext();
}

#pragma mark - Core Graphics CGContextRef

- (void)drawLayerByCGContextRef:(CGContextRef)ctx {
    
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
    
    [[UIColor blueColor] setFill];
    CGContextFillPath(ctx);
}

- (void)dealloc {
    
    NSLog(@"MyLayerDelegate dealloc !!!");
}

@end
