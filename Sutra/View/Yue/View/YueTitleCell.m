//
//  YueTitleCell.m
//  Sutra
//
//  Created by medica_mac on 2017/8/29.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "YueTitleCell.h"

@interface YueTitleCell ()

@property (nonatomic , weak) IBOutlet UIView *line;
@property (nonatomic , weak) IBOutlet UILabel *titleLabel;
@property (nonatomic , weak) IBOutlet UIImageView *arrowImageView;

@end

@implementation YueTitleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self.line setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.05]];
    
    [self.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [self.titleLabel setTextColor:[UIColor blackColor]];
    
    self.arrowImageView.image = [UIImage imageNamed:@"common_list_icon_leftarrow"];
}

- (void)configureWith:(NSString *)titleStr {
    [self.titleLabel setText:titleStr];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
