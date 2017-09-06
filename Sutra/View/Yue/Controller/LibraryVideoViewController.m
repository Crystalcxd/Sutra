//
//  LibraryVideoViewController.m
//  Sutra
//
//  Created by medica_mac on 2017/9/1.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "LibraryVideoViewController.h"

#import "YueTitleCell.h"

#import "AppDelegate.h"

#import <RDVTabBarController/RDVTabBarController.h>
#import <RDVTabBarController/RDVTabBarItem.h>
#import <RDVTabBarController/RDVTabBar.h>

#import <AssetsLibrary/AssetsLibrary.h>

@interface LibraryVideoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) NSMutableArray *libraryVideoList;

@property (nonatomic , weak) IBOutlet UITableView *tableView;

@end

@implementation LibraryVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setUI];
    [self installData];
}

- (void)installData {
    self.libraryVideoList = [NSMutableArray array];
    
    ALAssetsLibrary *library1 = [[ALAssetsLibrary alloc] init];
    
    [library1 enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group) {
            [group setAssetsFilter:[ALAssetsFilter allVideos]];
            [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                
                if (result) {
                    YueMedia *videoInfo = [[YueMedia alloc] init];
                    videoInfo.image = [UIImage imageWithCGImage:result.thumbnail];
                    //                    videoInfo.videoURL = [result valueForProperty:ALAssetPropertyAssetURL];
                    videoInfo.assetUrl = result.defaultRepresentation.url;
//                    videoInfo.duration = [result valueForProperty:ALAssetPropertyDuration];
                    videoInfo.mediaName = [self getFormatedDateStringOfDate:[result valueForProperty:ALAssetPropertyDate]];
//                    videoInfo.size = result.defaultRepresentation.size; //Bytes
//                    videoInfo.format = [result.defaultRepresentation.filename pathExtension];
                    [self.libraryVideoList addObject:videoInfo];
                }
            }];
        } else {
            //没有更多的group时，即可认为已经加载完成。
            NSLog(@"after load, the total alumvideo count is %ld",self.libraryVideoList.count);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    } failureBlock:^(NSError *error) {
        NSLog(@"Failed.");
    }];
}

//将创建日期作为文件名
-(NSString*)getFormatedDateStringOfDate:(NSDate*)date{
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"]; //注意时间的格式：MM表示月份，mm表示分钟，HH用24小时制，小hh是12小时制。
    NSString* dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

- (void)setUI {
    self.navigationItem.title = @"选择视频";//@"阿弥陀经";
    
    self.view.backgroundColor = [UIColor whiteColor];
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
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.libraryVideoList.count;
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
    
    if (indexPath.row >= self.libraryVideoList.count) {
        return cell;
    }
    
    media = self.libraryVideoList[indexPath.row];
    
    YueTitleCell *yueCell = (YueTitleCell *)[tableView dequeueReusableCellWithIdentifier:yueIdentifier];
    if (yueCell == nil) {
        yueCell = [[[NSBundle mainBundle] loadNibNamed:@"YueTitleCell" owner:self options:nil] lastObject];
        yueCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    yueCell.indexPath = indexPath;
    [yueCell configureWith:media selectIndex:nil];
    
    return yueCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
    
    if (self.libraryVideoList.count <= indexPath.row) {
        return;
    }
    
    self.selectAction(self.libraryVideoList[indexPath.row]);
    
    [self.navigationController popViewControllerAnimated:YES];
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
