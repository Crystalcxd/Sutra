//
//  KeAlbumDetailCtrl.h
//  Sutra
//
//  Created by medica_mac on 2017/8/25.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeAlbumDetailCtrl : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;

@end
