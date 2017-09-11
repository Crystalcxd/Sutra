//
//  SLPUpShowView.m
//  Profession
//
//  Created by medica_mac on 16/5/19.
//  Copyright © 2016年 com.medica. All rights reserved.
//

#import "SLPUpShowView.h"

#define kMaxTransformScale (1.0)
#define kMinTransformScale (0.002)
#define kMaxAlpha (0.6)
#define kMinAlpha (0.0)

#define kAnimationDuration (0.3)

@implementation SLPUpShowView

- (void)dealloc{
    
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self.maskView setBackgroundColor:[UIColor blackColor]];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.maskView addGestureRecognizer:recognizer];
}

- (void)showInView:(UIView *)view animated:(BOOL)animated
{
    [view addSubview:self];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    UIView *selfView = self;
    NSDictionary *subViews = NSDictionaryOfVariableBindings(selfView);
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[selfView]|" options:0 metrics:nil views:subViews]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[selfView]|" options:0 metrics:nil views:subViews]];
    
    [self.contentView setTransform:CGAffineTransformMakeTranslation(0, CGRectGetHeight(self.contentView.frame))];
    [self.maskView setAlpha:0.0];
    
    __weak typeof (self) weakSelf = self;
    [UIView animateWithDuration:kAnimationDuration animations:^{
        [weakSelf.maskView setAlpha:kMaxAlpha];
        [weakSelf.contentView setTransform:CGAffineTransformMakeTranslation(0, 0)];
    } completion:^(BOOL finished) {
    }];
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    [self unshowAnimated:YES];
}

- (void)unshowAnimated:(BOOL)animated
{
    __weak typeof (self) weakSelf = self;
    [UIView animateWithDuration:kAnimationDuration animations:^{
        [weakSelf.maskView setAlpha:0.0];
        [weakSelf.contentView setTransform:CGAffineTransformMakeTranslation(0, CGRectGetHeight(weakSelf.contentView.frame))];
    }completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
