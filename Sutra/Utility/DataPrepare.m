//
//  DataPrepare.m
//  Sutra
//
//  Created by medica_mac on 2017/9/4.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "DataPrepare.h"

@implementation DataPrepare

+ (NSArray *)installJingData
{
    NSMutableArray *_Jing=[[NSMutableArray alloc] init];
    [_Jing addObject:@{@"name":@"阿弥陀经",     @"url":@"a01amtj.sutra"}];
    [_Jing addObject:@{@"name":@"金刚经",       @"url":@"a02jgj.sutra"}];
    [_Jing addObject:@{@"name":@"心经",         @"url":@"a03xj.sutra"}];
    [_Jing addObject:@{@"name":@"六祖坛经",     @"url":@"a04lztj.sutra"}];
    [_Jing addObject:@{@"name":@"法华经",       @"url":@"a05fhj.sutra"}];
    [_Jing addObject:@{@"name":@"华严经卷一",       @"url":@"a06hyj1.sutra"}];
    [_Jing addObject:@{@"name":@"无量寿经",     @"url":@"a07wlsj.sutra"}];
    
    return _Jing;
}

+ (NSArray *)installKeHomeAlbumData
{
    NSMutableArray *_KeAlbum= [[NSMutableArray alloc] init];
    
    [_KeAlbum addObject:@{@"name":@"香赞",@"url":@"b01xz.sutra"}];
    [_KeAlbum addObject:@{@"name":@"宝鼎赞",@"url":@"b02bdz.sutra"}];
    [_KeAlbum addObject:@{@"name":@"楞严咒",@"url":@"b03lyz.sutra"}];
    [_KeAlbum addObject:@{@"name":@"大悲咒",@"url":@"b04dbz.sutra"}];
    [_KeAlbum addObject:@{@"name":@"十小咒",@"url":@"b05sxz.sutra"}];
    [_KeAlbum addObject:@{@"name":@"心经",@"url":@"b06xj.sutra"}];
    [_KeAlbum addObject:@{@"name":@"回向偈",@"url":@"b07hxj.sutra"}];
    [_KeAlbum addObject:@{@"name":@"赞佛偈",@"url":@"b08zfj.sutra"}];
    [_KeAlbum addObject:@{@"name":@"念圣号",@"url":@"b09nsh.sutra"}];
    [_KeAlbum addObject:@{@"name":@"发愿文普贤十大愿王",@"url":@"b10fyws.sutra"}];
    [_KeAlbum addObject:@{@"name":@"三皈依",@"url":@"b11sgy.sutra"}];
    [_KeAlbum addObject:@{@"name":@"赞观音文",@"url":@"b12zgyw.sutra"}];
    [_KeAlbum addObject:@{@"name":@"阿弥陀经",@"url":@"b13amtj.sutra"}];
    [_KeAlbum addObject:@{@"name":@"礼佛大忏悔文",@"url":@"b14dchw.sutra"}];
    [_KeAlbum addObject:@{@"name":@"蒙山施食",@"url":@"b15msss.sutra"}];
    [_KeAlbum addObject:@{@"name":@"往生咒",@"url":@"b16wsz.sutra"}];
    [_KeAlbum addObject:@{@"name":@"观闻圣号",@"url":@"b17gwsh.sutra"}];
    [_KeAlbum addObject:@{@"name":@"发愿文慈云净土",@"url":@"b18fywj.sutra"}];
    [_KeAlbum addObject:@{@"name":@"伽蓝赞",@"url":@"b19qlz.sutra"}];
    [_KeAlbum addObject:@{@"name":@"普贤菩萨警众偈",@"url":@"b20jzj.sutra"}];
    [_KeAlbum addObject:@{@"name":@"韦天赞",@"url":@"b21wtz.sutra"}];
    
    return _KeAlbum;
}

