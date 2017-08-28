//
//  YueViewController.m
//  Sutra
//
//  Created by medica_mac on 2017/6/16.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "YueViewController.h"

#import <MediaPlayer/MediaPlayer.h>

@interface YueViewController ()

@end

@implementation YueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setUI];
}

- (void)setUI {
    self.navigationItem.title = @"佛乐于心";//@"阿弥陀经";
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setFrame:CGRectMake(0, 0, 44, 44)];
    [addBtn setImage:[UIImage imageNamed:@"device_btn_add_nor.png"] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addMediaAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addBtn];
}

- (void)addMediaAction:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
