//
//  ViewController.m
//  算法题
//
//  Created by zifei on 2021/2/18.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self project10];

}

#pragma mark - 算法题一
/*
1. 给定一个数字数组 arr, 一个值 sum, 找出数组中两个的和为值a的元素 的返回下标 index1, index2(用数组[index1, index2] 返回, 假设都只有一种答案, 并且数组中元素不重复)
 [1,5,7,3,8] sum = 10
 */
-(void)project{
  
  NSArray *arr = @[@1,@5,@7,@3,@8];
  NSArray *idx =  [self arithmetic2:arr sum:10];
  NSLog(@"idx =%@",idx);
}

/*
 1、方法一for循环

 2021-02-18 10:11:00.911478+0800 算法题[1893:65475] 1 5
 2021-02-18 10:11:00.911653+0800 算法题[1893:65475] 1 7
 2021-02-18 10:11:00.911741+0800 算法题[1893:65475] 1 3
 2021-02-18 10:11:00.911800+0800 算法题[1893:65475] 1 8
 2021-02-18 10:11:00.911878+0800 算法题[1893:65475] 5 7
 2021-02-18 10:11:00.911940+0800 算法题[1893:65475] 5 3
 2021-02-18 10:11:00.911997+0800 算法题[1893:65475] 5 8
 2021-02-18 10:11:00.912050+0800 算法题[1893:65475] 7 3
 2021-02-18 10:11:00.912114+0800 算法题[1893:65475] ---- 2  3
 2021-02-18 10:11:00.912173+0800 算法题[1893:65475] 7 8
 2021-02-18 10:11:00.912417+0800 算法题[1893:65475] 3 8
 */
-(NSArray *)arithmetic1:(NSArray *)arr sum:(int)sum{
    for (int i=0; i<arr.count; i++) {
        for (int j=i+1; j<arr.count; j++) {
            NSLog(@"%@ %@",arr[i],arr[j]);
            if([arr[i] intValue] + [arr[j] intValue] ==sum){
                NSLog(@"---- %d  %d",i,j);
                return @[@(i),@(j)];
                break;
            }
        }
    }
    return @[];
}

/*
 
 方法二：哈希算法
 哈希表是根据关键码值(Key value)而直接进行访问的数据结构。也就是说，它通过把关键码值映射到表中一个位置来访问记录，以加快查找的速度。这个映射函数叫做散列函数，存放记录的数组叫做散列表。

 给定表M，存在函数f(key)，对任意给定的关键字值key，代入函数后若能得到包含该关键字的记录在表中的地址，则称表M为哈希(Hash）表，函数f(key)为哈希(Hash) 函数。

 */
-(NSArray *)arithmetic2:(NSArray *)arr sum:(int)sum{
   
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    for (int i=0; i<arr.count; i++) {
        [dic setValue: [NSString stringWithFormat:@"%d", i] forKey:[NSString stringWithFormat:@"%@",arr[i]]];
    }
    NSLog(@"dic %@ %@",dic,dic.allKeys);
    for (int j =0; j<arr.count; j++) {
        int ob = sum - [arr[j] intValue];
        NSString *key = [NSString stringWithFormat:@"%d",ob];
        if([dic valueForKey:key] && [dic[key] intValue] != j){
            NSLog(@"%d %@", j,dic[key]);
            return @[@(j),dic[key]];
        }
    }
    return @[];
}

#pragma mark -算法题二 
/*
 斐波那契数列, 又称黄金分割序列 ( 0.0很高大上的名字, 但我始终不太理解为什么又这么称呼 )

 即, 给定初始2个值, 第三位起, 每一项位前两位之和

 例如:  给定初始值 0, 1 那么,  斐波那契数列为   0, 1, 1, 2, 3, 5, 8, 13, 21, 34......

 可以看出其 数学公式 为:

 n = 1时   f(n) = 0;  n = 2时   f(n) = 1;

 n >3时  f(n) = f(n-1) + f(n-2)

 (注: 留意下, 这里我们采用是数学位,  即第一位为0,  编程久的人喜欢称为第0位 ^-^ )


 且要保证运算最少(这个重点)
 拆分下可以看出, 处理斐波 即重点处理   f(n) = f(n-1) + f(n-2),  往下细分

 f(n-1) = f(n-2) + f(n-3)

 f(n-2) = f(n-3) + f(n-4)

 f(n-3) = f(n-4) + f(n-5)

 ....

 f(2) = 1

 f(1) = 0

 反复调用自身方法, 直到 n= 2, n=1,  这样可以写出
 */

-(void)project2{
    int x = [self sum1:8];
    NSLog(@"x = %d",x);
}
/*
 0 1   开始
 2->1
 3->2
 0 1 1 2 3 5 8 13 21 34
 输入一个下表查找到对应的数
 */
-(int)sum:(int)count{
   
    if(count<3){
        NSLog(@"进入1");
        return count - 1;
    }
    NSLog(@"进入2");
    return [self sum:count-1]+[self sum:count-2];
}

