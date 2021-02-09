//
//  ViewController.m
//  GCD
//
//  Created by zifei on 2021/2/2.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self gcd3];
    
    
}
//创建一个异步队列
-(void)createQueue{
    
    /*
     label : 队列标签 char
     attr :队列类型
     DISPATCH_QUEUE_CONCURRENT 并发 （ 既允许多个任务同时执行 (只在异步队列中有效)）
     DISPATCH_QUEUE_SERIAL 连续
     */
    
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    
}

//获取全局并发队列
-(dispatch_queue_global_t)globalQueue{
    
    /*
     <#intptr_t identifier#> -> 表示优先级
     DISPATCH_QUEUE_PRIORITY_...
     
     #define DISPATCH_QUEUE_PRIORITY_HIGH 2
     #define DISPATCH_QUEUE_PRIORITY_DEFAULT 0
     #define DISPATCH_QUEUE_PRIORITY_LOW (-2)
     #define DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN
    
     */
        
    dispatch_queue_global_t q =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    return  q;
}
//同步线程加并发队列
-(void)concurrentQueue{
    //还是在当前的线程上面 （不会开启新的线程 串行 没有线程谈和并发）
    dispatch_queue_global_t  q =  [self globalQueue];
    dispatch_queue_t queue =  dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
    
}

//异步线程 + 串行队列
-(void)serialQueue{
    dispatch_queue_t queue = dispatch_queue_create("0", DISPATCH_QUEUE_SERIAL);
    /*
     DISPATCH_QUEUE_SERIAL 开辟一条子线程并顺序执行 (开启一个新的线程 并且在这一个新的线程上面顺序执行)
     DISPATCH_QUEUE_CONCURRENT 会开辟多个线程 并且通知进行
     
     */
    dispatch_async(queue, ^{
        NSLog(@"1-%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"2-%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"3-%@",[NSThread currentThread]);
    });
    
}

//同步线程 + 串行队列
-(void)syncQueue{
    dispatch_queue_t queue = dispatch_queue_create("syns",DISPATCH_QUEUE_SERIAL );
    /*
     DISPATCH_QUEUE_SERIAL 在主线程中 顺序执行
     DISPATCH_QUEUE_CONCURRENT 如果是同步执行 没有并发和串行 区别
     */
    dispatch_sync(queue, ^{
        sleep(2);
        NSLog(@"1-%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        sleep(3);
        NSLog(@"2-%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"3-%@",[NSThread currentThread]);
    });
    
}

/*
 同步线程 + 主队列 （即串联队列 在主线程）
 若当前线程为主线程 会导致线程阻塞，导致内存溢出崩溃
 */

-(void)mainQueue{
    /*
     如果在主线程中 dispatch_sync
     
     因为执行1- 后的代码相当于一个任务A 该任务A在主队列中顺序执行，
     而且
     任务A 中的sync 会立即执行 相当于任务B 也会立即执行 无法确定A 更优先 还是B更优先 则导致 线程阻塞
     
     如果在主线程中 dispatch_async 即在主线程中执行异步 不会导致崩溃
     */
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"1-%@",[NSThread currentThread]);
    });
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2-%@",[NSThread currentThread]);
    });
}

//在相同的线程中多次执行同步操作也是导致崩溃
-(void)serialMainQueue{
    
    dispatch_queue_t queue = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(queue, ^{
        NSLog(@"1-%@",[NSThread currentThread]);
        dispatch_sync(queue, ^{
            NSLog(@"2-%@",[NSThread currentThread]);
            
        });
    });
}

-(void)otherQueueBackMainQueue{
    NSLog(@"开始");
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"%@",[NSThread currentThread]);
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"1-%@",[NSThread currentThread]);
        });
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"2-%@",[NSThread currentThread]);
        });
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"3-%@",[NSThread currentThread]);
        });
        
        
    });
    NSLog(@"结束");
}
//GCD其他常用函数

