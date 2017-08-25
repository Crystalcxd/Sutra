//
//  SLPJumpAlbumView.m
//  Sleepace
//
//  Created by medica_mac on 2016/12/27.
//  Copyright © 2016年 com.medica. All rights reserved.
//

#import "SLPJumpAlbumView.h"

#import "SLPCenterTitleCell.h"


@interface SLPJumpAlbumView ()<UITableViewDelegate,UITableViewDataSource>
{
    SLPJumpAlbumHandle _jumpAlbumHandle;
}

@property (nonatomic , strong) NSArray *albumList;

@end

@implementation SLPJumpAlbumView

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)showInView:(UIView *)view albumList:(NSArray *)albumList jumpAlbumHandle:(SLPJumpAlbumHandle)introduceHandle animated:(BOOL)animated
{
    self.albumList = albumList;
    
    _jumpAlbumHandle = introduceHandle;
    
    [self showInView:view animated:animated];
    
    NSArray *constrains3 = self.contentView.constraints;
    for (NSLayoutConstraint* constraint in constrains3) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            constraint.constant = 60 * self.albumList.count;
        }
    }
}

#pragma mark - TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.albumList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *typeCellIdentifier = @"SLPCenterTitleCell";
    
    SLPCenterTitleCell *cell = (SLPCenterTitleCell *)[tableView dequeueReusableCellWithIdentifier:typeCellIdentifier];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"SLPCenterTitleCell" bundle:nil] forCellReuseIdentifier:typeCellIdentifier];
        cell = (SLPCenterTitleCell *)[tableView dequeueReusableCellWithIdentifier:typeCellIdentifier];
    }
    
    if (self.albumList.count <= indexPath.row) {
        return cell;
    }
    
    KeAlbum *album = self.albumList[indexPath.row];
    [cell configureWith:[NSString stringWithFormat:@"%@下一篇",album.albumName]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (self.albumList.count <= indexPath.row) {
        return;
    }
    
    _jumpAlbumHandle(self.albumList[indexPath.row]);
    
    [self unshowAnimated:YES];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
