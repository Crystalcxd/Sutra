//
//  XueViewController.m
//  Sutra
//
//  Created by Michael on 2017/6/15.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "XueViewController.h"

#import "XueTitleCell.h"

@interface XueViewController (){
    
    NSArray *_XueData;
    NSArray *_XueSections;
    
}

@end

@implementation XueViewController

- (void)createXueData{
    
    NSArray *lishi;
    NSArray *jiaoyi;
    
    _XueSections=@[@"发展历史",@"仪轨教义"];
    
    lishi  = @[@"创立过程",@"佛传东土",@"佛教宗派",@"世界分布"];
    jiaoyi  = @[@"教义简介",@"清规节律"];
    _XueData = @[lishi,jiaoyi];
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
    /*    if (section == 0){
     return 4;
     }else {
     return 2;}*/
    return [_XueData[section] count];
    
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
    
    NSString *xueTitle = _XueData[indexPath.section][indexPath.row];
    
    XueTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:xueIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"XueTitleCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell configureWith:xueTitle];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
    
//    JingDetailCtrl *vc = [[JingDetailCtrl alloc] init];
//    NSLog(@"didSelect Jing%@",_Jing[indexPath.row]);
//    vc.detailItem = _Jing[indexPath.row];
//    
//    [self.navigationController pushViewController:vc animated:YES];
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