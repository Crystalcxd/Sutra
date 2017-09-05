//
//  CustomAnnotationView.h
//  Sutra
//
//  Created by medica_mac on 2017/9/5.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>

#import "CustomCalloutView.h"

@interface CustomAnnotationView : MAAnnotationView

@property (nonatomic, readonly) CustomCalloutView *calloutView;

@property (nonatomic , strong) NSDictionary *detailItem;

@end
