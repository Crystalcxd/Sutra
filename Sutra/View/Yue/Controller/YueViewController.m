//
//  YueViewController.m
//  Sutra
//
//  Created by medica_mac on 2017/6/16.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "YueViewController.h"
#import "DirectionMPMoviePlayerViewController.h"

#import "YueTitleCell.h"

#import "WMUserDefault.h"
#import "YueMedia.h"

#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>

@interface YueViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,MPMediaPickerControllerDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong)NSMutableArray *audioList;
@property (nonatomic , strong)NSMutableArray *videoList;

@property (nonatomic , weak) IBOutlet UITableView *tableView;

@property (nonatomic , strong)MPMusicPlayerController *myMusicPlayer;

@property (nonatomic , strong) MPMoviePlayerController *moviePlayer;//视频播放控制器

@end

@implementation YueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setUI];
    [self installData];
}

- (void)installData
{
    self.audioList = [NSMutableArray array];
    self.videoList = [NSMutableArray array];
    
    if ([WMUserDefault arrayForKey:@"audio"] != nil) {
        NSArray *array = [WMUserDefault arrayForKey:@"audio"];
        [self.audioList addObjectsFromArray:array];
    }
    
    if ([WMUserDefault arrayForKey:@"video"] != nil) {
        NSArray *array = [WMUserDefault arrayForKey:@"video"];
        [self.videoList addObjectsFromArray:array];
    }
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
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"音频文件",@"视频文件", nil];
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
        {
            MPMediaPickerController *picker = [[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeAny];
            picker.prompt = @"请选择您需要上传的歌曲";
            picker.showsCloudItems = YES;           //是否显示下载项
            picker.allowsPickingMultipleItems = NO; //是否多选
            picker.delegate = self;
            [self presentViewController:picker animated:YES completion:nil];
        }
            break;
        case 1:
        {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            picker.mediaTypes = @[(NSString *)kUTTypeMovie];
            
            picker.delegate = self;
            [self presentViewController:picker animated:YES completion:nil];

        }
            break;
        default:
            break;
    }
}

#pragma mark -MPMediaPickerControllerDelegate
- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection
{
    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
    
    NSArray *items = mediaItemCollection.items;
    MPMediaItem *item = [items firstObject];

    for (YueMedia *media in self.audioList) {
        if ([media.mediaDetail isEqual:item]) {
            return;
        }
    }
    
    YueMedia *media = [[YueMedia alloc] init];
    media.mediaType = YueMediaAudio;
    media.mediaName = item.title;
    media.assetUrl = [item valueForProperty:MPMediaItemPropertyAssetURL];
    media.mediaDetail = mediaItemCollection;
    MPMediaItemArtwork *artWork = [item valueForProperty:MPMediaItemPropertyArtwork];
    media.image = [artWork imageWithSize:CGSizeMake(180, 120)];
    
    [self.audioList addObject:media];
    
    [WMUserDefault setArray:self.audioList forKey:@"audio"];
    
    [self.tableView reloadData];
}

