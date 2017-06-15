//
//  JingDetailCtrl.m
//  Sutra
//
//  Created by medica_mac on 2017/6/14.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "JingDetailCtrl.h"

#import <RNCryptor.h>

@interface JingDetailCtrl ()

- (void)configureView;

@end

@implementation JingDetailCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"ViewLoad configview %@",self.detailItem);
    [self configureView];
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
        
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    NSLog(@"configureView%@",self.detailItem);
    if (self.detailItem) {
        NSString *resourcePath = [ [NSBundle mainBundle] resourcePath];
        NSString *jingName = self.detailItem[@"url"];
        NSString *filePath = [resourcePath stringByAppendingPathComponent:jingName];//@"阿弥陀经.htm"
        NSString *htmlstring=[[NSString alloc] initWithContentsOfFile:filePath  encoding:NSUTF8StringEncoding error:nil];
        [_webView loadHTMLString:htmlstring  baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
        self.navigationItem.title = self.detailItem[@"name"];//@"阿弥陀经";
        
        
        
    }
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
