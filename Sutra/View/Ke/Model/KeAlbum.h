//
//  KeAlbum.h
//  Sutra
//
//  Created by medica_mac on 2017/6/28.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeAlbum : NSObject

@property (nonatomic , strong) NSString *albumName;
@property (nonatomic , strong) NSMutableArray *sutraList;

- (id)initWithName:(NSString *)name array:(NSMutableArray *)array;

@end
