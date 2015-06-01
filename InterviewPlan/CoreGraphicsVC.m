//
//  CoreGraphicsVC.m
//  InterviewPlan
//
//  Created by Mike on 15-4-25.
//  Copyright (c) 2015年 Mike. All rights reserved.
//

#import "CoreGraphicsVC.h"
#import "DrawRectDemo.h"
#import "DrawLayerDemo.h"


@interface CoreGraphicsVC ()

@end

@implementation CoreGraphicsVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self testOfCGPath];
    [self testOfCGContextRef];
//    [self testOfUIBezierPath];
    
    DrawRectDemo *drawRectView = [[DrawRectDemo alloc]initWithFrame:CGRectMake(0, 200, 320, 150)];
    drawRectView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:drawRectView];
    
    
//    UIButton *bt = [[UIButton alloc]initWithFrame:CGRectMake(240, 400, 40, 20)];
//    bt.backgroundColor = [UIColor redColor];
//    [bt addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:bt];
    
    DrawLayerDemo *drawLayerView = [[DrawLayerDemo alloc]initWithFrame:CGRectMake(0, 360, 320, 200)];
    drawLayerView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:drawLayerView];
    [drawLayerView drawSomethingOnLayer];
    
//    CALayer *myLayer = [CALayer layer];
//    myLayer.bounds = CGRectMake(0, 0, 320, 200);
//    myLayer.position = CGPointMake(160, 100);
//    MyLayerDelegate *layerDelegate = [[MyLayerDelegate alloc]init];
//    //    myLayer.backgroundColor = [UIColor redColor].CGColor;
//    myLayer.delegate = layerDelegate;
//    [drawLayerView.layer addSublayer:myLayer];
//    [myLayer setNeedsDisplay];
}

- (void)action:(UIButton *)sender {
    
    DrawLayerDemo *drawLayerView = [[DrawLayerDemo alloc]initWithFrame:CGRectMake(0, 320, 320, 200)];
    drawLayerView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:drawLayerView];
    
    CALayer *myLayer = [CALayer layer];
    myLayer.bounds = CGRectMake(0, 0, 320, 200);
    myLayer.position = CGPointMake(160, 100);
//    MyLayerDelegate *layerDelegate = [[MyLayerDelegate alloc]init];
//    myLayer.backgroundColor = [UIColor redColor].CGColor;
    myLayer.delegate = self;
    [drawLayerView.layer addSublayer:myLayer];
    [myLayer setNeedsDisplay];
    
    
}

#pragma mark - CGPath
- (void)testOfCGPath {
    
    //开始图像绘图
//    UIGraphicsBeginImageContext(self.view.bounds.size);
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 1);
    
    //获取当前的CGContextRef
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
//    创建用于转移坐标的Transform，这样我们不用按照实际显示做坐标计算（图像开始的初始位置）
    CGAffineTransform transform = CGAffineTransformMakeTranslation(110, 50);
//    创建CGMutablePathRef
    CGMutablePathRef path = CGPathCreateMutable();
    
//    左眼
    CGPathAddEllipseInRect(path, &transform, CGRectMake(0, 0, 20, 20));
//    右眼
    CGPathAddEllipseInRect(path, &transform, CGRectMake(80, 0, 20, 20));
//    笑
    CGPathMoveToPoint(path, &transform, 100, 50);
    CGPathAddArc(path, &transform, 50, 50, 50, 0, M_PI, NO);
//    将CGMutablePathRef添加到当前context内
    CGContextAddPath(gc, path);
//    设置属性
    //设置线条颜色
    [[UIColor blueColor] setStroke];
    //设置线条宽度
    CGContextSetLineWidth(gc, 2);
//    执行绘画
    CGContextStrokePath(gc);
    
//    从context中获取图像，并显示在界面上
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    UIImageView *imgView = [[UIImageView alloc]initWithImage:img];
    [self.view addSubview:imgView];
}


#pragma mark - CGContextRef
- (void)testOfCGContextRef {
    
    UIGraphicsBeginImageContext(self.view.bounds.size);
    
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(gc, 50, 80);
    
    //左眼
    CGContextAddEllipseInRect(gc, CGRectMake(0, 0, 20, 20));
    //右眼
    CGContextAddEllipseInRect(gc, CGRectMake(80, 0, 20, 20));
    //笑
    CGContextMoveToPoint(gc, 100, 50);
    CGContextAddArc(gc, 50, 50, 50, 0, M_PI, NO);
    
//    画线的颜色
    [[UIColor redColor] setStroke];
    //CGContextSetStrokeColorWithColor(gc, [UIColor redColor].CGColor);
    
//    填充的颜色
    //[[UIColor redColor] setFill];
    //CGContextSetFillColorWithColor(gc, [UIColor redColor].CGColor);
    
    CGContextSetLineWidth(gc, 2);
    
//    画线轨迹
    CGContextStrokePath(gc);
    
//    填充轨迹
    //CGContextFillPath(gc);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imgView = [[UIImageView alloc]initWithImage:img];
    [self.view addSubview:imgView];
}


#pragma mark - UIBezierPath
- (void)testOfUIBezierPath {
    
    
    UIGraphicsBeginImageContext(self.view.bounds.size);
    
    //创建UIBezierPath
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //左眼
    [path appendPath:[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 20, 20)]];
    //右眼
    [path appendPath:[UIBezierPath bezierPathWithOvalInRect:CGRectMake(80, 0, 20, 20)]];
    
//    笑
    [path moveToPoint:CGPointMake(100, 50)];
    
    [path addArcWithCenter:CGPointMake(50, 50) radius:50 startAngle:0 endAngle:M_PI clockwise:YES];
    
    [path applyTransform:CGAffineTransformMakeTranslation(50, 50)];
    
    [[UIColor greenColor] setStroke];
    
    [path setLineWidth:2];
    
    [path stroke];
    
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imgView = [[UIImageView alloc]initWithImage:img];
    [self.view addSubview:imgView];
    
    
    
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

//- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
//    
//    [self drawLayerByUIBezierPath:ctx];
//}
//
//#pragma mark - UIKit  UIBezierPath
//
//- (void)drawLayerByUIBezierPath:(CGContextRef)ctx {
//    
//    UIGraphicsPushContext(ctx);
//    
//    UIBezierPath *p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
//    [[UIColor blueColor] setFill];
//    
//    [p fill];
//    
//    UIGraphicsPopContext();
//}
//
//#pragma mark - Core Graphics CGContextRef
//
//- (void)drawLayerByCGContextRef:(CGContextRef)ctx {
//    
//    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
//    
//    [[UIColor blueColor] setFill];
//    CGContextFillPath(ctx);
//}

- (void)dealloc {
    
    NSLog(@"CoreGraphicsVC dealloc !!!");
}

@end