+ (NSArray *)installKeHomeSingleData
{
    NSMutableArray *_Ke = [[NSMutableArray alloc] init];
    [_Ke addObject:@{@"name":@"早斋",@"url":@"b22zz.sutra"}];
    [_Ke addObject:@{@"name":@"午斋",@"url":@"b23wz.sutra"}];
    [_Ke addObject:@{@"name":@"杨枝净水赞",@"url":@"b24yzjsz.sutra"}];
    [_Ke addObject:@{@"name":@"回向赞",@"url":@"b25hxz.sutra"}];
    [_Ke addObject:@{@"name":@"念圣号",@"url":@"b26nsh.sutra"}];
    [_Ke addObject:@{@"name":@"三真言",@"url":@"b27szy.sutra"}];
    [_Ke addObject:@{@"name":@"往生位前回向",@"url":@"b28wswqhx.sutra"}];
    [_Ke addObject:@{@"name":@"大回向",@"url":@"b29dhx.sutra"}];
    [_Ke addObject:@{@"name":@"同生极乐立誓顶礼",@"url":@"b30lsdl.sutra"}];
    [_Ke addObject:@{@"name":@"释迦牟尼佛圣诞祝仪",@"url":@"b31sjmnzy.sutra"}];
    [_Ke addObject:@{@"name":@"药师佛圣诞祝仪",@"url":@"b32ysfzy.sutra"}];
    [_Ke addObject:@{@"name":@"阿弥陀佛圣诞祝仪",@"url":@"b33amtfzy.sutra"}];
    [_Ke addObject:@{@"name":@"弥勒佛圣诞祝仪",@"url":@"b34mlfzy.sutra"}];
    [_Ke addObject:@{@"name":@"观音菩萨圣诞祝仪",@"url":@"b35gypszy.sutra"}];
    [_Ke addObject:@{@"name":@"普贤菩萨圣诞祝仪",@"url":@"b36pxpszy.sutra"}];
    [_Ke addObject:@{@"name":@"文殊菩萨圣诞祝仪",@"url":@"b37wspszy.sutra"}];
    [_Ke addObject:@{@"name":@"大势至菩萨圣诞祝仪",@"url":@"b38dszpszy.sutra"}];
    [_Ke addObject:@{@"name":@"地藏菩萨圣诞祝仪",@"url":@"b39dzpszy.sutra"}];
    [_Ke addObject:@{@"name":@"观音大士赞",@"url":@"b40gydsz.sutra"}];
    [_Ke addObject:@{@"name":@"补缺真言",@"url":@"b41bqzy.sutra"}];
    [_Ke addObject:@{@"name":@"回向偈",@"url":@"b42hxj.sutra"}];
    [_Ke addObject:@{@"name":@"诸佛菩萨圣诞日",@"url":@"b43zfpsdate.sutra"}];

    return _Ke;
}

+ (KeAlbum *)morningSong
{
    NSMutableArray *albumSutraList=  [[NSMutableArray alloc] init];
    
    [albumSutraList addObject:@{@"name":@"香赞",@"url":@"b01xz.sutra"}];
    [albumSutraList addObject:@{@"name":@"宝鼎赞",@"url":@"b02bdz.sutra"}];
    [albumSutraList addObject:@{@"name":@"楞严咒",@"url":@"b03lyz.sutra"}];
    [albumSutraList addObject:@{@"name":@"大悲咒",@"url":@"b04dbz.sutra"}];
    [albumSutraList addObject:@{@"name":@"十小咒",@"url":@"b05sxz.sutra"}];
    [albumSutraList addObject:@{@"name":@"心经",@"url":@"b06xj.sutra"}];
    [albumSutraList addObject:@{@"name":@"回向偈",@"url":@"b07hxj.sutra"}];
    [albumSutraList addObject:@{@"name":@"赞佛偈",@"url":@"b08zfj.sutra"}];
    [albumSutraList addObject:@{@"name":@"念圣号",@"url":@"b09nsh.sutra"}];
    [albumSutraList addObject:@{@"name":@"发愿文普贤十大愿王",@"url":@"b10fyws.sutra"}];
    [albumSutraList addObject:@{@"name":@"三皈依",@"url":@"b11sgy.sutra"}];
    [albumSutraList addObject:@{@"name":@"韦天赞",@"url":@"b21wtz.sutra"}];
    [albumSutraList addObject:@{@"name":@"赞观音文",@"url":@"b12zgyw.sutra"}];
    
    return [[KeAlbum alloc] initWithName:@"早课" array:albumSutraList];
}

+ (KeAlbum *)eveningSong
{
    NSMutableArray *albumSutraList=  [[NSMutableArray alloc] init];
    
    [albumSutraList addObject:@{@"name":@"阿弥陀经",@"url":@"b13amtj.sutra"}];
    [albumSutraList addObject:@{@"name":@"礼佛大忏悔文",@"url":@"b14dchw.sutra"}];
    [albumSutraList addObject:@{@"name":@"蒙山施食",@"url":@"b15msss.sutra"}];
    [albumSutraList addObject:@{@"name":@"心经",@"url":@"b06xj.sutra"}];
    [albumSutraList addObject:@{@"name":@"往生咒",@"url":@"b16wsz.sutra"}];
    [albumSutraList addObject:@{@"name":@"赞佛偈",@"url":@"b08zfj.sutra"}];
    [albumSutraList addObject:@{@"name":@"发愿文慈云净土",@"url":@"b18fywj.sutra"}];
    [albumSutraList addObject:@{@"name":@"三皈依",@"url":@"b11sgy.sutra"}];
    [albumSutraList addObject:@{@"name":@"大悲咒",@"url":@"b04dbz.sutra"}];
    [albumSutraList addObject:@{@"name":@"伽蓝赞",@"url":@"b19qlz.sutra"}];
    
    return  [[KeAlbum alloc] initWithName:@"晚课" array:albumSutraList];
}

