//
//  MultyThreadVC.m
//  InterviewPlan
//
//  Created by Mike on 15-4-25.
//  Copyright (c) 2015年 Mike. All rights reserved.
//

#import "MultyThreadVC.h"
#import "CoreGraphicsVC.h"
#import "ABaseView.h"

@interface MultyThreadVC ()

@end

@implementation MultyThreadVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"嘻哈猴";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self testByNSThread];
//    [self testByGCDOfSerialQueue];
    
    [self addButton];
    
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(60, 200, 60, 28)];
//    label.text = @"adfkf";
//    label.adjustsFontSizeToFitWidth = YES;
//    label.backgroundColor = [UIColor redColor];
////    label.minimumFontSize
//    [self.view addSubview:label];
//    [label.text boundingRectWithSize:<#(CGSize)#> options:<#(NSStringDrawingOptions)#> attributes:<#(NSDictionary *)#> context:<#(NSStringDrawingContext *)#>];
    
    UILabel *gettingSizeLabel = [[UILabel alloc] init];
    gettingSizeLabel.font = [UIFont systemFontOfSize:16];
//    NSString *str = @"我啊发生佛发票发票方法地方日他哦皮图片啊打发没看了看开了阿飞的地方的付出相册我宣传宣传宣传的";
    gettingSizeLabel.text = @"我啊发生佛发票发票方法地方日他哦皮图片啊打发没看了看开了阿飞的地方的付出相册我宣传宣传宣传的";
    gettingSizeLabel.numberOfLines = 0;
//    gettingSizeLabel.lineBreakMode = NSLineBreakByClipping;
    CGSize maximumLabelSize = CGSizeMake(310, 9999);
    
    CGSize expectSize = [gettingSizeLabel sizeThatFits:maximumLabelSize];
    [gettingSizeLabel setFrame:CGRectMake(5, 200, expectSize.width, expectSize.height)];
    
//    CGSize maximumLabelSizes = CGSizeMake(310, CGFLOAT_MAX);
    
//    CGRect textRect = [str boundingRectWithSize:maximumLabelSize
//                                             options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
//                                          attributes:@{NSFontAttributeName:gettingSizeLabel.font}
//                                             context:nil];
    
    gettingSizeLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:gettingSizeLabel];
    
//    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
//    view1.tag= 10000;
//    [self.view addSubview:view1];
//    
//    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
//    view2.tag= 10001;
//    [view1 addSubview:view2];
//    
//    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
//    view3.tag= 10002;
//    [view2 addSubview:view3];
//    
//    NSLog(@"subViews : \n%@",view1.subviews);
    
}

- (void)addButton {
    
    ABaseView *scrollView = [[ABaseView alloc]initWithFrame:CGRectMake(230, 490, 80, 50)];
    //    scrollView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:scrollView];
    [scrollView addOtherViews];
    scrollView.buttonBlock = ^(UIButton *sender){
        CoreGraphicsVC *coreGraphics = [[CoreGraphicsVC alloc]init];
        [self.navigationController pushViewController:coreGraphics animated:YES];
    };
    
    
//    UIButton *bt = [UIButton buttonWithType:UIButtonTypeSystem];
//    [bt setFrame:CGRectMake(240, 500, 60, 30)];
////    bt.backgroundColor = [UIColor redColor];
//    [bt addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
//    [bt setTitle:@"页面跳转" forState:UIControlStateNormal];
//    [self.view addSubview:bt];
//    
//    
//    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(230, 490, 80, 50)];
////    scrollView.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:scrollView];
}

- (void)action:(UIButton *)sender {
    CoreGraphicsVC *coreGraphics = [[CoreGraphicsVC alloc]init];
    [self.navigationController pushViewController:coreGraphics animated:YES];
}

#pragma mark - NSThread
- (void)testByNSThread {
    
// 1. NSThread 使用对象方法
    //创建一个线程
//    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(loadData) object:nil];
    //设置线程名称
//    thread.name = @"thread01";
    //设置线程的优先级,线程优先级范围为0~1，值越大优先级越高，每个线程的优先级默认为0.5
//    thread.threadPriority = 0.5;
    //启动一个线程，注意启动一个线程并非就一定立即执行，而是处于就绪状态，当系统调度时才真正执行
//    [thread start];
    
    
// 2. NSThread 使用类方法
    [NSThread detachNewThreadSelector:@selector(loadData) toTarget:self withObject:nil];
    
// 3.NSObject  方法
//    [self performSelectorInBackground:@selector(loadData) withObject:nil];
}

