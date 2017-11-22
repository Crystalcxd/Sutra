//
//  XueViewController.m
//  Sutra
//
//  Created by Michael on 2017/6/15.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "XueViewController.h"

#import "XueChapterDetailViewController.h"
#import "JingDetailCtrl.h"

#import "XueTitleCell.h"

@interface XueViewController (){
    
    NSArray *_XueData;
    NSArray *_XueSections;
    
}

@property (nonatomic , weak) IBOutlet UITableView *tableView;
@property (nonatomic , weak) IBOutlet UIImageView *BG;

@end

@implementation XueViewController

- (void)createXueData{
    _XueSections=[DataPrepare installXueSectionData];
    _XueData=[DataPrepare installXueData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"佛学知识";//@"阿弥陀经";

    self.tableView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
    
    UIImage *image = nil;
    if (SCREENWIDTH == 320) {
        image = [UIImage imageNamed:@"Xue640.jpg"];
    }else if (SCREENWIDTH == 375) {
        image = [UIImage imageNamed:@"Xue750.jpg"];
    }else if (SCREENWIDTH == 414) {
        image = [UIImage imageNamed:@"Xue1242.jpg"];
    }
    
    if (image) {
        self.BG.image = image;
    }
    
    [self createXueData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_XueSections count];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 40;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 0;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 40)];
//    view.backgroundColor = [UIColor lightTextColor];
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, SCREENWIDTH - 15, 40)];
//    label.font = [UIFont systemFontOfSize:14.0];
//    label.text = _XueSections[section];
//    [view addSubview:label];
//    
//    return view;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *articlIdentifier = @"article";
    static NSString *xueIdentifier = @"xue";
    
    if (indexPath.section >= [_XueData count] || indexPath.row >= [_XueData[indexPath.section] count]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:articlIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:articlIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
    
//    NSDictionary *xueDic = _XueData[indexPath.section][indexPath.row];

    XueTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:xueIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"XueTitleCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell configureWith:_XueSections[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XueChapterDetailViewController *vc = [[XueChapterDetailViewController alloc] initWithTitle:_XueSections[indexPath.row] Array:_XueData[indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
