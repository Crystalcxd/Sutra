//
//  YueViewController.m
//  Sutra
//
//  Created by medica_mac on 2017/6/16.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "YueViewController.h"
#import "LibraryVideoViewController.h"

#import "YueTitleCell.h"

#import "Utility.h"
#import "WMUserDefault.h"
#import "YueMedia.h"

#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>

#define MOVIE_PLAYER_TAG 3000

@interface YueViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,MPMediaPickerControllerDelegate,UITableViewDelegate,UITableViewDataSource,AVAudioPlayerDelegate>

@property (nonatomic , strong)NSMutableArray *audioList;
@property (nonatomic , strong)NSMutableArray *videoList;

@property (nonatomic , weak) IBOutlet UITableView *tableView;

@property (nonatomic , strong)MPMusicPlayerController *myMusicPlayer;

@property (nonatomic , strong)MPMoviePlayerController *moviePlayer;//视频播放控制器

@property (nonatomic , strong)AVAudioPlayer *audioPlayer;

@property (nonatomic , strong)NSIndexPath *selectAudioIndexPath;

@property (nonatomic , assign)AudioPlayModel playModel;

@property (nonatomic , assign)MPMusicPlaybackState playState;

@property (nonatomic , weak) IBOutlet UIImageView *BG;

@end

@implementation YueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setUI];
    [self installData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self addObserver];
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)installData
{
    self.playState = MPMusicPlaybackStateStopped;
    
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
    
    if ([WMUserDefault intValueForKey:@"audioplaymodel"] != 0) {
        self.playModel = [WMUserDefault intValueForKey:@"audioplaymodel"];
    }
}

- (void)addObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playDidChangeNotification:) name:MPMoviePlayerPlaybackStateDidChangeNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playMovieFinishedCallback:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:nil];
    //MPMoviePlayerController fullscreen 模式下，点击左上角的done按钮，会调用exitFullScreen通知。
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(exitFullScreen:) name: MPMoviePlayerDidExitFullscreenNotification object:nil];
}

- (void)setUI {
    self.navigationItem.title = @"佛乐于心";//@"阿弥陀经";
    
    self.tableView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
    
    UIImage *image = nil;
    if (SCREENWIDTH == 320) {
        image = [UIImage imageNamed:@"Yue640.jpg"];
    }else if (SCREENWIDTH == 375) {
        image = [UIImage imageNamed:@"Yue750.jpg"];
    }else if (SCREENWIDTH == 414) {
        image = [UIImage imageNamed:@"Yue1242.jpg"];
    }
    
    if (image) {
        self.BG.image = image;
    }
    
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
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                LibraryVideoViewController *vc = [[LibraryVideoViewController alloc] initWithNibName:@"LibraryVideoViewController" bundle:nil];
                
                __weak typeof(self) weakSelf = self;
                
                vc.selectAction = ^(YueMedia *media) {
                    [weakSelf.videoList addObject:media];
                    [WMUserDefault setArray:weakSelf.videoList forKey:@"video"];
                };
                
                [self.navigationController pushViewController:vc animated:YES];
            });
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
                return 40;
            }
            break;
        case YueMediaVideo:
            if (self.videoList.count != 0) {
                return 40;
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 40)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 200, 40)];
    label.font = [UIFont systemFontOfSize:14];
    
    switch (section) {
        case YueMediaAudio:
            if (self.audioList.count == 0) {
                return nil;
            }
            if (self.playModel == AudioPlayModelSingle) {
                label.text = @"音频(单曲循环)";
            }else{
                label.text = @"音频(列表播放)";
            }
            
            break;
        case YueMediaVideo:
            if (self.videoList.count == 0) {
                return nil;
            }
            label.text = @"视频";
            break;

        default:
            break;
    }
    
    [view addSubview:label];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = view.bounds;
    [btn addTarget:self action:@selector(changeOrder) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    view.backgroundColor = [UIColor clearColor];
    
    return view;
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
    [yueCell configureWith:media selectIndex:self.selectAudioIndexPath];
    
    return yueCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
            case YueMediaAudio:
        {
            [self playAudioWithIndex:indexPath];
        }
            break;
        case YueMediaVideo:
        {
            YueMedia *media = self.videoList[indexPath.row];
            
            if (!_moviePlayer) {
                _moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:media.assetUrl];
            }else{
                [_moviePlayer setContentURL:media.assetUrl];
            }
            _moviePlayer.view.frame = CGRectMake(0, 64, 320, 200);
            _moviePlayer.backgroundView.backgroundColor = [UIColor clearColor];
            _moviePlayer.view.tag = MOVIE_PLAYER_TAG;
            [self.view addSubview:_moviePlayer.view];
            
            _moviePlayer.controlStyle = MPMovieControlStyleFullscreen;
            _moviePlayer.shouldAutoplay = YES;
            _moviePlayer.repeatMode = MPMovieRepeatModeOne;
            [_moviePlayer setFullscreen:YES animated:YES];
            _moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
            [_moviePlayer play];
        }
            break;
            
        default:
            break;
    }
}

