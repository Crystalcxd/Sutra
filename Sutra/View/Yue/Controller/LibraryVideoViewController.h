//
//  LibraryVideoViewController.h
//  Sutra
//
//  Created by medica_mac on 2017/9/1.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YueMedia.h"

typedef void(^SelectAction)(YueMedia *media);

@interface LibraryVideoViewController : UIViewController

@property (nonatomic , copy) SelectAction selectAction;

@end
