//
//  KeViewController.m
//  Sutra
//
//  Created by medica_mac on 2017/6/28.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "KeViewController.h"

#import "KeAlbum.h"

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
    [_Ke addObject:@{@"name":@"香赞",@"url":@"b01xz.sutra"}];
    [_Ke addObject:@{@"name":@"宝鼎赞",@"url":@"b02bdz.sutra"}];
    [_Ke addObject:@{@"name":@"楞严咒",@"url":@"b03lyz.sutra"}];
    [_Ke addObject:@{@"name":@"大悲咒",@"url":@"b04dbz.sutra"}];
    [_Ke addObject:@{@"name":@"十小咒",@"url":@"b05sxz.sutra"}];
    [_Ke addObject:@{@"name":@"心经",@"url":@"b06xj.sutra"}];
    [_Ke addObject:@{@"name":@"回向偈",@"url":@"b07hxj.sutra"}];
    [_Ke addObject:@{@"name":@"赞佛偈",@"url":@"b08zfj.sutra"}];
    [_Ke addObject:@{@"name":@"念圣号",@"url":@"b09nsh.sutra"}];
    [_Ke addObject:@{@"name":@"发愿文普贤十大愿王",@"url":@"b10fyws.sutra"}];
    [_Ke addObject:@{@"name":@"三皈依",@"url":@"b11sgy.sutra"}];
    [_Ke addObject:@{@"name":@"赞观音文",@"url":@"b12zgyw.sutra"}];
    [_Ke addObject:@{@"name":@"阿弥陀经",@"url":@"b13amtj.sutra"}];
    [_Ke addObject:@{@"name":@"礼佛大忏悔文",@"url":@"b14dchw.sutra"}];
    [_Ke addObject:@{@"name":@"蒙山施食",@"url":@"b15msss.sutra"}];
    [_Ke addObject:@{@"name":@"往生咒",@"url":@"b16wsz.sutra"}];
    [_Ke addObject:@{@"name":@"观闻圣号",@"url":@"b17gwsh.sutra"}];
    [_Ke addObject:@{@"name":@"发愿文慈云净土",@"url":@"b18fywj.sutra"}];
    [_Ke addObject:@{@"name":@"伽蓝赞",@"url":@"b19qlz.sutra"}];
    [_Ke addObject:@{@"name":@"普贤菩萨警众偈",@"url":@"b20jzj.sutra"}];
    [_Ke addObject:@{@"name":@"韦天赞",@"url":@"b21wtz.sutra"}];

    
    _KeAlbum= [[NSMutableArray alloc] init];
    
    NSMutableArray *morningSongList = [NSMutableArray arrayWithObjects:
                                       @"", nil];
    
    
    KeAlbum *morningSong ;
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
