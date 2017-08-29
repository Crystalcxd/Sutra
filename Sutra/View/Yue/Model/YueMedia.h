//
//  YueMedia.h
//  Sutra
//
//  Created by medica_mac on 2017/8/29.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    YueMediaAudio,
    YueMediaVideo,
} YueMediaType;

@interface YueMedia : NSObject

@property (nonatomic , assign) YueMediaType mediaType;

@property (nonatomic , strong) NSString *mediaName;

@property (nonatomic , strong) NSString *filePath;

@property (nonatomic , strong) NSURL *assetUrl;

@property (nonatomic , strong) NSString *imageUrl;

@property (nonatomic , strong) id mediaDetail;

@end
