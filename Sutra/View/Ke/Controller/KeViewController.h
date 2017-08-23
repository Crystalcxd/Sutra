//
//  KeViewController.h
//  Sutra
//
//  Created by medica_mac on 2017/6/28.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    KeSectionSingle,
    KeSectionAlbum,
} KeSectionType;

@interface KeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@end
