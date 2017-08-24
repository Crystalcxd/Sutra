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
    
    paibie = @[@{@"name":@"中国佛教语系概述",@"url":@"c047.sutra"}
               ,@{@"name":@"中国佛教语系之汉语系佛教",@"url":@"c048.sutra"}
               ,@{@"name":@"中国佛教语系之藏语系佛教",@"url":@"c049.sutra"}
               ,@{@"name":@"中国佛教语系之南传上座部佛教",@"url":@"c050.sutra"}
               ,@{@"name":@"中国佛教派别概述",@"url":@"c051.sutra"}
               ,@{@"name":@"中国佛教派别之三论宗",@"url":@"c052.sutra"}
               ,@{@"name":@"中国佛教派别之唯识宗",@"url":@"c053.sutra"}
               ,@{@"name":@"中国佛教派别之天台宗",@"url":@"c054.sutra"}
               ,@{@"name":@"中国佛教派别之华严宗",@"url":@"c055.sutra"}
               ,@{@"name":@"中国佛教派别之禅宗",@"url":@"c056.sutra"}
               ,@{@"name":@"禅宗六祖慧能的传奇故事",@"url":@"c057.sutra"}
               ,@{@"name":@"慧可断臂求法的传奇故事",@"url":@"c058.sutra"}
               ,@{@"name":@"中国佛教派别之净土宗",@"url":@"c059.sutra"}
               ,@{@"name":@"中国佛教派别之律宗",@"url":@"c060.sutra"}
               ,@{@"name":@"中国佛教派别之密宗",@"url":@"c061.sutra"}];
    
    jiaoyi  = @[@{@"name":@"佛教教义-缘起",@"url":@"c062.sutra"}
                ,@{@"name":@"关于缘起的创奇故事",@"url":@"c063.sutra"}
                ,@{@"name":@"佛教教义-法印	",@"url":@"c064.sutra"}
                ,@{@"name":@"关于法印的创奇故事",@"url":@"c065.sutra"}
                ,@{@"name":@"佛教教义-四谛	",@"url":@"c066.sutra"}
                ,@{@"name":@"关于四谛的创奇故事",@"url":@"c067.sutra"}
                ,@{@"name":@"佛教教义-八正道",@"url":@"c068.sutra"}
                ,@{@"name":@"关于八正道的创奇故事",@"url":@"c069.sutra"}
                ,@{@"name":@"佛教教义-十二因缘",@"url":@"c070.sutra"}
                ,@{@"name":@"佛教教义-因果业报",@"url":@"c071.sutra"}
                ,@{@"name":@"关于因果业报的创奇故事",@"url":@"c072.sutra"}
                ,@{@"name":@"佛教教义-三界六道",@"url":@"c073.sutra"}
                ,@{@"name":@"佛教教义-三十七道品",@"url":@"c074.sutra"}
                ,@{@"name":@"佛教教义-涅盘",@"url":@"c075.sutra"}
                ,@{@"name":@"关于涅盘的创奇故事",@"url":@"c076.sutra"}
                ,@{@"name":@"经律论三藏基本分类",@"url":@"c077.sutra"}
                ,@{@"name":@"经律论三藏的形成过程",@"url":@"c078.sutra"}
                ,@{@"name":@"香严智闲禅师的传奇故事",@"url":@"c079.sutra"}
                ,@{@"name":@"汉文佛经的翻译的概述",@"url":@"c080.sutra"}
                ,@{@"name":@"汉文佛经在东汉初创翻译时期",@"url":@"c081.sutra"}
                ,@{@"name":@"汉文佛经在东晋、隋代官方翻译时期",@"url":@"c082.sutra"}
                ,@{@"name":@"汉文佛经在唐代全盛翻译时期",@"url":@"c083.sutra"}
                ,@{@"name":@"汉文佛经在宋代以后刻本翻译时期",@"url":@"c084.sutra"}
                ,@{@"name":@"经典佛经之《般若波罗蜜多心经》",@"url":@"c085.sutra"}
                ,@{@"name":@"经典佛经之《金刚般若波罗蜜经》、《楞严经》、《妙法莲华经》",@"url":@"c086.sutra"}
                ,@{@"name":@"经典佛经之《大方广佛华严经》",@"url":@"c087.sutra"}
                ,@{@"name":@"经典佛经之《阿弥陀经》、《无量寿经》、《观无量寿经》",@"url":@"c088.sutra"}
                ,@{@"name":@"经典佛经之《长阿含经》",@"url":@"c089.sutra"}
                ,@{@"name":@"经典佛经之《地藏菩萨本愿经》",@"url":@"c090.sutra"}
                ,@{@"name":@"五大译经师之鸠摩罗什",@"url":@"c091.sutra"}
                ,@{@"name":@"五大译经师之真谛三藏法师",@"url":@"c092.sutra"}
                ,@{@"name":@"五大译经师之玄奘三藏法师",@"url":@"c093.sutra"}
                ,@{@"name":@"五大译经师之义净三藏法师",@"url":@"c094.sutra"}
                ,@{@"name":@"五大译经师之不空三藏法师",@"url":@"c095.sutra"}];
    
    yigui = @[@{@"name":@"佛教礼仪之四威仪",@"url":@"c096.sutra"}
              ,@{@"name":@"佛教礼仪之参观礼仪",@"url":@"c097.sutra"}
              ,@{@"name":@"佛教礼仪之佛殿礼仪",@"url":@"c098.sutra"}
              ,@{@"name":@"佛教礼仪之礼拜礼仪",@"url":@"c099.sutra"}
              ,@{@"name":@"佛教礼仪之礼佛礼仪",@"url":@"c100.sutra"}
              ,@{@"name":@"佛教礼仪之请求法师开示礼仪",@"url":@"c101.sutra"}
              ,@{@"name":@"佛教礼仪之斋堂礼仪",@"url":@"c102.sutra"}
              ,@{@"name":@"佛教礼仪之上香礼仪",@"url":@"c103.sutra"}
              ,@{@"name":@"敬佛",@"url":@"c104.sutra"}
              ,@{@"name":@"敬法",@"url":@"c105.sutra"}
              ,@{@"name":@"敬僧",@"url":@"c106.sutra"}
              ,@{@"name":@"佛教徒名称的正式称呼",@"url":@"c107.sutra"}
              ,@{@"name":@"佛教徒名称的别称",@"url":@"c108.sutra"}
              ,@{@"name":@"僧人生活概述",@"url":@"c109.sutra"}
              ,@{@"name":@"僧人生活之朝暮课诵",@"url":@"c110.sutra"}
              ,@{@"name":@"僧人生活之布萨诵戒",@"url":@"c111.sutra"}
              ,@{@"name":@"僧人生活之过堂",@"url":@"c112.sutra"}
              ,@{@"name":@"修佛戒律之不杀生",@"url":@"c113.sutra"}
              ,@{@"name":@"修佛戒律之不偷盗",@"url":@"c114.sutra"}
              ,@{@"name":@"修佛戒律之不邪淫",@"url":@"c115.sutra"}
              ,@{@"name":@"修佛戒律之不妄语",@"url":@"c116.sutra"}
              ,@{@"name":@"修佛戒律之不饮酒",@"url":@"c117.sutra"}
              ,@{@"name":@"佛教出家人的衣着",@"url":@"c118.sutra"}
              ,@{@"name":@"“袈裟”的形状",@"url":@"c119.sutra"}
              ,@{@"name":@"袈裟的形成",@"url":@"c120.sutra"}
              ,@{@"name":@"“五衣”的形状",@"url":@"c121.sutra"}
              ,@{@"name":@"“缦衣”的形状",@"url":@"c122.sutra"}
              ,@{@"name":@"“传衣”的含义",@"url":@"c123.sutra"}
              ,@{@"name":@"“海青”的形状",@"url":@"c124.sutra"}
              ,@{@"name":@"“大褂”的形状",@"url":@"c125.sutra"}
              ,@{@"name":@"佛教节日概述",@"url":@"c126.sutra"}
              ,@{@"name":@"佛诞节",@"url":@"c127.sutra"}
              ,@{@"name":@"观音会",@"url":@"c128.sutra"}
              ,@{@"name":@"地藏会",@"url":@"c129.sutra"}
              ,@{@"name":@"弥陀诞日",@"url":@"c130.sutra"}
              ,@{@"name":@"盂兰盆会",@"url":@"c131.sutra"}
              ,@{@"name":@"佛教二十道法会",@"url":@"c132.sutra"}];
    
    _XueData = @[licheng,fazhan,paibie,jiaoyi,yigui];
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
    NSLog(@"%@",indexPath);
    
    JingDetailCtrl *vc = [[JingDetailCtrl alloc] init];
    NSLog(@"didSelect Jing%@",_XueData[indexPath.section][indexPath.row]);
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
