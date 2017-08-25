//
//  KeAlbumDetailCtrl.m
//  Sutra
//
//  Created by medica_mac on 2017/8/25.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "KeAlbumDetailCtrl.h"

#import "SLPJumpAlbumView.h"

#import "KeAlbum.h"

#import <MBProgressHUD/MBProgressHUD.h>

#import <RNCryptor_objc/RNDecryptor.h>

@interface KeAlbumDetailCtrl ()<UIWebViewDelegate>{
    KeAlbum *morningSong;
    KeAlbum *eveningSong;
}

@end

@implementation KeAlbumDetailCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"ViewLoad configview %@",self.detailItem);
    [self creatKeAlbumData];
    
    [self setUI];
    [self configureView];
    [self configureJumpBtn];
}

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        NSLog(@"set Detail configview %@",self.detailItem);
    }
}

- (void)setUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _webView.backgroundColor = [UIColor whiteColor];
    _webView.scrollView.pagingEnabled = YES;
    _webView.delegate = self;
}

- (void)creatKeAlbumData {
    NSMutableArray *albumSutraList=  [[NSMutableArray alloc] init];
    
    [albumSutraList addObject:@{@"name":@"香赞",@"url":@"b01xz.sutra"}];
    [albumSutraList addObject:@{@"name":@"宝鼎赞",@"url":@"b02bdz.sutra"}];
    [albumSutraList addObject:@{@"name":@"楞严咒",@"url":@"b03lyz.sutra"}];
    [albumSutraList addObject:@{@"name":@"大悲咒",@"url":@"b04dbz.sutra"}];
    [albumSutraList addObject:@{@"name":@"十小咒",@"url":@"b05sxz.sutra"}];
    [albumSutraList addObject:@{@"name":@"心经",@"url":@"b06xj.sutra"}];
    [albumSutraList addObject:@{@"name":@"回向偈",@"url":@"b07hxj.sutra"}];
    [albumSutraList addObject:@{@"name":@"赞佛偈",@"url":@"b08zfj.sutra"}];
    [albumSutraList addObject:@{@"name":@"念圣号",@"url":@"b09nsh.sutra"}];
    [albumSutraList addObject:@{@"name":@"发愿文普贤十大愿王",@"url":@"b10fyws.sutra"}];
    [albumSutraList addObject:@{@"name":@"三皈依",@"url":@"b11sgy.sutra"}];
    [albumSutraList addObject:@{@"name":@"韦天赞",@"url":@"b21wtz.sutra"}];
    [albumSutraList addObject:@{@"name":@"赞观音文",@"url":@"b12zgyw.sutra"}];
    
    morningSong = [[KeAlbum alloc] initWithName:@"早课" array:albumSutraList];
    
    [albumSutraList removeAllObjects];
    [albumSutraList addObject:@{@"name":@"阿弥陀经",@"url":@"b13amtj.sutra"}];
    [albumSutraList addObject:@{@"name":@"礼佛大忏悔文",@"url":@"b14dchw.sutra"}];
    [albumSutraList addObject:@{@"name":@"蒙山施食",@"url":@"b15msss.sutra"}];
    [albumSutraList addObject:@{@"name":@"心经",@"url":@"b06xj.sutra"}];
    [albumSutraList addObject:@{@"name":@"往生咒",@"url":@"b16wsz.sutra"}];
    [albumSutraList addObject:@{@"name":@"赞佛偈",@"url":@"b08zfj.sutra"}];
    [albumSutraList addObject:@{@"name":@"发愿文慈云净土",@"url":@"b18fywj.sutra"}];
    [albumSutraList addObject:@{@"name":@"三皈依",@"url":@"b11sgy.sutra"}];
    [albumSutraList addObject:@{@"name":@"大悲咒",@"url":@"b04dbz.sutra"}];
    [albumSutraList addObject:@{@"name":@"伽蓝赞",@"url":@"b19qlz.sutra"}];
    
    eveningSong = [[KeAlbum alloc] initWithName:@"晚课" array:albumSutraList];
}

- (BOOL)theLastOneWithDic:(NSDictionary *)dic
{
    BOOL x = NO;
    
    for (NSDictionary *dict in morningSong.sutraList) {
        if ([dic[@"name"] isEqualToString:dict[@"name"]]) {
            if (dict == [morningSong.sutraList lastObject]) {
                return YES;
            }
        }
    }
    
    for (NSDictionary *dict in eveningSong.sutraList) {
        if ([dic[@"name"] isEqualToString:dict[@"name"]]) {
            if (dict == [eveningSong.sutraList lastObject]) {
                return YES;
            }
        }
    }

    return x;
}

- (NSMutableArray *)currentAlbumWithDic:(NSDictionary *)dic
{
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSDictionary *dict in morningSong.sutraList) {
        if ([dic[@"name"] isEqualToString:dict[@"name"]]) {
            [array addObject:morningSong];
        }
    }
    
    for (NSDictionary *dict in eveningSong.sutraList) {
        if ([dic[@"name"] isEqualToString:dict[@"name"]]) {
            [array addObject:eveningSong];
        }
    }
    
    return array;
}

- (void)configureJumpBtn
{
    BOOL lastOne = [self theLastOneWithDic:self.detailItem];
    if (lastOne == YES) {
        self.jumpBtn.enabled = NO;
        [self.jumpBtn setTitle:@"已经是最后一篇了" forState:UIControlStateNormal];
    }else{
        self.jumpBtn.enabled = YES;
        [self.jumpBtn setTitle:@"下一篇" forState:UIControlStateNormal];
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

- (IBAction)jumpBtnTapped:(id)sender {
    NSArray *array = [self currentAlbumWithDic:self.detailItem];
    
    if (array.count == 1) {
        KeAlbum *album = [array firstObject];
        
        [self updateViewWith:album];
    }else{
        SLPJumpAlbumView *jumpAlbumView = [[[NSBundle mainBundle] loadNibNamed:@"SLPJumpAlbumView" owner:self options:nil] firstObject];
        
        // 助眠设备多余一个的时候弹出底部视图
        __weak typeof(self) weakSelf = self;
        [jumpAlbumView showInView:self.view albumList:array jumpAlbumHandle:^(KeAlbum *album) {
            [weakSelf updateViewWith:album];
        } animated:YES];
    }
}

- (void)updateViewWith:(KeAlbum *)album
{
    NSInteger index = [album.sutraList indexOfObject:self.detailItem];
    
    if (index + 1 < album.sutraList.count) {
        [self setDetailItem:album.sutraList[index + 1]];
        
        [self configureView];
        [self configureJumpBtn];
    }
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
