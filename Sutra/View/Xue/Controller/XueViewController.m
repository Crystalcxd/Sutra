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
    
    NSArray *licheng;
    NSArray *fazhan;
    NSArray *paibie;
    NSArray *jiaoyi;
    NSArray *yigui;

    _XueSections=@[@"佛教的创立历程",@"佛教的发展与传播",@"佛教宗派派别",@"简述佛学教义与佛经",@"佛教仪轨入门知识"];
    
    licheng  = @[@{@"name":@"佛学概述",@"url":@"c001.sutra"}
                 ,@{@"name":@"佛教创立背景",@"url":@"c002.sutra"}
                 ,@{@"name":@"释迦牟尼成佛之前",@"url":@"c003.sutra"}
                 ,@{@"name":@"释迦牟尼佛的成佛过程",@"url":@"c004.sutra"}
                 ,@{@"name":@"释迦牟尼弟子摩诃迦叶",@"url":@"c005.sutra"}
                 ,@{@"name":@"释迦牟尼弟子目犍连",@"url":@"c006.sutra"}
                 ,@{@"name":@"释迦牟尼弟子富楼那",@"url":@"c007.sutra"}
                 ,@{@"name":@"释迦牟尼弟子须菩提",@"url":@"c008.sutra"}
                 ,@{@"name":@"释迦牟尼弟子舍利弗",@"url":@"c009.sutra"}
                 ,@{@"name":@"释迦牟尼弟子摩罗睺罗",@"url":@"c010.sutra"}
                 ,@{@"name":@"释迦牟尼弟子阿难陀",@"url":@"c011.sutra"}
                 ,@{@"name":@"释迦牟尼弟子优婆离",@"url":@"c012.sutra"}
                 ,@{@"name":@"释迦牟尼弟子阿那律",@"url":@"c013.sutra"}
                 ,@{@"name":@"释迦牟尼弟子迦旃延",@"url":@"c014.sutra"}
                 ,@{@"name":@"印度佛教发展的原始佛教时期",@"url":@"c015.sutra"}
                 ,@{@"name":@"印度佛教发展的部派佛教时期",@"url":@"c016.sutra"}
                 ,@{@"name":@"印度佛教发展的大乘佛教时期",@"url":@"c017.sutra"}
                 ,@{@"name":@"印度佛教发展的密宗佛教时期",@"url":@"c018.sutra"}
                 ,@{@"name":@"阿育王对佛教的发展贡献",@"url":@"c019.sutra"}
                 ,@{@"name":@"佛教在印度的衰落",@"url":@"c020.sutra"}];
    
    fazhan  = @[@{@"name":@"佛教东传阶段",@"url":@"c021.sutra"}
                ,@{@"name":@"中国佛教之初-永明求法",@"url":@"c022.sutra"}
                ,@{@"name":@"中国第一座寺庙",@"url":@"c023.sutra"}
                ,@{@"name":@"中国佛教之魏晋阶段",@"url":@"c024.sutra"}
                ,@{@"name":@"达摩祖师一苇渡江的传奇故事",@"url":@"c025.sutra"}
                ,@{@"name":@"中国佛教之隋唐阶段",@"url":@"c026.sutra"}
                ,@{@"name":@"隋文帝对佛教的贡献",@"url":@"c027.sutra"}
                ,@{@"name":@"唐代武则天对佛教发展的贡献",@"url":@"c028.sutra"}
                ,@{@"name":@"中国佛教之宋元阶段",@"url":@"c029.sutra"}
                ,@{@"name":@"中国佛教之明清阶段",@"url":@"c030.sutra"}
                ,@{@"name":@"中国名寺之灵隐寺",@"url":@"c031.sutra"}
                ,@{@"name":@"中国名寺之少林寺",@"url":@"c032.sutra"}
                ,@{@"name":@"中国名寺之寒山寺",@"url":@"c033.sutra"}
                ,@{@"name":@"中国名寺之龙华寺",@"url":@"c034.sutra"}
                ,@{@"name":@"中国名寺之相国寺",@"url":@"c035.sutra"}
                ,@{@"name":@"中国名寺之大悲禅院",@"url":@"c036.sutra"}
                ,@{@"name":@"中国名寺之大昭寺",@"url":@"c037.sutra"}
                ,@{@"name":@"中国名寺之大明寺",@"url":@"c038.sutra"}
                ,@{@"name":@"中国名寺之慈恩寺",@"url":@"c039.sutra"}
                ,@{@"name":@"藏传佛教概述",@"url":@"c040.sutra"}
                ,@{@"name":@"藏传佛教之宁玛派",@"url":@"c041.sutra"}
                ,@{@"name":@"藏传佛教之噶举派",@"url":@"c042.sutra"}
                ,@{@"name":@"藏传佛教之萨迦派",@"url":@"c043.sutra"}
                ,@{@"name":@"藏传佛教之觉囊派",@"url":@"c044.sutra"}
                ,@{@"name":@"藏传佛教之蒙古喇嘛教",@"url":@"c045.sutra"}
                ,@{@"name":@"佛教在其他地区的分布",@"url":@"c046.sutra"}];
    
    jiaoyi  = @[@"教义简介",@"清规节律"];
    _XueData = @[licheng,jiaoyi];
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
