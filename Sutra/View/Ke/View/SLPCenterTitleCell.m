//
//  SLPCenterTitleCell.m
//  Sleepace
//
//  Created by medica_mac on 2016/12/28.
//  Copyright © 2016年 com.medica. All rights reserved.
//

#import "SLPCenterTitleCell.h"

@interface SLPCenterTitleCell ()

@property (weak , nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation SLPCenterTitleCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setBackgroundColor:[UIColor clearColor]];
}

- (void)configureWith:(NSString *)title
{
    self.titleLabel.text = title;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
