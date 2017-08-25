//
//  SLPUpShowView.h
//  Profession
//
//  Created by medica_mac on 16/5/19.
//  Copyright © 2016年 com.medica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLPUpShowView : UIView

@property (nonatomic,weak) IBOutlet UIView *maskView;
@property (nonatomic,weak) IBOutlet UIView *contentView;

- (void)showInView:(UIView *)view animated:(BOOL)animated;
- (void)unshowAnimated:(BOOL)animated;

@end