-(void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker
{
    NSLog(@"Media Picker was cancelled");
    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if([mediaType isEqualToString:@"public.movie"])
    {
        NSURL *videoURL = [info objectForKey:UIImagePickerControllerMediaURL];
        NSLog(@"found a video");
        
        AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:videoURL options:nil];
        
        NSArray *compatiblePresets = [AVAssetExportSession exportPresetsCompatibleWithAsset:avAsset];
        
        NSLog(@"%@",compatiblePresets);
        
        NSString * resultPath = @"";
        if ([compatiblePresets containsObject:AVAssetExportPresetHighestQuality]) {
            
            AVAssetExportSession *exportSession = [[AVAssetExportSession alloc] initWithAsset:avAsset presetName:AVAssetExportPresetMediumQuality];
            
            NSDateFormatter *formater = [[NSDateFormatter alloc] init];//用时间给文件全名，以免重复
            
            [formater setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
            
            NSString * documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
            
            resultPath = [documentPath stringByAppendingFormat:@"/output-%@.mp4", [formater stringFromDate:[NSDate date]]];
            
            NSLog(@"resultPath = %@",resultPath);
            
            exportSession.outputURL = [NSURL fileURLWithPath:resultPath];
            
            exportSession.outputFileType = AVFileTypeMPEG4;
            
            exportSession.shouldOptimizeForNetworkUse = YES;
            
            [exportSession exportAsynchronouslyWithCompletionHandler:^(void)
             
             {
                 
                 switch (exportSession.status) {
                         
                     case AVAssetExportSessionStatusUnknown:
                         
                         NSLog(@"AVAssetExportSessionStatusUnknown");
                         
                         break;
                         
                     case AVAssetExportSessionStatusWaiting:
                         
                         NSLog(@"AVAssetExportSessionStatusWaiting");
                         
                         break;
                         
                     case AVAssetExportSessionStatusExporting:
                         
                         NSLog(@"AVAssetExportSessionStatusExporting");
                         
                         break;
                         
                     case AVAssetExportSessionStatusCompleted:
                         
                         NSLog(@"AVAssetExportSessionStatusCompleted");
                         
                         break;
                         
                     case AVAssetExportSessionStatusFailed:
                         
                         NSLog(@"AVAssetExportSessionStatusFailed");
                         
                         break;
                         
                     case AVAssetExportSessionStatusCancelled:
                         
                         break;
                 }
                 
             }];
            
        }
//        NSData *webData = [NSData dataWithContentsOfURL:videoURL];
//
////        [webData writeToFile:[self findUniqueMoviePath] atomically:YES];
//
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *documentsPath = [paths objectAtIndex:0];
//
//        [webData writeToFile:[NSString stringWithFormat:@"%@/%@.jpg", documentsPath, @"video"] atomically:YES];
//
        
        //获取视频的thumbnail
        MPMoviePlayerController *player = [[MPMoviePlayerController alloc]initWithContentURL:videoURL];
        UIImage  *thumbnail = [player thumbnailImageAtTime:1.0 timeOption:MPMovieTimeOptionNearestKeyFrame];
        
        YueMedia *media = [[YueMedia alloc] init];
        media.mediaType = YueMediaVideo;
//        media.mediaName = item.title;
        media.assetUrl = videoURL;
//        media.mediaDetail = item;
        media.image = thumbnail;
        media.filePath = resultPath;
        
        [self.videoList addObject:media];
        
        [WMUserDefault setArray:self.videoList forKey:@"video"];
        
        [self.tableView reloadData];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch (section) {
        case YueMediaAudio:
            return self.audioList.count;
            break;
        case YueMediaVideo:
            return self.videoList.count;
            break;
            
        default:
            break;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case YueMediaAudio:
            if (self.audioList.count != 0) {
                return 30;
            }
            break;
        case YueMediaVideo:
            if (self.videoList.count != 0) {
                return 30;
            }
            break;
            
        default:
            break;
    }
    return 1;

}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case YueMediaAudio:
            if (self.audioList.count != 0) {
                return @"音频";
            }
            break;
        case YueMediaVideo:
            if (self.videoList.count != 0) {
                return @"视频";
            }
            break;
        default:
            break;
    }
    
    return @"";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *articlIdentifier = @"article";
    static NSString *yueIdentifier = @"yue";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:articlIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:articlIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    YueMedia *media = nil;
    
    switch (indexPath.section) {
        case YueMediaAudio:
        {
            if (indexPath.row >= self.audioList.count) {
                return cell;
            }
            
            media = self.audioList[indexPath.row];
        }
            break;
        case YueMediaVideo:
        {
            if (indexPath.row >= self.videoList.count) {
                return cell;
            }
            
            media = self.videoList[indexPath.row];
        }
            break;
        default:
            break;
    }
    
    if (media == nil) {
        return cell;
    }
    
    YueTitleCell *yueCell = (YueTitleCell *)[tableView dequeueReusableCellWithIdentifier:yueIdentifier];
    if (yueCell == nil) {
        yueCell = [[[NSBundle mainBundle] loadNibNamed:@"YueTitleCell" owner:self options:nil] lastObject];
        yueCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    yueCell.indexPath = indexPath;
    [yueCell configureWith:media];
    
    return yueCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
    
    switch (indexPath.section) {
            case YueMediaAudio:
        {
            YueMedia *media = self.audioList[indexPath.row];
            
            self.myMusicPlayer = nil;
            self.myMusicPlayer = [[MPMusicPlayerController alloc] init];
            [self.myMusicPlayer beginGeneratingPlaybackNotifications];
            
            [self.myMusicPlayer setQueueWithItemCollection:media.mediaDetail];
            
            [self.myMusicPlayer play];
        }
            break;
        case YueMediaVideo:
        {
            YueMedia *media = self.videoList[indexPath.row];
            
            NSURL *videoURL = [NSURL fileURLWithPath:media.filePath];
            
//            AVPlayer *player = [AVPlayer playerWithURL:videoURL];
            
//            AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
//
//            playerLayer.frame = self.view.bounds;
//
//            [self.view.layer addSublayer:playerLayer];
//
//            [player play];
            
            self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:media.filePath]];
            // 开始播放
            [self.moviePlayer prepareToPlay];
            // 位置
            [self.view addSubview:self.moviePlayer.view];
            // frame
            self.moviePlayer.view.frame = self.tableView.frame;
            // 自动播放
            self.moviePlayer.shouldAutoplay = YES;
            // 返回键、暂停键、进度条等样式
            self.moviePlayer.controlStyle = MPMovieControlStyleFullscreen;
            // 全屏
            self.moviePlayer.fullscreen = NO;
            // 适应屏幕大小，宽高比不变
            self.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
            
//            if (media.assetUrl) {
//                AVAsset *movieAsset = [AVURLAsset URLAssetWithURL:media.assetUrl options:nil];
//                AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:movieAsset];
//                AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
//                AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
//                playerLayer.frame = self.view.bounds;
//
//                playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
//                [self.view.layer addSublayer:playerLayer];
//                playerLayer.backgroundColor = [UIColor blueColor].CGColor;
//                [player play];
////                [[self moviePlayerWith:media.assetUrl] play];
////                [self playMovieAtURL:media.assetUrl];
//            }
        }
            break;
            
        default:
            break;
    }
