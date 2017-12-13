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

#import "AppDelegate.h"

#import "AudioTask.h"

#import <MBProgressHUD/MBProgressHUD.h>
#import <RNCryptor_objc/RNDecryptor.h>

#import <RDVTabBarController/RDVTabBarController.h>
#import <RDVTabBarController/RDVTabBarItem.h>
#import <RDVTabBarController/RDVTabBar.h>

@interface KeAlbumDetailCtrl ()<UIWebViewDelegate>{
    KeAlbum *morningSong;
    KeAlbum *eveningSong;
    AVAudioPlayer *_avAudioPlayer; // 播放器palyer
}

@end

@implementation KeAlbumDetailCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self creatKeAlbumData];
    
    [self setUI];
    [self configureView];
    [self configureJumpBtn];
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
    
    [self stopMusic];
}

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}

- (void)setUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _webView.backgroundColor = [UIColor whiteColor];
    _webView.scrollView.pagingEnabled = YES;
    _webView.delegate = self;
}

- (void)creatKeAlbumData {
    morningSong = [DataPrepare morningSong];
    eveningSong = [DataPrepare eveningSong];
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
                
                __weak typeof(self) weakSelf = self;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSError *error;
                    NSData *decryptedData = [RNDecryptor decryptData:encryptedData
                                                        withPassword:@"boahankook0713"
                                                               error:&error];
                    if (!error) {
                        [_webView loadData:decryptedData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
                        [weakSelf playMusicWIthName:htmlFileName];
                    }else{
                        [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
                    }
                });
            }
        }
    }
}

-(void)playMusicWIthName:(NSString *)htmlFileName
{
    //音频文件路径
    NSString *musicPath = [[NSBundle mainBundle] pathForResource:htmlFileName ofType:@"mp3"];
    if (musicPath!=NULL) {
        // 2.播放本地音频文件
        // (1)从boudle路径下读取音频文件 陈小春 - 独家记忆文件名，mp3文件格式
        NSString *path = [[NSBundle mainBundle] pathForResource:htmlFileName ofType:@"mp3"];
        // (2)把音频文件转化成url格式
        NSURL *url = [NSURL fileURLWithPath:path];
        // (3)初始化音频类 并且添加播放文件
        _avAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        // (4) 设置代理
        //            _avAudioPlayer.delegate = self;
        // (5) 设置初始音量大小 默认1，取值范围 0~1
        _avAudioPlayer.volume = 0.5;
        // (6)设置音乐播放次数 负数为一直循环，直到stop，0为一次，1为2次，以此类推
        _avAudioPlayer.numberOfLoops = -1;
        // (5)准备播放
        [_avAudioPlayer prepareToPlay];
        
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
        
        [_avAudioPlayer play];
    }
}

- (void)stopMusic
{
    [_avAudioPlayer stop];
    _avAudioPlayer = nil;
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
        
        [self stopMusic];
        [self updateViewWith:album];
    }else{
        SLPJumpAlbumView *jumpAlbumView = [[[NSBundle mainBundle] loadNibNamed:@"SLPJumpAlbumView" owner:self options:nil] firstObject];
        
        // 助眠设备多余一个的时候弹出底部视图
        __weak typeof(self) weakSelf = self;
        [jumpAlbumView showInView:self.view albumList:array jumpAlbumHandle:^(KeAlbum *album) {
            [weakSelf stopMusic];
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
