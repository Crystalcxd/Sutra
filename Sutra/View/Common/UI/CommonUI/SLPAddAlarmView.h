//
//  SLPAddAlarmView.h
//  Sleepace
//
//  Created by medica_mac on 2016/12/27.
//  Copyright © 2016年 com.medica. All rights reserved.
//

#import "SLPUpShowView.h"

typedef void(^SLPAddAlarmHandle)(NSString *);

@interface SLPAddAlarmView : SLPUpShowView

- (void)showInView:(UIView *)view deviceList:(NSArray *)deviceList addAlarmHandle:(SLPAddAlarmHandle)introduceHandle animated:(BOOL)animated;

@end
