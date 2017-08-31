//
//  YueTitleCell.h
//  Sutra
//
//  Created by medica_mac on 2017/8/29.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YueMedia.h"

@interface YueTitleCell : UITableViewCell

@property (nonatomic , strong) NSIndexPath *indexPath;

- (void)configureWith:(YueMedia *)media;

@end
