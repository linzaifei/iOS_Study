//
//  ViewController.m
//  lock
//
//  Created by zifei on 2021/2/3.
//

#import "ViewController.h"
#import <os/lock.h>
#import <pthread/pthread.h>
@interface ViewController ()
@property(nonatomic,assign)int money;
//@property(nonatomic,strong) NSLock *lock;
@property(nonatomic,assign)os_unfair_lock lock;
@property(nonatomic ,strong) dispatch_semaphore_t semap;

@property(nonatomic,assign)pthread_mutex_t mutex;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.money = 100;
    
    //1.互斥锁
    self.lock = OS_UNFAIR_LOCK_INIT;
    
    
//    self.lock = [[NSLock alloc] init];
    
//    self.semap = dispatch_semaphore_create(1);
    
    /*
     #define PTHREAD_MUTEX_NORMAL        0
     #define PTHREAD_MUTEX_ERRORCHECK    1
     #define PTHREAD_MUTEX_RECURSIVE        2
     #define PTHREAD_MUTEX_DEFAULT        PTHREAD_MUTEX_NORMAL
     */
//    pthread_mutexattr_t atter;
//    pthread_mutexattr_settype(&atter, PTHREAD_MUTEX_NORMAL); //设置锁属
//    pthread_mutex_init(&_mutex, &atter);//给锁加上属性
    
    [ self userOperation];
   
    
}

/*
 用NSOperation
 1. 两个线程同时操作monery
 */
-(void)userOperation{
    /*
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSOperationQueue *queue1 = [[NSOperationQueue alloc] init];
    NSBlockOperation *block = [NSBlockOperation blockOperationWithBlock:^{
        for(int i=0;i<5;i++){
            [self saveMonery];
        }
        NSLog(@"1-%@",[NSThread currentThread]);
    }];
    NSBlockOperation *block1 = [NSBlockOperation blockOperationWithBlock:^{
        for(int i=0;i<5;i++){
            [self drawMoney];
        }
        NSLog(@"2-%@",[NSThread currentThread]);
        
    }];
    
    [queue addOperation:block];
    [queue1 addOperation:block1];
     */


    dispatch_queue_global_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSLog(@"1-%@",[NSThread currentThread]);
        for(int i=0;i<5;i++){
            [self save];
        }
       
    });
    dispatch_async(queue, ^{
        NSLog(@"2-%@",[NSThread currentThread]);
        for(int i=0;i<5;i++){
            [self draw];
        }
    });
}

-(void)save{
//    [self.lock lock];
//    os_unfair_lock_lock(&_lock);
//    dispatch_semaphore_wait(self.semap, DISPATCH_TIME_FOREVER);
//    pthread_mutex_lock(&_mutex);
    
//    @synchronized (self) {
//        [self saveMonery];
//    }
    [self saveMonery];
    
    
//    pthread_mutex_unlock(&_mutex);
//    dispatch_semaphore_signal(self.semap);
//    os_unfair_lock_unlock(&_lock);
    //    [self.lock unlock];
}
-(void)draw{
//    [self.lock lock];
//    os_unfair_lock_lock(&_lock);
//    dispatch_semaphore_wait(self.semap, DISPATCH_TIME_FOREVER);
//    pthread_mutex_lock(&_mutex);
    
//    @synchronized (self) {
//        [self drawMoney];
//    }
    [self drawMoney];
    
//    pthread_mutex_unlock(&_mutex);
//    dispatch_semaphore_signal(self.semap);
//    os_unfair_lock_unlock(&_lock);
//    [self.lock unlock];
}



-(void)saveMonery{
    int oldMoney = self.money;
       sleep(0.3);
       oldMoney += 40;
       self.money = oldMoney;
    NSLog(@"存40元，余额%d元---%@", self.money, [NSThread currentThread]);
}
- (void)drawMoney {
    int oldMoney = self.money;
    sleep(0.3);
    oldMoney -= 20;
    self.money = oldMoney;
    NSLog(@"取20元，余额%d元---%@", self.money, [NSThread currentThread]);
}



@end
