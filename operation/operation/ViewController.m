//
//  ViewController.m
//  operation
//
//  Created by zifei on 2021/2/2.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self  opertionMainQueue5];
}


-(void)operation{
    
//    NSOperation *op = [NSOperation ]
//    NSOperationQueue queue = [NSOperationQueue ]
    
    NSBlockOperation *block = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    [block addExecutionBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    [block addExecutionBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    [block addExecutionBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    [block start];
    
    NSBlockOperation *block1 = [[NSBlockOperation alloc] init];
    [block1 addExecutionBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
    
    [block1 start];
    
    
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(startOpertion) object:nil];
    
    [op start];
}

-(void)startOpertion{
    
    sleep(3);
    NSLog(@"%@",[NSThread currentThread]);
    
}


-(void)opertionMainQueue{
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    NSBlockOperation *block = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1-%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *block1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2-%@",[NSThread currentThread]);
    }];
    
    [queue addOperation:block];
    [queue addOperation:block1];
}

//添加阻碍
-(void)opertionMainQueue1{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperationWithBlock:^{
        NSLog(@"1-%@",[NSThread currentThread]);
    }];
    
    [queue addOperationWithBlock:^{
        sleep(3);
        NSLog(@"2-%@",[NSThread currentThread]);
    }];
    [queue addBarrierBlock:^{
        NSLog(@"3-%@",[NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"4-%@",[NSThread currentThread]);
    }];
}

//设置 串 并列 maxConcurrentOperationCount
-(void)opertionMainQueue2{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    
    queue.maxConcurrentOperationCount = 1; // 串行队列
// queue.maxConcurrentOperationCount = 2; // 并发队列
// queue.maxConcurrentOperationCount = 8; // 并发队列
    
    [queue addOperationWithBlock:^{
        sleep(3);
        NSLog(@"1-%@",[NSThread currentThread]);
    }];
    
    [queue addOperationWithBlock:^{
        NSLog(@"2-%@",[NSThread currentThread]);
    }];
    
 
    
    
    
}

//添加依赖
-(void)opertionMainQueue3{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSBlockOperation *block = [NSBlockOperation blockOperationWithBlock:^{
        sleep(3);
        NSLog(@"1-%@",[NSThread currentThread]);
    }];
    NSBlockOperation *block1 = [NSBlockOperation blockOperationWithBlock:^{
        sleep(3);
        NSLog(@"2-%@",[NSThread currentThread]);
    }];
    
    //设置依赖 blcok 需要用到block1
    [block addDependency:block1];
    
    
    [queue addOperation:block];
    [queue addOperation:block1];
    
}

//优先级
-(void)opertionMainQueue4{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    NSBlockOperation *block = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1-%@",[NSThread currentThread]);
    }];
    block.queuePriority = NSOperationQueuePriorityNormal;
    NSBlockOperation *block2 = [NSBlockOperation blockOperationWithBlock:^{
     
        NSLog(@"2-%@",[NSThread currentThread]);
    }];
    block2.queuePriority = NSOperationQueuePriorityHigh;
    NSBlockOperation *block3 = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"3-%@",[NSThread currentThread]);
    }];
    
    
    [queue addOperation:block];
    [queue addOperation:block2];
    [queue addOperation:block3];
}

//操作 题用NSOpertion和NSOpertionQueue处理A，B，C三个线程，要求执行完A，B后才能执行C，怎么做?

-(void)opertionMainQueue5{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //方法二 设置串联请求
    queue.maxConcurrentOperationCount =1;
    
    NSBlockOperation *blockA = [NSBlockOperation blockOperationWithBlock:^{
        sleep(2);
        NSLog(@"1-%@",[NSThread currentThread]);
    }];
    NSBlockOperation *blockB = [NSBlockOperation blockOperationWithBlock:^{
        sleep(3);
        NSLog(@"2-%@",[NSThread currentThread]);
    }];

    //方法二 添加阻碍
    
    NSBlockOperation *blockC = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"3-%@",[NSThread currentThread]);
    }];
    
//    方法一 添加依赖
//    [blockC addDependency:blockA];
//    [blockC addDependency:blockB];
    
    
    
    [queue addOperation:blockA];
    [queue addOperation:blockB];
    [queue addOperation:blockC];
    
}

@end
