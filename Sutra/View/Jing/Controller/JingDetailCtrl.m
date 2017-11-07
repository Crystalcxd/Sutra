//
//  JingDetailCtrl.m
//  Sutra
//
//  Created by medica_mac on 2017/6/14.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "JingDetailCtrl.h"

#import "AppDelegate.h"

#import "AudioTask.h"

#import <MBProgressHUD/MBProgressHUD.h>
#import <RNCryptor_objc/RNDecryptor.h>

#import <RDVTabBarController/RDVTabBarController.h>
#import <RDVTabBarController/RDVTabBarItem.h>
#import <RDVTabBarController/RDVTabBar.h>

@interface JingDetailCtrl ()<UIWebViewDelegate>
{
    AVAudioPlayer *_avAudioPlayer; // 播放器palyer
}

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
    
    [[AudioTask shareAudioTask] stopTaskWithType:backgroundTask];
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
        
        //音频文件路径
        NSString *musicPath = [[NSBundle mainBundle] pathForResource:htmlFileName ofType:@"sutramusic"];
        if (musicPath!=NULL) {
            //1.音频文件的url路径
            NSString *urlStr=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
            urlStr=[urlStr stringByAppendingPathComponent:musicPath];
            
            [self audioPlayWithPath:[[NSURL alloc] initFileURLWithPath:urlStr]];
        }
        
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
                        [MBProgressHUD hideHUDForView:self.view animated:YES];
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

-(void)audioPlayWithPath:(NSURL *)url
{
    [[AudioTask shareAudioTask] setUrl:url];
    [[AudioTask shareAudioTask] startTaskWithTyep:backgroundTask];
    
    //    //设置锁屏仍能继续播放
    //    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback withOptions:AVAudioSessionCategoryOptionMixWithOthers error:nil];
    //    [[AVAudioSession sharedInstance] setActive: YES error: nil];
    //
    //    player=[[AVAudioPlayer alloc] initWithContentsOfURL:url error:Nil];
    //    player.numberOfLoops = -1;
    //    [player prepareToPlay];
    //    [player play];
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
