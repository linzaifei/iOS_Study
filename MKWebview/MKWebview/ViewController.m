//
//  ViewController.m
//  MKWebview
//
//  Created by zifei on 2021/2/4.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>


@interface ViewController ()<WKNavigationDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    WKWebView *web = [[WKWebView alloc] initWithFrame:self.view.bounds];
    web.navigationDelegate = self;
//    [web evaluateJavaScript:@"我是js" completionHandler:^(id _Nullable response, NSError * _Nullable error) {
//
//    }];
    
    
    [self.view addSubview:web];
    
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    //设置JS
       NSString *inputValueJS = @"document.getElementsByName('input')[0].attributes['value'].value";
    
    [webView evaluateJavaScript:inputValueJS completionHandler:^(id _Nullable res, NSError * _Nullable error) {

    }];
    
    
}


@end