//    JingDetailCtrl *vc = [[JingDetailCtrl alloc] init];
//    NSLog(@"didSelect Jing%@",_XueData[indexPath.section][indexPath.row]);
//    vc.detailItem = _XueData[indexPath.section][indexPath.row];
//    
//    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)playMovieAtURL:(NSURL*)theURL
{
    DirectionMPMoviePlayerViewController *playerView = [[DirectionMPMoviePlayerViewController alloc] initWithContentURL:theURL];
    playerView.view.frame = self.view.frame;//全屏播放（全屏播放不可缺）
    playerView.moviePlayer.scalingMode = MPMovieScalingModeAspectFill;//全屏播放（全屏播放不可缺）
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myMovieFinishedCallback:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:playerView];
    [playerView.moviePlayer play];
    [self presentMoviePlayerViewControllerAnimated:playerView];
}

// When the movie is done, release the controller.
-(void)myMovieFinishedCallback:(NSNotification*)aNotification
{
    DirectionMPMoviePlayerViewController* theMovie = [aNotification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:theMovie];
}

#pragma mark - 私有方法
/**
 *  取得本地文件路径
 *
 *  @return 文件路径
 */
-(NSURL *)getFileUrl{
    NSString *urlStr=[[NSBundle mainBundle] pathForResource:@"The New Look of OS X Yosemite.mp4" ofType:nil];
    NSURL *url=[NSURL fileURLWithPath:urlStr];
    return url;
}

/**
 *  取得网络文件路径
 *
 *  @return 文件路径
 */
-(NSURL *)getNetworkUrl{
    NSString *urlStr=@"http://192.168.1.161/The New Look of OS X Yosemite.mp4";
    urlStr=[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL URLWithString:urlStr];
    return url;
}

/**
 *  创建媒体播放控制器
 *
 *  @return 媒体播放控制器
 */
-(MPMoviePlayerController *)moviePlayerWith:(NSURL *)url{
    if (!_moviePlayer) {
        _moviePlayer=[[MPMoviePlayerController alloc]initWithContentURL:url];
        _moviePlayer.view.frame=self.view.bounds;
        _moviePlayer.view.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:_moviePlayer.view];
    }
    return _moviePlayer;
}

/**
 *  添加通知监控媒体播放控制器状态
 */
-(void)addNotification{
    NSNotificationCenter *notificationCenter=[NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(mediaPlayerPlaybackStateChange:) name:MPMoviePlayerPlaybackStateDidChangeNotification object:self.moviePlayer];
    [notificationCenter addObserver:self selector:@selector(mediaPlayerPlaybackFinished:) name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
    
}

/**
 *  播放状态改变，注意播放完成时的状态是暂停
 *
 *  @param notification 通知对象
 */
-(void)mediaPlayerPlaybackStateChange:(NSNotification *)notification{
    switch (self.moviePlayer.playbackState) {
        case MPMoviePlaybackStatePlaying:
            NSLog(@"正在播放...");
            break;
        case MPMoviePlaybackStatePaused:
            NSLog(@"暂停播放.");
            break;
        case MPMoviePlaybackStateStopped:
            NSLog(@"停止播放.");
            break;
        default:
            NSLog(@"播放状态:%li",self.moviePlayer.playbackState);
            break;
    }
}

/**
 *  播放完成
 *
 *  @param notification 通知对象
 */
-(void)mediaPlayerPlaybackFinished:(NSNotification *)notification{
    NSLog(@"播放完成.%li",self.moviePlayer.playbackState);
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