- (void)loadData {
    NSData *data = [self requestData];
    
    //    如果当前线程处于取消状态，则退出当前线程
    NSThread *thread = [NSThread currentThread];
    if (thread.isCancelled) {
        [NSThread exit]; //退出当前线程
    }
    
    [self performSelectorOnMainThread:@selector(updataUIView:) withObject:data waitUntilDone:YES];
}

- (NSData *)requestData {
    
    @autoreleasepool {
        NSURL *url = [NSURL URLWithString:@"http://cdn.duitang.com/uploads/item/201112/30/20111230151815_5EBM3.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        return data;
    }
}

- (void)updataUIView:(NSData *)data {
    
    UIImage *image = [UIImage imageWithData:data];
    
    CGSize fitSize = CGSizeMake(320, CGRectGetHeight(self.view.frame));
    UIGraphicsBeginImageContextWithOptions(fitSize, NO, 0.0);
    CGRect imageRect = CGRectMake(0.0, 0.0, fitSize.width, fitSize.height);
    [image drawInRect:imageRect];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:UIGraphicsGetImageFromCurrentImageContext()];
    
    UIGraphicsEndImageContext();
}

- (void)stopLoad {
//    线程状态分为isExecuting（正在执行）、isFinished（已经完成）、isCancellled（已经取消）三种
    for (int i = 0; i < 10; i++) {
        NSThread *thread;
        
        //判断线程是否完成，如果没有完成则设置为取消状态
        //注意设置为取消状态仅仅是改变了线程状态而言，并不能终止线程
        if (!thread.isFinished) {
            [thread cancel];
        }
    }
}


#pragma mark - NSOperation
#pragma mark - 1.0 NSInvocationOperation
- (void)testByNSInvocationOperation {
    /*创建一个调用操作     
     object:调用方法参数    
     */
    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(loadData) object:nil];
    //创建完NSInvocationOperation对象并不会调用，它由一个start方法启动操作，但是注意如果直接调用start方法，则此操作会在主线程中调用，一般不会这么操作,而是添加到NSOperationQueue中
//    [invocationOperation start];
    
    //创建操作队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    //注意添加到操作队后，队列会开启一个线程执行此操作
    [queue addOperation:invocationOperation];
    
    
}


#pragma mark - 2.0 NSBlockOperation
- (void)testBlockOperation {
    
    //创建操作队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    //设置最大并发线程数
    queue.maxConcurrentOperationCount = 5;
    
    //方法一：创建操作块添加到队列
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        [self loadImage:0];
    }];
    [queue addOperation:blockOperation];
    
    //方法二：直接使用操作队列添加操作
    [queue addOperationWithBlock:^{
        [self loadImage:0];
    }];
    
    NSArray *operations = queue.operations;
    
    //firstObject对象依赖于lastObject  即等到lastObject执行完后，firstObject才执行
    [operations.firstObject addDependency:operations.lastObject];
}

- (void)loadImage:(int)index {
    
//    请求数据
    NSData *data = [self requestData];
    
    //更新UI界面,此处调用了主线程队列的方法（mainQueue是UI主线程）
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self updataUIView:data];
    }];
}


#pragma mark - GCD
#pragma mark - 1.0 串行队列serialQueue
- (void)testByGCDOfSerialQueue {
    
    dispatch_queue_t serialQueue = dispatch_queue_create("com.mySerialQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(serialQueue, ^{
        [self loadData];
    });
}

#pragma mark - 1.0 并行队列concurrentQueue
- (void)testByGCDOfConcurrentQueue {
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    //或者
//    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(concurrentQueue, ^{
        [self loadData];
    });
    
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        <#code#>
//    })
    
//    1. dispatch_apply():重复执行某个任务，但是注意这个方法没有办法异步执行（为了不阻塞线程可以使用dispatch_async()包装一下再执行）。
//    2. dispatch_once():单次执行一个任务，此方法中的任务只会执行一次，重复调用也没办法重复执行（单例模式中常用此方法）。
//    3. dispatch_time()：延迟一定的时间后执行。
//    4. dispatch_barrier_async()：使用此方法创建的任务首先会查看队列中有没有别的任务要执行，如果有，则会等待已有任务执行完毕再执行；同时在此方法后添加的任务必须等待此方法中任务执行后才能执行。（利用这个方法可以控制执行顺序，例如前面先加载最后一张图片的需求就可以先使用这个方法将最后一张图片加载的操作添加到队列，然后调用dispatch_async()添加其他图片加载任务）
//    5. dispatch_group_async()：实现对任务分组管理，如果一组任务全部完成可以通过dispatch_group_notify()方法获得完成通知（需要定义dispatch_group_t作为分组标识）。
//    6.GCD中信号量是dispatch_semaphore_t类型

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

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"MultyThreadVC's view  disappear!");
}



@end
