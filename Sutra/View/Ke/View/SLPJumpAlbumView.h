//
//  SLPJumpAlbumView.h
//  Sleepace
//
//  Created by medica_mac on 2016/12/27.
//  Copyright © 2016年 com.medica. All rights reserved.
//

#import "SLPUpShowView.h"

#import "KeAlbum.h"

typedef void(^SLPJumpAlbumHandle)(KeAlbum *album);

@interface SLPJumpAlbumView : SLPUpShowView

- (void)showInView:(UIView *)view albumList:(NSArray *)albumList jumpAlbumHandle:(SLPJumpAlbumHandle)introduceHandle animated:(BOOL)animated;

@end
