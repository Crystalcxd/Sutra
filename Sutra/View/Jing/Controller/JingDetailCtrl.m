//
//  JingDetailCtrl.m
//  Sutra
//
//  Created by medica_mac on 2017/6/14.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "JingDetailCtrl.h"

#import "AppDelegate.h"

#import <MBProgressHUD/MBProgressHUD.h>
#import <RNCryptor_objc/RNDecryptor.h>

#import <RDVTabBarController/RDVTabBarController.h>
#import <RDVTabBarController/RDVTabBarItem.h>
#import <RDVTabBarController/RDVTabBar.h>

@interface JingDetailCtrl ()<UIWebViewDelegate>

- (void)configureView;

@end

@implementation JingDetailCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setUI];
    [self configureView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    RDVTabBarController *vc = (RDVTabBarController *)appDelegate.window.rootViewController;
    [vc setTabBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    RDVTabBarController *vc = (RDVTabBarController *)appDelegate.window.rootViewController;
    [vc setTabBarHidden:NO];
}

- (void)setUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _webView.backgroundColor = [UIColor whiteColor];
    _webView.scrollView.pagingEnabled = YES;
    _webView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        NSLog(@"set Detail configview %@",self.detailItem);
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.detailItem) {
        NSString *jingName = self.detailItem[@"url"];

        self.navigationItem.title = self.detailItem[@"name"];//@"阿弥陀经";
        
        NSArray *array = [jingName componentsSeparatedByString:@"."];
        NSString *htmlFileName = [array firstObject];
        
        //获取文件路径
        NSString *path = [[NSBundle mainBundle] pathForResource:htmlFileName ofType:@"htm"];
        if(path!=NULL){
            NSString *path = [[NSBundle mainBundle] pathForResource:htmlFileName ofType:@"htm"];
            
            NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
            
            NSString *basePath = [[NSBundle mainBundle] bundlePath];
            
            NSURL *baseURL = [NSURL fileURLWithPath:basePath];
            
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            [self.webView loadHTMLString:htmlString baseURL:baseURL];
        }else{
            NSString *path = [[NSBundle mainBundle] pathForResource:htmlFileName ofType:@"html"];
            if(path!=NULL){
                NSString *path = [[NSBundle mainBundle] pathForResource:htmlFileName ofType:@"html"];
                
                NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
                
                NSString *basePath = [[NSBundle mainBundle] bundlePath];
                
                NSURL *baseURL = [NSURL fileURLWithPath:basePath];
                
                [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                [self.webView loadHTMLString:htmlString baseURL:baseURL];
                
            }else{
                NSData *encryptedData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:jingName ofType:nil]];
                
                [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSError *error;
                    NSData *decryptedData = [RNDecryptor decryptData:encryptedData
                                                        withPassword:@"boahankook0713"
                                                               error:&error];
                    if (!error) {
                        [_webView loadData:decryptedData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
                    }else{
                        [MBProgressHUD hideHUDForView:self.view animated:YES];
                    }
                });
            }
        }
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    // 1、只对本地html资源的图片有效果
    NSString *js = @"function imgAutoFit() { \
    var imgs = document.getElementsByTagName('img'); \
    for (var i = 0; i < imgs.length; ++i) {\
    var img = imgs[i];   \
    img.style.maxWidth = %f;   \
    } \
    }";
    js = [NSString stringWithFormat:js, [UIScreen mainScreen].bounds.size.width - 20];
    [webView stringByEvaluatingJavaScriptFromString:js];
    [webView stringByEvaluatingJavaScriptFromString:@"imgAutoFit()"];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