-(int)sum1:(int)count{
    if(count==1){
        return  0;
    }
    int co = 0;
    int next = 1;
    int add = 0;
    for (int i=2; i<count; i++) {
        add = co + next;
        co = next;
        next = add;
    }
    return  next;
}

#pragma mark -算法题三

/*
 一个2n个元素的数组, 前n个 x1, x2...xn 后n个y1, y2...yn 重新排列成x1, y1, x2, y2...xn, yn
 给定数组 arr = [1, 3, 5, 6, 0, 7, 4, 2] 给定值 n = 4, 重新排列结果 result = [1, 0, 3, 7, 5, 4, 6, 2]
 
 */
 
-(void)project3{
    NSArray *arr =@[@1, @3, @5, @6, @0, @7, @4, @2];
    [self paixu:arr];
}
-(void)paixu:(NSArray *)arr{
    
    NSMutableArray *a = [NSMutableArray array];
    for (int i=0; i<arr.count/2; i++) {
        [a addObject:arr[i]];
        [a addObject:arr[i+arr.count/2]];
    }
    NSLog(@"a=%@",a);
    
}

#pragma mark -算法题四
/*
 给定一个数组 nums , 返回 nums 的动态和
 数组「动态和」的计算公式为：runningSum[i] = sum(nums[0]…nums[i]) 。
 给定 nums = [1, 2, 3, 4, 5]
 返回 result = [1, 3, 6, 10, 15] 即 [1, 1+2, 1+2+3, 1+2+3+4, 1+2+3+4+5]

 给定 nums = [2, 2, 2, 2]
 返回 result = [2, 4, 6, 8] 即 [2, 2+2, 2+2+2, 2+2+2+2]

 */
-(void)project4{
  
    NSArray *arr = @[@1, @2, @3, @4, @5, @6];
    NSArray *arr1 = [self sum3:arr];
    NSLog(@"%@",arr1);
}


-(NSArray *)sum3:(NSArray *)arr{
    NSMutableArray *sumArr = [NSMutableArray array];
    for (int i=0; i<arr.count; i++) {
        int add = [arr[i] intValue];
        for (int j=0; j<i; j++) {
            add += [arr[j] intValue];
        }
        [sumArr addObject:[NSString stringWithFormat:@"%d",add]];
    }
    return sumArr;
}

#pragma mark -算法题五
/*
 在柠檬水摊上，每一杯柠檬水的售价为 5 美元。
 顾客排队购买你的产品，（按账单 bills 支付的顺序）一次购买一杯。
 每位顾客只买一杯柠檬水，然后向你付 5 美元、10 美元或 20 美元。你必须给每个顾客正确找零，也就是说净交易是每位顾客向你支付 5 美元。
 注意，一开始你手头没有任何零钱。
 如果你能给每位顾客正确找零，返回 true ，否则返回 false 。
 
 **/

-(void)project5{

    NSArray *arr = @[@5,@5,@10,@10,@20];
    
    int f = 0;
    int t = 0;
    for (NSNumber *x in arr) {
        if([x intValue] ==5){
            f++;
        }else if([x intValue] ==10){
            if(f>0){
                t++ ;
                f--;
            }else{
                NSLog(@"失败");
                break;
            }
        }else if([x intValue] ==20){
            if(!((t>0 && f>0) || (t==0 && f==3))){
                NSLog(@"失败1");
                break;
            }
        }
    }
    
    NSLog(@"t =%d f =%d",t ,f);
}

#pragma mark -算法题六 杨辉三角
/*
 [1]        n=0
 [1,1]      n=1
 [1,2,1]    n=2
 [1,3,3,1]  n=3
 [1,4,6,4,1]  n=4
 [1,5,10,10,5,1]  n=5
 [1,6,15,20,15,6,1]  n=6
 */
-(void)project6{
 
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i=0; i<7; i++) {
        if (i==0)  [arr addObject:@[@1]];
        else if (i==1) [arr addObject:@[@1,@1]];
        else if (i==1) [arr addObject:@[@1,@2,@1]];
        else{
            NSMutableArray *a = [NSMutableArray array];
            [a addObject:@1];
            for (int j=0; j<i-1; j++) {
                int b = [arr[i-1][j] intValue] +[arr[i-1][j+1] intValue];
                [a addObject:@(b)];
            }
            [a addObject:@1];
            [arr addObject:a];
        }
    }
    
    NSLog(@"arr = %@",arr);
}

#pragma mark -算法题七
/*
 给定 n 个整数，找出平均数最大且长度为 k 的连续子数组，并输出该最大平均数。
 输入：[1,12,-5,-6,50,3], k = 4
 输出：12.75
 解释：最大平均数 (12-5-6+50)/4 = 51/4 = 12.75
 */
