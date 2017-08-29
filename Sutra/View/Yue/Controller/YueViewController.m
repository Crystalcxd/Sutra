//
//  YueViewController.m
//  Sutra
//
//  Created by medica_mac on 2017/6/16.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "YueViewController.h"

#import "YueTitleCell.h"

#import "YueMedia.h"

#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface YueViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,MPMediaPickerControllerDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong)NSMutableArray *audioList;
@property (nonatomic , strong)NSMutableArray *videoList;

@property (nonatomic , weak) IBOutlet UITableView *tableView;

@property (nonatomic , strong)MPMusicPlayerController *myMusicPlayer;

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
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"audio"] != nil) {
        NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"audio"];
        [self.audioList addObjectsFromArray:array];
    }
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"video"] != nil) {
        NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"video"];
        [self.audioList addObjectsFromArray:array];
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
            MPMediaPickerController *picker = [[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeMovie];
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
    media.mediaDetail = item;
    
    [self.audioList addObject:media];
    
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
    
    [yueCell configureWith:media.mediaName];
    
    return yueCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