-(void)barrierQueue{
    /*
     barrier 阻碍 带有关键字的方法 会在前面的任务结束后才开始执行 后面的任务等其他方法执行完才开始执行
     dispatch_barrier_sync 会阻碍后面的任务 必须等该任务结束之后 后面任务才可以继续进行
     
     barrier 不能用于全局并发队列 和串联队列
     dispatch_barrier_async 相当于并发队列
     */
//  dispatch_queue_global_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t queue = dispatch_queue_create("que", DISPATCH_QUEUE_CONCURRENT);
    
    NSLog(@"开始");
    dispatch_async(queue, ^{
        sleep(3);
        NSLog(@"1-%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        sleep(4);
        NSLog(@"3-%@",[NSThread currentThread]);
    });
    dispatch_barrier_sync(queue, ^{
        NSLog(@"2-%@",[NSThread currentThread]);
    });
    NSLog(@"结束");
}

-(void)gcd{
    
    dispatch_queue_global_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    NSLog(@"进入%@",[NSThread currentThread]);
    dispatch_group_async(group, queue, ^{
        sleep(2);
        NSLog(@"1-%@",[NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        sleep(3);
        NSLog(@"2-%@",[NSThread currentThread]);
    });
    
    dispatch_group_notify(group, queue, ^{
        
        NSLog(@"3-%@",[NSThread currentThread]);
    });
    
    NSLog(@"结束%@",[NSThread currentThread]);
    
    
}

-(void)gcd1{
    
//    dispatch_queue_global_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    
    NSLog(@"进入%@",[NSThread currentThread]);
    dispatch_async( queue, ^{
        sleep(2);
        NSLog(@"1-%@",[NSThread currentThread]);
    });
    dispatch_async( queue, ^{
        sleep(3);
        NSLog(@"2-%@",[NSThread currentThread]);
    });
    
    dispatch_barrier_sync(queue, ^{
        NSLog(@"阻碍-%@",[NSThread currentThread]);
    });
    dispatch_async( queue, ^{
        NSLog(@"3-%@",[NSThread currentThread]);
    });
    
    NSLog(@"结束%@",[NSThread currentThread]);
    
    
}

-(void)gcd2{
//    dispatch_queue_global_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    NSLog(@"进入%@",[NSThread currentThread]);
//    dispatch_async(queue, ^{
        NSLog(@"开辟%@",[NSThread currentThread]);
        dispatch_sync( queue, ^{
            sleep(2);
            NSLog(@"1-%@",[NSThread currentThread]);
        });
        dispatch_sync( queue, ^{
            sleep(3);
            NSLog(@"2-%@",[NSThread currentThread]);
        });
        
        dispatch_sync( queue, ^{
            NSLog(@"3-%@",[NSThread currentThread]);
        });
        
//    });
    
    NSLog(@"结束%@",[NSThread currentThread]);
}

-(void)gcd3{
    
    dispatch_queue_global_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSLog(@"进入%@",[NSThread currentThread]);
    
    //创建一个信号
    dispatch_semaphore_t semap = dispatch_semaphore_create(0);
    dispatch_async( queue, ^{
        sleep(2);
        intptr_t t=    dispatch_semaphore_signal(semap);
        NSLog(@"t=%ld",t);
        NSLog(@"1-%@",[NSThread currentThread]);
    });
    intptr_t t1 = dispatch_semaphore_wait(semap, DISPATCH_TIME_FOREVER);
    NSLog(@"t1=%ld",t1);
    dispatch_async( queue, ^{
      
        sleep(3);
        intptr_t t2=    dispatch_semaphore_signal(semap);
        NSLog(@"t2=%ld",t2);
        NSLog(@"2-%@",[NSThread currentThread]);
    });
    intptr_t t3=   dispatch_semaphore_wait(semap, DISPATCH_TIME_FOREVER);
    NSLog(@"t3=%ld",t3);
    dispatch_async( queue, ^{
        NSLog(@"3-%@",[NSThread currentThread]);
    });
    NSLog(@"结束%@",[NSThread currentThread]);
}
@end
