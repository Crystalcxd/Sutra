//
//  KeAlbum.m
//  Sutra
//
//  Created by medica_mac on 2017/6/28.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "KeAlbum.h"

@implementation KeAlbum

- (id)init
{
    if (self = [super init]) {
        self.sutraList = [NSMutableArray array];
    }
    
    return self;
}

- (id)initWithName:(NSString *)name array:(NSMutableArray *)array
{
    if (self = [super init]) {
        self.sutraList = [NSMutableArray arrayWithArray:array];
        self.albumName = name;
    }
    
    return self;
}

@end
