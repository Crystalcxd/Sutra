//
//  TuViewController.m
//  Sutra
//
//  Created by medica_mac on 2017/6/16.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "TuViewController.h"

#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface TuViewController ()<BMKMapViewDelegate>{
    NSArray *_TuData;
}

@property (nonatomic , strong) BMKMapView *mapView;

@end

@implementation TuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"法像";//@"阿弥陀经";
    [self createTuData];
    [self setUI];
}

- (void)setUI {
//    self.mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 64, 320, 320)];
//    self.mapView.showsUserLocation = YES;
//    [self.view addSubview:self.mapView];
    
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    
    ///初始化地图
    MAMapView *_mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    
    ///把地图添加至view
    [self.view addSubview:_mapView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    self.mapView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
//    self.mapView.delegate = nil;
}

- (void)createTuData {
    _TuData = [DataPrepare installTuData];
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