+ (NSArray *)installXueSectionData
{
    return @[@"佛教的创立历程",@"佛教的发展与传播",@"佛教宗派派别",@"简述佛学教义与佛经",@"佛教仪轨入门知识"];
}

+ (NSArray *)installXueData
{
    NSArray *licheng;
    NSArray *fazhan;
    NSArray *paibie;
    NSArray *jiaoyi;
    NSArray *yigui;
    
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
    
    return @[licheng,fazhan,paibie,jiaoyi,yigui];
}

+ (NSArray *)installTuData
{
    NSArray *array = @[@{@"name":@"雍和宫",@"url":@"e01.sutra",@"location":@""}
                       ,@{@"name":@"佛教礼仪之参观礼仪",@"url":@"e02.sutra",@"location":@""}
                       ,@{@"name":@"佛教礼仪之佛殿礼仪",@"url":@"e03.sutra",@"location":@""}
                       ,@{@"name":@"佛教礼仪之礼拜礼仪",@"url":@"e04.sutra",@"location":@""}
                       ,@{@"name":@"佛教礼仪之礼佛礼仪",@"url":@"e05.sutra",@"location":@""}
                       ,@{@"name":@"佛教礼仪之请求法师开示礼仪",@"url":@"e06.sutra",@"location":@""}
                       ,@{@"name":@"佛教礼仪之斋堂礼仪",@"url":@"e07.sutra",@"location":@""}
                       ,@{@"name":@"佛教礼仪之上香礼仪",@"url":@"e08.sutra",@"location":@""}
                       ,@{@"name":@"敬佛",@"url":@"e09.sutra",@"location":@""}
                       ,@{@"name":@"敬法",@"url":@"e10.sutra",@"location":@""}
                       ,@{@"name":@"敬僧",@"url":@"e11.sutra",@"location":@""}
                       ,@{@"name":@"佛教徒名称的正式称呼",@"url":@"e12.sutra",@"location":@""}
                       ,@{@"name":@"佛教徒名称的别称",@"url":@"e13.sutra",@"location":@""}
                       ,@{@"name":@"僧人生活概述",@"url":@"e14.sutra",@"location":@""}
                       ,@{@"name":@"僧人生活之朝暮课诵",@"url":@"e15.sutra",@"location":@""}
                       ,@{@"name":@"僧人生活之布萨诵戒",@"url":@"e16.sutra",@"location":@""}
                       ,@{@"name":@"僧人生活之过堂",@"url":@"e17.sutra",@"location":@""}
                       ,@{@"name":@"修佛戒律之不杀生",@"url":@"e18.sutra",@"location":@""}
                       ,@{@"name":@"修佛戒律之不偷盗",@"url":@"e19.sutra",@"location":@""}
                       ,@{@"name":@"修佛戒律之不邪淫",@"url":@"e20.sutra",@"location":@""}
                       ,@{@"name":@"修佛戒律之不妄语",@"url":@"e21.sutra",@"location":@""}
                       ,@{@"name":@"修佛戒律之不饮酒",@"url":@"e22.sutra",@"location":@""}
                       ,@{@"name":@"佛教出家人的衣着",@"url":@"e23.sutra",@"location":@""}
                       ,@{@"name":@"“袈裟”的形状",@"url":@"e24.sutra",@"location":@""}
                       ,@{@"name":@"袈裟的形成",@"url":@"e25.sutra",@"location":@""}
                       ,@{@"name":@"“五衣”的形状",@"url":@"e26.sutra",@"location":@""}
                       ,@{@"name":@"“缦衣”的形状",@"url":@"e27.sutra",@"location":@""}
                       ,@{@"name":@"“传衣”的含义",@"url":@"e28.sutra",@"location":@""}
                       ,@{@"name":@"“海青”的形状",@"url":@"e29.sutra",@"location":@""}
                       ,@{@"name":@"“大褂”的形状",@"url":@"e30.sutra",@"location":@""}
                       ,@{@"name":@"佛教节日概述",@"url":@"e31.sutra",@"location":@""}
                       ,@{@"name":@"佛诞节",@"url":@"e32.sutra",@"location":@""}
                       ,@{@"name":@"观音会",@"url":@"e33.sutra",@"location":@""}
                       ,@{@"name":@"地藏会",@"url":@"e34.sutra",@"location":@""}
                       ,@{@"name":@"弥陀诞日",@"url":@"e35.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e36.sutra",@"location":@""}
                       ,@{@"name":@"佛教二十道法会",@"url":@"e37.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e38.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e39.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e40.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e41.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e42.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e43.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e44.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e45.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e46.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e47.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e48.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e49.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e50.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e51.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e52.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e53.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e54.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e55.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e56.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e57.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e58.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e59.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e60.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e61.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e62.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e63.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e64.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e65.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e66.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e67.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e68.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e69.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e70.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e71.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e72.sutra",@"location":@""}
                       ,@{@"name":@"盂兰盆会",@"url":@"e73.sutra",@"location":@""}];
    
    return array;
}

@end
