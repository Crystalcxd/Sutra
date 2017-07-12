//
//  JingDetailCtrl.m
//  Sutra
//
//  Created by medica_mac on 2017/6/14.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "JingDetailCtrl.h"

#import <MBProgressHUD/MBProgressHUD.h>

#import <RNCryptor_objc/RNDecryptor.h>

@interface JingDetailCtrl ()<UIWebViewDelegate>

- (void)configureView;

@end

@implementation JingDetailCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"ViewLoad configview %@",self.detailItem);
    [self configureView];
    
    _webView.scrollView.pagingEnabled = YES;
    _webView.delegate = self;
    
    self.navigationController.navigationBarHidden = YES;
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
    NSLog(@"configureView%@",self.detailItem);
    if (self.detailItem) {
//        NSString *resourcePath = [ [NSBundle mainBundle] resourcePath];
        NSString *jingName = self.detailItem[@"url"];

        self.navigationItem.title = self.detailItem[@"name"];//@"阿弥陀经";
        
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


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
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