- (void)playAudioWithIndex:(NSIndexPath *)indexPath
{
    if (self.selectAudioIndexPath == indexPath) {
        self.selectAudioIndexPath = nil;
        [self.tableView reloadData];
        [self.audioPlayer stop];
        return;
    }

    if (indexPath != nil) {
        self.selectAudioIndexPath = indexPath;
    }
    
    [self.tableView reloadData];
    
    NSInteger row = self.selectAudioIndexPath.row;
    YueMedia *media = self.audioList[row];
    
    NSError *error = nil;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:media.assetUrl error:&error];
    [self.audioPlayer setDelegate:self];
    if (error){
        NSLog(@"player create failed %@", error);
    }
    
    BOOL ret = [self.audioPlayer prepareToPlay];
    if (ret){
        ret = [self.audioPlayer play];
        if (!ret){
            NSLog(@"play failed");
        }
    }else{
        NSLog(@"prepare to play failed");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Action
- (void)changeOrder
{
    self.playModel = labs(self.playModel - AudioPlayModelList);
    [self.tableView reloadData];
    
    [WMUserDefault setIntValue:self.playModel forKey:@"audioplaymodel"];
}

#pragma mark - handle notification

- (void)playDidChangeNotification:(NSNotification *)notification {
    MPMoviePlayerController *moviePlayer = notification.object;
    MPMoviePlaybackState playState = moviePlayer.playbackState;
    if (playState == MPMoviePlaybackStateStopped) {
        NSLog(@"停止");
    } else if(playState == MPMoviePlaybackStatePlaying) {
        NSLog(@"播放");
    } else if(playState == MPMoviePlaybackStatePaused) {
        NSLog(@"暂停");
    }
}

- (void)playMovieFinishedCallback:(NSNotification *)notification{
    
    NSLog(@"finish");
}

- (void)exitFullScreen:(NSNotification *)notification{
    
    NSLog(@"exitFullScreen");
    [_moviePlayer stop];
    [_moviePlayer.view removeFromSuperview];
    
    for (UIView *view in self.view.subviews) {
        if (view.tag == MOVIE_PLAYER_TAG) {
            [view removeFromSuperview];
            break;
        }
    }
}

#pragma mark AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    if (self.playModel == AudioPlayModelSingle) {
        [self playAudioWithIndex:nil];
    }else{
        [self playAudioWithIndex:[self nextIndexPath]];
    }
}

#pragma mark - 私有方法

- (NSIndexPath *)nextIndexPath
{
    if (self.selectAudioIndexPath.row == self.audioList.count - 1) {
        return [NSIndexPath indexPathForRow:0 inSection:self.selectAudioIndexPath.section];
    }else{
        return [NSIndexPath indexPathForRow:self.selectAudioIndexPath.row + 1 inSection:self.selectAudioIndexPath.section];
    }
}

@end
