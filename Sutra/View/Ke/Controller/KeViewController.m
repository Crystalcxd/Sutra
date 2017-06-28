//
//  KeViewController.m
//  Sutra
//
//  Created by medica_mac on 2017/6/28.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "KeViewController.h"

@interface KeViewController (){
    NSMutableArray *_Ke;
    NSMutableArray *_KeAlbum;
}

@end

@implementation KeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self creatKeData];
}

- (void)creatKeData {
    _Ke=  [[NSMutableArray alloc] init];

    [_Ke addObject:@{@"name":@"宝鼎赞",     @"url":@"宝鼎赞.sutra"}];
    [_Ke addObject:@{@"name":@"楞严咒",     @"url":@"楞严咒.sutra"}];
    [_Ke addObject:@{@"name":@"大悲咒",       @"url":@"大悲咒.sutra"}];
    [_Ke addObject:@{@"name":@"十小咒",       @"url":@"十小咒.sutra"}];
    [_Ke addObject:@{@"name":@"心经",        @"url":@"课心经.sutra"}];
    [_Ke addObject:@{@"name":@"回向偈",       @"url":@"回向偈.sutra"}];
    [_Ke addObject:@{@"name":@"赞佛偈",       @"url":@"赞佛偈.sutra"}];
    [_Ke addObject:@{@"name":@"念圣号",       @"url":@"念圣号.sutra"}];
    [_Ke addObject:@{@"name":@"发愿文",       @"url":@"发愿文普贤十大愿王.sutra"}];
    [_Ke addObject:@{@"name":@"净土文",       @"url":@"发愿文慈云净土.sutra"}];
    [_Ke addObject:@{@"name":@"三皈依",       @"url":@"三皈依.sutra"}];
    [_Ke addObject:@{@"name":@"祝韦天",       @"url":@"韦天赞.sutra"}];
    [_Ke addObject:@{@"name":@"赞观音文",       @"url":@"赞观音文.sutra"}];
    [_Ke addObject:@{@"name":@"香赞",        @"url":@"香赞.sutra"}];
    [_Ke addObject:@{@"name":@"阿弥陀经",       @"url":@"课阿弥陀经.sutra"}];
    [_Ke addObject:@{@"name":@"大忏悔文",     @"url":@"礼佛大忏悔文.sutra"}];
    [_Ke addObject:@{@"name":@"蒙山施食",   @"url":@"蒙山施食.sutra"}];
    [_Ke addObject:@{@"name":@"往生咒",         @"url":@"往生咒.sutra"}];
    [_Ke addObject:@{@"name":@"观闻圣号",       @"url":@"观闻圣号.sutra"}];
    [_Ke addObject:@{@"name":@"净土文",       @"url":@"发愿文慈云净土.sutra"}];
    [_Ke addObject:@{@"name":@"伽蓝赞",       @"url":@"伽蓝赞.sutra"}];
    
    
    _KeAlbum= [[NSMutableArray alloc] init];
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
