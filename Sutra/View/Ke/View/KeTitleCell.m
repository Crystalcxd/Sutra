//
//  KeTitleCell.m
//  Sutra
//
//  Created by medica_mac on 2017/6/28.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "KeTitleCell.h"

@interface KeTitleCell ()

@property (nonatomic , weak) IBOutlet UILabel *line;
@property (nonatomic , weak) IBOutlet UILabel *titleLabel;
@property (nonatomic , weak) IBOutlet UIImageView *arrowImageView;

@end

@implementation KeTitleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setBackgroundColor:[UIColor clearColor]];

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
