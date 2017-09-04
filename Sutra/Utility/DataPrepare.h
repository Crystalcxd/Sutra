//
//  DataPrepare.h
//  Sutra
//
//  Created by medica_mac on 2017/9/4.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KeAlbum.h"
#import "Temple.h"

@interface DataPrepare : NSObject

+ (NSArray *)installJingData;

+ (NSArray *)installKeHomeSingleData;
+ (NSArray *)installKeHomeAlbumData;
+ (KeAlbum *)morningSong;
+ (KeAlbum *)eveningSong;

+ (NSArray *)installXueSectionData;
+ (NSArray *)installXueData;

+ (NSArray *)installTuData;

@end
