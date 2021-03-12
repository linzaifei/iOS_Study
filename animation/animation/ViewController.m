//
//  ViewController.m
//  animation
//
//  Created by zifei on 2021/2/5.
//

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,copy)NSArray *arr;
@property(nonatomic,strong)UIView *redView;

@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];


    self.arr = [self readJson];;
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    [tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.view addSubview:tableview];
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];

    cell.textLabel.text = self.arr[indexPath.row][@"title"];
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dic =  self.arr[indexPath.row];
    UIViewController *vc = [[NSClassFromString(dic[@"className"]) alloc] init];
    vc.title =dic[@"title"];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark ---- 读取本地json

-(id)readJson{
    NSString *path =  [[NSBundle mainBundle] pathForResource:@"title" ofType:@"json"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    id JsonObj =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if(!JsonObj|| error){
        NSLog(@"解析错误");
        return  nil;
    }else{
        return  JsonObj;
    }
    
}


@end
