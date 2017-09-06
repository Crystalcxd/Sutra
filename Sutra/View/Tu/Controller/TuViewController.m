//
//  TuViewController.m
//  Sutra
//
//  Created by medica_mac on 2017/6/16.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "TuViewController.h"
#import "JingDetailCtrl.h"

#import "CustomAnnotationView.h"


#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface TuViewController ()<BMKMapViewDelegate,MAMapViewDelegate>{
    NSArray *_TuData;
}

//@property (nonatomic , strong) BMKMapView *mapView;
@property (nonatomic , strong) MAMapView *maMapView;
@property (nonatomic , weak) IBOutlet UIView *contentView;

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
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    
    ///初始化地图
    _maMapView = [[MAMapView alloc] initWithFrame:self.contentView.bounds];
    _maMapView.delegate = self;
    
    ///把地图添加至view
    [self.contentView addSubview:_maMapView];
    
    ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
    _maMapView.showsUserLocation = YES;
    _maMapView.userTrackingMode = MAUserTrackingModeFollow;
    
    [self addPointAnnotation];
}

- (void)addPointAnnotation {
    for (NSDictionary *dict in _TuData) {
        NSString *location = dict[@"location"];
        NSArray *array = [location componentsSeparatedByString:@","];
        double latitude = [[array lastObject] doubleValue];
        double longitude = [[array firstObject] doubleValue];
        
        NSString *name = dict[@"name"];
        
        MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
        pointAnnotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        pointAnnotation.title = name;
        pointAnnotation.subtitle = dict[@"url"];
        
        [_maMapView addAnnotation:pointAnnotation];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)createTuData {
    _TuData = [DataPrepare installTuData];
}

- (void)tapAnnotationview:(UITapGestureRecognizer *)sender {
    CustomAnnotationView *annotationView = (CustomAnnotationView *)sender.view;
    
    JingDetailCtrl *vc = [[JingDetailCtrl alloc] init];
    vc.detailItem = annotationView.detailItem;
    
    [self.navigationController pushViewController:vc animated:YES];

    NSLog(@"%@",sender);
}

#pragma mark -MAMapViewDelegate
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        CustomAnnotationView *annotationView = (CustomAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[CustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier];
        }
        annotationView.image = [UIImage imageNamed:@"temple"];
        annotationView.detailItem = @{@"name":annotation.title,@"url":annotation.subtitle};
        
        // 设置为NO，用以调用自定义的calloutView
        annotationView.canShowCallout = NO;
        
        // 设置中心点偏移，使得标注底部中间点成为经纬度对应点
        annotationView.centerOffset = CGPointMake(0, -18);
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAnnotationview:)];
        [annotationView addGestureRecognizer:tap];

        return annotationView;
    }
    return nil;
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