-(void)project7{

    NSArray *arr = @[@1,@12,@-5,@-6,@50,@3];
    int left = 0;
    int right = 4;
    int max = 0;
    while (right<arr.count) {
        int x = 0;
        for (int i=left; i<right; i++) {
            NSLog(@"%@",arr[i]);
            x+=[arr[i] intValue];
        }
        NSLog(@"---%d %d %d",x,left ,right);
        if(x>max){
            max = x;
        }
        left++;
        right++;
    }
    NSLog(@"max--%f",max/4.0);
}

#pragma mark -算法题八 只出现一次的数字
/*
 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
 输入: [2,2,1]
 输出: 1

 输入: [4,1,2,1,2]
 输出: 4
 */
-(void)project8{
    
    NSArray *arr = @[@4,@1,@2,@1,@2];
    int result = 0;
    
    for (NSNumber *x in arr) {
        result = result^ [x intValue];
        NSLog(@"%d",result);
    }
    
    NSLog(@"result =%d",result);
}


#pragma mark -算法题九
/*
 给定一个正整数的数组, 给定个正整数, 求正整数数组, 找出最小的连续数组使得相加之和>=给定的正整数, 没有返回0

 例如 arr = [2, 3, 1, 2, 4, 3] , s = 7, 返回 [4, 3]

 */
-(void)project9{
    NSArray * arr = @[@2, @3, @1, @2, @4, @3];
   NSArray *a = [self sub2:arr];
    NSLog(@"arr =%@",a);
    
}
//方式一循环
-(NSArray*)sub1:(NSArray *)arr{

    int min = (int )arr.count + 1;
    for (int i =0; i<arr.count; i++) {
        int sum =0;
        for (int j=i; j<arr.count; j++) {
            sum +=[arr[j] intValue];
            if(sum>=7){
                min = (j-i +1)<min?(j-i+1):min;
                break;
            }
        }
    }
    NSLog(@"min = %d",min);
    
    return @[];
}
//方式二 双指针法
-(NSArray*)sub2:(NSArray *)arr{
    int left=0;
    int right=0;int sum =0;
    int min = (int )arr.count + 1;
    while (right<(int)arr.count) {
        sum += [arr[right] intValue];
        while (sum>= 7) {
            min = (right-left+1)<min?(right-left+1):min;
            sum -= [arr[left] intValue];
            left++;
        }
        right++;
    }
    NSLog(@"min = %d",min);
    
    return  @[];
}



#pragma mark -算法题十
/*
 给你一个字符串 s 和一个字符 c ，且 c 是 s 中出现过的字符。

 返回一个整数数组 answer ，其中 answer.length == s.length 且 answer[i] 是 s 中从下标 i 到离它 最近 的字符 c 的 距离 。

 两个下标 i 和 j 之间的 距离 为 abs(i - j) ，其中 abs 是绝对值函数。

  

 示例 1：

 输入：s = "loveleetcode", c = "e"
 输出：[3,2,1,0,1,0,0,1,2,2,1,0]
 解释：字符 'e' 出现在下标 3、5、6 和 11 处（下标从 0 开始计数）。
 距下标 0 最近的 'e' 出现在下标 3 ，所以距离为 abs(0 - 3) = 3 。
 距下标 1 最近的 'e' 出现在下标 3 ，所以距离为 abs(1 - 3) = 3 。
 对于下标 4 ，出现在下标 3 和下标 5 处的 'e' 都离它最近，但距离是一样的 abs(4 - 3) == abs(4 - 5) = 1 。
 距下标 8 最近的 'e' 出现在下标 6 ，所以距离为 abs(8 - 6) = 2 。
 示例 2：

 输入：s = "aaab", c = "b"
 输出：[3,2,1,0]
 */


-(void)project10{
    
//    NSString *s = @"loveleetcode";
//    NSString *c = @"e";
    
    
    NSString *s = @"aaab";
      NSString *c = @"b";
    
    [self getArr:s c:c];
}

-(NSArray *)getArr:(NSString *)s c:(NSString *)c{
    
    //不包含这个字符串
    if(![s containsString:c]){
        return @[];
    }
    

    NSMutableArray *arr = [NSMutableArray array];

    int x = 0;
    int perviewIndex = 0;
    int p = 0;
    while (x < s.length) {
        NSRange range = NSMakeRange(x, 1);
        NSString *sub = [s substringWithRange:range];
       
        if([sub isEqual:c]){
            /*
             loveleetcode
             x= 3
             3-0 3-0
             3-1 3-1
             */
            if(perviewIndex!=0){
                
                for (int i=perviewIndex+1; i<=x; i++) {
                    if(abs(i-perviewIndex)<abs(x-i) ){
                        [arr addObject:@(abs(i-perviewIndex))];
                    }else{
                        [arr addObject:@(abs(x-i))];
                    }
                   
                }
            }else{
                for (int i=perviewIndex; i<=x; i++) {
                        [arr addObject:@(abs(x-i))];
                }
            }
           
            
            NSLog(@"x-%@ %d",sub,x);
            perviewIndex = x;
        }
        x++;
    }
    NSLog(@"x-%@",arr);
    
    
    return @[];
}

@end

