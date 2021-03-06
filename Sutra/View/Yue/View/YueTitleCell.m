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
@property (nonatomic , weak) IBOutlet UILabel *playStatusLabel;
@property (nonatomic , weak) IBOutlet UIImageView *arrowImageView;
@property (nonatomic , weak) IBOutlet UIImageView *videoImageView;

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

- (void)configureWith:(YueMedia *)media selectIndex:(NSIndexPath *)indexPath{
    self.playStatusLabel.text = @"";
    if (indexPath) {
        if (indexPath.section == self.indexPath.section && indexPath.row == self.indexPath.row) {
            self.playStatusLabel.text = @"播放中";
        }
    }
    
    switch (media.mediaType) {
        case YueMediaAudio:
            [self.videoImageView setImage:media.image];
            [self.titleLabel setText:media.mediaName];
            break;
        case YueMediaVideo:
            [self.videoImageView setImage:media.image];
            [self.titleLabel setText:[NSString stringWithFormat:@"视频%ld",(long)self.indexPath.row + 1]];
            break;
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
