//
//  XueViewController.m
//  Sutra
//
//  Created by Michael on 2017/6/15.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "XueViewController.h"

#import "JingDetailCtrl.h"

#import "XueTitleCell.h"

@interface XueViewController (){
    
    NSArray *_XueData;
    NSArray *_XueSections;
    
}

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
    return [_XueSections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_XueData[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _XueSections[section];
}

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
    
    NSDictionary *xueDic = _XueData[indexPath.section][indexPath.row];

    XueTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:xueIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"XueTitleCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell configureWith:xueDic[@"name"]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JingDetailCtrl *vc = [[JingDetailCtrl alloc] init];
    vc.detailItem = _XueData[indexPath.section][indexPath.row];
    
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
