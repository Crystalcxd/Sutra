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
    [_Jing addObject:@{@"name":@"阿弥陀经",@"url":@"a01amtj.sutra"}];
    [_Jing addObject:@{@"name":@"金刚经",@"url":@"a02jgj.sutra"}];
    [_Jing addObject:@{@"name":@"心经",@"url":@"a03xj.sutra"}];
    [_Jing addObject:@{@"name":@"六祖坛经",@"url":@"a04lztj.sutra"}];
    [_Jing addObject:@{@"name":@"法华经",@"url":@"a05fhj.sutra"}];
    [_Jing addObject:@{@"name":@"华严经卷一",@"url":@"a06hyj1.sutra"}];
    [_Jing addObject:@{@"name":@"无量寿经",@"url":@"a07wlsj.sutra"}];
    [_Jing addObject:@{@"name":@"地藏菩萨本愿经",@"url":@"a08dzpsbyj.sutra"}];
    [_Jing addObject:@{@"name":@"楞严经",@"url":@"a09lyj.sutra"}];
    [_Jing addObject:@{@"name":@"梵网经",@"url":@"a10fwj.sutra"}];
    [_Jing addObject:@{@"name":@"金光明经",@"url":@"a11jgmj.sutra"}];
    [_Jing addObject:@{@"name":@"解深密经",@"url":@"a12jsmj.sutra"}];
    [_Jing addObject:@{@"name":@"楞伽经",@"url":@"a13ljj.sutra"}];
    [_Jing addObject:@{@"name":@"四十二章经",@"url":@"a14ssezj.sutra"}];
    [_Jing addObject:@{@"name":@"维摩诘经",@"url":@"a15wmjj.sutra"}];
    [_Jing addObject:@{@"name":@"圆觉经",@"url":@"a16yjj.sutra"}];

    NSLog(@"JingData ==== %@",[DataPrepare convertToJsonData:_Jing]);
    
    return _Jing;
}

+ (NSArray *)installKeHomeAlbumData
{
    NSMutableArray *_KeAlbum= [[NSMutableArray alloc] init];
    
    [_KeAlbum addObject:@{@"name":@"香赞",@"url":@"b01xz.sutra"}];
    [_KeAlbum addObject:@{@"name":@"宝鼎赞（音）",@"url":@"b02bdz.sutra"}];
    [_KeAlbum addObject:@{@"name":@"楞严咒",@"url":@"b03lyz.sutra"}];
    [_KeAlbum addObject:@{@"name":@"大悲咒（音）",@"url":@"b04dbz.sutra"}];
    [_KeAlbum addObject:@{@"name":@"十小咒（音）",@"url":@"b05sxz.sutra"}];
    [_KeAlbum addObject:@{@"name":@"心经（音）",@"url":@"b06xj.sutra"}];
    [_KeAlbum addObject:@{@"name":@"回向偈",@"url":@"b07hxj.sutra"}];
    [_KeAlbum addObject:@{@"name":@"赞佛偈",@"url":@"b08zfj.sutra"}];
    [_KeAlbum addObject:@{@"name":@"念圣号",@"url":@"b09nsh.sutra"}];
    [_KeAlbum addObject:@{@"name":@"发愿文普贤十大愿王",@"url":@"b10fyws.sutra"}];
    [_KeAlbum addObject:@{@"name":@"三皈依（音）",@"url":@"b11sgy.sutra"}];
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
    
    NSLog(@"KeHomeAlbumData ==== %@",[DataPrepare convertToJsonData:_KeAlbum]);

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

    NSLog(@"KeHomeSingleData ==== %@",[DataPrepare convertToJsonData:_Ke]);

    return _Ke;
}

+ (KeAlbum *)morningSong
{
    NSMutableArray *albumSutraList=  [[NSMutableArray alloc] init];
    
    [albumSutraList addObject:@{@"name":@"香赞",@"url":@"b01xz.sutra"}];
    [albumSutraList addObject:@{@"name":@"宝鼎赞（音）",@"url":@"b02bdz.sutra"}];
    [albumSutraList addObject:@{@"name":@"楞严咒",@"url":@"b03lyz.sutra"}];
    [albumSutraList addObject:@{@"name":@"大悲咒（音）",@"url":@"b04dbz.sutra"}];
    [albumSutraList addObject:@{@"name":@"十小咒（音）",@"url":@"b05sxz.sutra"}];
    [albumSutraList addObject:@{@"name":@"心经（音）",@"url":@"b06xj.sutra"}];
    [albumSutraList addObject:@{@"name":@"回向偈",@"url":@"b07hxj.sutra"}];
    [albumSutraList addObject:@{@"name":@"赞佛偈",@"url":@"b08zfj.sutra"}];
    [albumSutraList addObject:@{@"name":@"念圣号",@"url":@"b09nsh.sutra"}];
    [albumSutraList addObject:@{@"name":@"发愿文普贤十大愿王",@"url":@"b10fyws.sutra"}];
    [albumSutraList addObject:@{@"name":@"三皈依（音）",@"url":@"b11sgy.sutra"}];
    [albumSutraList addObject:@{@"name":@"韦天赞",@"url":@"b21wtz.sutra"}];
    [albumSutraList addObject:@{@"name":@"赞观音文",@"url":@"b12zgyw.sutra"}];
    
    NSLog(@"morningSong ==== %@",[DataPrepare convertToJsonData:albumSutraList]);

    return [[KeAlbum alloc] initWithName:@"早课" array:albumSutraList];
}

+ (KeAlbum *)eveningSong
{
    NSMutableArray *albumSutraList=  [[NSMutableArray alloc] init];
    
    [albumSutraList addObject:@{@"name":@"阿弥陀经",@"url":@"b13amtj.sutra"}];
    [albumSutraList addObject:@{@"name":@"礼佛大忏悔文",@"url":@"b14dchw.sutra"}];
    [albumSutraList addObject:@{@"name":@"蒙山施食",@"url":@"b15msss.sutra"}];
    [albumSutraList addObject:@{@"name":@"心经（音）",@"url":@"b06xj.sutra"}];
    [albumSutraList addObject:@{@"name":@"往生咒",@"url":@"b16wsz.sutra"}];
    [albumSutraList addObject:@{@"name":@"赞佛偈",@"url":@"b08zfj.sutra"}];
    [albumSutraList addObject:@{@"name":@"发愿文慈云净土",@"url":@"b18fywj.sutra"}];
    [albumSutraList addObject:@{@"name":@"三皈依（音）",@"url":@"b11sgy.sutra"}];
    [albumSutraList addObject:@{@"name":@"大悲咒（音）",@"url":@"b04dbz.sutra"}];
    [albumSutraList addObject:@{@"name":@"伽蓝赞",@"url":@"b19qlz.sutra"}];
    
    NSLog(@"eveningSong ==== %@",[DataPrepare convertToJsonData:albumSutraList]);

    return  [[KeAlbum alloc] initWithName:@"晚课" array:albumSutraList];
}

+ (NSArray *)installXueSectionData
{
    NSLog(@"XueSectionData ==== %@",[DataPrepare convertToJsonData:@[@"佛教的创立历程",@"佛教的发展与传播",@"佛教宗派派别",@"简述佛学教义与佛经",@"佛教仪轨入门知识"]]);

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
                 ,@{@"name":@"释迦牟尼是如何诞生的",@"url":@"c003.sutra"}
                 ,@{@"name":@"释迦牟尼成佛之前",@"url":@"c004.sutra"}
                 ,@{@"name":@"释迦牟尼佛的成佛过程",@"url":@"c005.sutra"}
                 ,@{@"name":@"释迦牟尼是如何悟道成佛的",@"url":@"c006.sutra"}
                 ,@{@"name":@"释迦牟尼弟子",@"url":@"c007.sutra"}
                 ,@{@"name":@"印度佛教发展的原始佛教时期",@"url":@"c008.sutra"}
                 ,@{@"name":@"印度佛教发展的部派佛教时期",@"url":@"c009.sutra"}
                 ,@{@"name":@"印度佛教发展的大乘佛教时期",@"url":@"c010.sutra"}
                 ,@{@"name":@"印度佛教发展的密宗佛教时期",@"url":@"c011.sutra"}
                 ,@{@"name":@"阿育王对佛教的发展贡献",@"url":@"c012.sutra"}
                 ,@{@"name":@"佛教在印度的衰落",@"url":@"c013.sutra"}];
    NSLog(@"licheng ==== %@",[DataPrepare convertToJsonData:licheng]);

    fazhan  = @[@{@"name":@"佛法东来——汉（中华第一寺）",@"url":@"c014.sutra"}
                ,@{@"name":@"佛法东来——三国（西行求法第一人）",@"url":@"c015.sutra"}
                ,@{@"name":@"佛法东来——西晋（敦煌菩萨）",@"url":@"c016.sutra"}
                ,@{@"name":@"佛光普照——东晋、十六国",@"url":@"c017.sutra"}
                ,@{@"name":@"佛光普照一南北朝（和尚开始吃斋）",@"url":@"c018.sutra"}
                ,@{@"name":@"显密全盛——隋（房山石刻）",@"url":@"c019.sutra"}
                ,@{@"name":@"显密全盛——唐（禅宗的起源）",@"url":@"c020.sutra"}
                ,@{@"name":@"禅净双修一五代十国（南国佛教兴起）",@"url":@"c021.sutra"}
                ,@{@"name":@"禅净双修—宋（文字禅的兴起）",@"url":@"c022.sutra"}
                ,@{@"name":@"禅净双修——元（佛教宗派走向世俗）",@"url":@"c023.sutra"}
                ,@{@"name":@"禅净双修——明（四大高僧）",@"url":@"c024.sutra"}
                ,@{@"name":@"禅净双修——清（诗僧画僧）",@"url":@"c025.sutra"}
                ,@{@"name":@"居士佛教——近代复兴（居士佛教的兴起）",@"url":@"c026.sutra"}
                ,@{@"name":@"雪域弘法——西藏佛教",@"url":@"c027.sutra"}
                ,@{@"name":@"佛教在其他地区的分布",@"url":@"c028.sutra"}];
    NSLog(@"fazhan ==== %@",[DataPrepare convertToJsonData:fazhan]);

    paibie = @[@{@"name":@"中国佛教语系概述",@"url":@"c029.sutra"}
               ,@{@"name":@"中国佛教语系之汉语系佛教",@"url":@"c030.sutra"}
               ,@{@"name":@"中国佛教语系之藏语系佛教",@"url":@"c031.sutra"}
               ,@{@"name":@"中国佛教语系之南传上座部佛教",@"url":@"c032.sutra"}
               ,@{@"name":@"中国佛教派别概述",@"url":@"c033.sutra"}
               ,@{@"name":@"中国佛教派别之三论宗",@"url":@"c034.sutra"}
               ,@{@"name":@"中国佛教派别之唯识宗",@"url":@"c035.sutra"}
               ,@{@"name":@"中国佛教派别之天台宗",@"url":@"c036.sutra"}
               ,@{@"name":@"中国佛教派别之华严宗",@"url":@"c037.sutra"}
               ,@{@"name":@"中国佛教派别之禅宗",@"url":@"c038.sutra"}
               ,@{@"name":@"中国佛教派别之净土宗",@"url":@"c039.sutra"}
               ,@{@"name":@"中国佛教派别之律宗",@"url":@"c040.sutra"}
               ,@{@"name":@"中国佛教派别之密宗",@"url":@"c041.sutra"}
               ,@{@"name":@"中国名寺之灵隐寺",@"url":@"c042.sutra"}
               ,@{@"name":@"中国名寺之寒山寺",@"url":@"c043.sutra"}
               ,@{@"name":@"中国名寺之龙华寺",@"url":@"c044.sutra"}
               ,@{@"name":@"中国名寺之相国寺",@"url":@"c045.sutra"}
               ,@{@"name":@"中国名寺之大悲禅院",@"url":@"c046.sutra"}
               ,@{@"name":@"中国名寺之大昭寺",@"url":@"c047.sutra"}];
    NSLog(@"paibie ==== %@",[DataPrepare convertToJsonData:paibie]);

    jiaoyi  = @[@{@"name":@"佛教教义-缘起",@"url":@"c048.sutra"}
                ,@{@"name":@"佛教教义——三法印、三皈依、三学",@"url":@"c049.sutra"}
                ,@{@"name":@"佛教教义——四谛",@"url":@"c050.sutra"}
                ,@{@"name":@"佛教教义——四谛二重因果、四大皆空",@"url":@"c051.sutra"}
                ,@{@"name":@"佛教教义-八正道",@"url":@"c052.sutra"}
                ,@{@"name":@"佛教教义-十二因缘",@"url":@"c053.sutra"}
                ,@{@"name":@"佛教教义-十二因缘",@"url":@"c054.sutra"}
                ,@{@"name":@"佛教教义-三界六道、三十七道品",@"url":@"c055.sutra"}
                ,@{@"name":@"佛教教义-涅盘",@"url":@"c056.sutra"}
                ,@{@"name":@"什么是佛经",@"url":@"c057.sutra"}
                ,@{@"name":@"佛经的形成过程",@"url":@"c058.sutra"}
                ,@{@"name":@"佛经在中国的传播",@"url":@"c059.sutra"}
                ,@{@"name":@"佛经的基本结构",@"url":@"c060.sutra"}
                ,@{@"name":@"三分科经",@"url":@"c061.sutra"}
                ,@{@"name":@"佛经的因缘",@"url":@"c062.sutra"}
                ,@{@"name":@"佛经的正文",@"url":@"c063.sutra"}
                ,@{@"name":@"佛经的结语",@"url":@"c064.sutra"}
                ,@{@"name":@"中国历代刻印本大藏经简介",@"url":@"c065.sutra"}
                ,@{@"name":@"研读佛经的基础工具书",@"url":@"c066.sutra"}
                ,@{@"name":@"经典佛经之《般若波罗蜜多心经》",@"url":@"c067.sutra"}
                ,@{@"name":@"经典佛经之《金刚般若波罗蜜经》",@"url":@"c068.sutra"}
                ,@{@"name":@"经典佛经之《楞严经》",@"url":@"c069.sutra"}
                ,@{@"name":@"经典佛经之《妙法莲华经》",@"url":@"c070.sutra"}
                ,@{@"name":@"经典佛经之《大方广佛华严经》",@"url":@"c071.sutra"}
                ,@{@"name":@"经典佛经之阿弥陀经 无量寿经 观无量寿经",@"url":@"c072.sutra"}
                ,@{@"name":@"经典佛经之《长阿含经》",@"url":@"c073.sutra"}
                ,@{@"name":@"经典佛经之《地藏菩萨本愿经》",@"url":@"c074.sutra"}
                ,@{@"name":@"五大译经师之鸠摩罗什",@"url":@"c075.sutra"}
                ,@{@"name":@"五大译经师之真谛三藏法师",@"url":@"c076.sutra"}
                ,@{@"name":@"五大译经师之玄奘三藏法师",@"url":@"c077.sutra"}
                ,@{@"name":@"五大译经师之义净三藏法师",@"url":@"c078.sutra"}
                ,@{@"name":@"五大译经师之不空三藏法师",@"url":@"c079.sutra"}];
    NSLog(@"jiaoyi ==== %@",[DataPrepare convertToJsonData:jiaoyi]);

    yigui = @[@{@"name":@"出家五众、在家二众",@"url":@"c080.sutra"}
              ,@{@"name":@"佛教徒名称的由来",@"url":@"c081.sutra"}
              ,@{@"name":@"僧人的日常生活规范",@"url":@"c082.sutra"}
              ,@{@"name":@"修佛戒律",@"url":@"c083.sutra"}
              ,@{@"name":@"佛教出家人的衣着",@"url":@"c084.sutra"}
              ,@{@"name":@"佛教节日概述",@"url":@"c085.sutra"}
              ,@{@"name":@"佛教二十道法会",@"url":@"c086.sutra"}
              ,@{@"name":@"寺院布局",@"url":@"c087.sutra"}
              ,@{@"name":@"游客进入寺院应遵循的礼仪",@"url":@"c088.sutra"}
              ,@{@"name":@"佛教的法器",@"url":@"c089.sutra"}
              ,@{@"name":@"什么是三宝？如何皈依三宝",@"url":@"c090.sutra"}
              ,@{@"name":@"在家居士如何持斋",@"url":@"c091.sutra"}
              ,@{@"name":@"在家居士如何修行",@"url":@"c092.sutra"}
              ,@{@"name":@"游客如何参访寺院",@"url":@"c093.sutra"}];
    NSLog(@"yigui ==== %@",[DataPrepare convertToJsonData:yigui]);

    return @[licheng,fazhan,paibie,jiaoyi,yigui];
}

+ (NSArray *)installTuData
{
    NSArray *array = @[@{@"name":@"雍和宫",@"url":@"e01.sutra",@"location":@"116.423672,39.954017"}
                       ,@{@"name":@"广化寺",@"url":@"e02.sutra",@"location":@"116.397019,39.947307"}
                       ,@{@"name":@"龙泉寺",@"url":@"e03.sutra",@"location":@"116.098111,40.109054"}
                       ,@{@"name":@"广济寺",@"url":@"e04.sutra",@"location":@"116.378817,39.930348"}
                       ,@{@"name":@"天开寺",@"url":@"e05.sutra",@"location":@"115.902588,39.623595"}
                       ,@{@"name":@"极乐寺",@"url":@"e06.sutra",@"location":@"115.902588,39.623595"}
                       ,@{@"name":@"观音古刹",@"url":@"e07.sutra",@"location":@"126.560948,43.854255"}
                       ,@{@"name":@"般若寺",@"url":@"e08.sutra",@"location":@"125.334735,43.894903"}
                       ,@{@"name":@"慈恩寺",@"url":@"e09.sutra",@"location":@"123.467365,41.789691"}
                       ,@{@"name":@"大悲院",@"url":@"e10.sutra",@"location":@"117.196502,39.160861"}
                       ,@{@"name":@"普宁寺",@"url":@"e11.sutra",@"location":@"117.958812,41.023159"}
                       ,@{@"name":@"临济寺",@"url":@"e12.sutra",@"location":@"114.579374,38.141127"}
                       ,@{@"name":@"白马寺",@"url":@"e13.sutra",@"location":@"112.612889,34.727767"}
                       ,@{@"name":@"相国寺",@"url":@"e14.sutra",@"location":@"114.360997,34.79778"}
                       ,@{@"name":@"海宝塔寺",@"url":@"e15.sutra",@"location":@"106.287026,38.49776"}
                       ,@{@"name":@"锡林浩特贝子庙",@"url":@"e16.sutra",@"location":@"116.075793,43.956716"}
                       ,@{@"name":@"拉卜楞寺",@"url":@"e17.sutra",@"location":@"102.515986,35.199039"}
                       ,@{@"name":@"净业寺",@"url":@"e18.sutra",@"location":@"108.833663,34.0302"}
                       ,@{@"name":@"法门寺",@"url":@"e19.sutra",@"location":@"107.907845,34.441207"}
                       ,@{@"name":@"大兴善寺",@"url":@"e20.sutra",@"location":@"108.94993,34.233247"}
                       ,@{@"name":@"大慈恩寺",@"url":@"e21.sutra",@"location":@"108.970523,34.223942"}
                       ,@{@"name":@"哲蚌寺",@"url":@"e22.sutra",@"location":@"91.055608,29.679162"}
                       ,@{@"name":@"大昭寺",@"url":@"e23.sutra",@"location":@"91.139911,29.656042"}
                       ,@{@"name":@"塔尔寺",@"url":@"e24.sutra",@"location":@"101.576298,36.494462"}
                       ,@{@"name":@"佛教四大名山之峨眉山",@"url":@"e25.sutra",@"location":@"103.447858,29.584531"}
                       ,@{@"name":@"报国寺",@"url":@"e26.sutra",@"location":@"103.449944,29.574399"}
                       ,@{@"name":@"昭觉寺",@"url":@"e27.sutra",@"location":@"104.112506,30.711707"}
                       ,@{@"name":@"文殊院",@"url":@"e28.sutra",@"location":@"104.078992,30.681333"}
                       ,@{@"name":@"大佛禅院",@"url":@"e29.sutra",@"location":@"103.499254,29.596761"}
                       ,@{@"name":@"伏虎寺",@"url":@"e30.sutra",@"location":@"103.442961,29.567865"}
                       ,@{@"name":@"罗汉寺",@"url":@"e31.sutra",@"location":@"103.702506,29.000038"}
                       ,@{@"name":@"弘福寺",@"url":@"e32.sutra",@"location":@"106.698677,26.599982"}
                       ,@{@"name":@"圆通寺",@"url":@"e33.sutra",@"location":@"106.825493,26.522383"}
                       ,@{@"name":@"崇圣寺",@"url":@"e34.sutra",@"location":@"100.146104,25.708839"}
                       ,@{@"name":@"金顶寺",@"url":@"e35.sutra",@"location":@"100.366754,25.976088"}
                       ,@{@"name":@"少林寺",@"url":@"e36.sutra",@"location":@"112.94859,34.512386"}
                       ,@{@"name":@"佛教四大名山之五台山",@"url":@"e37.sutra",@"location":@"113.59458,38.974951"}
                       ,@{@"name":@"显通寺",@"url":@"e38.sutra",@"location":@"113.603094,39.01527"}
                       ,@{@"name":@"南禅寺",@"url":@"e39.sutra",@"location":@"120.315647,31.57186"}
                       ,@{@"name":@"佛教四大名山之九华山",@"url":@"e40.sutra",@"location":@"117.794818,30.552155"}
                       ,@{@"name":@"天台寺",@"url":@"e41.sutra",@"location":@"117.776781,30.572417"}
                       ,@{@"name":@"百岁宫",@"url":@"e42.sutra",@"location":@"117.815581,30.486561"}
                       ,@{@"name":@"明教寺",@"url":@"e43.sutra",@"location":@"117.302649,31.870604"}
                       ,@{@"name":@"栖霞寺",@"url":@"e44.sutra",@"location":@"118.962904,32.156857"}
                       ,@{@"name":@"大报恩寺",@"url":@"e45.sutra",@"location":@"118.788345,32.015823"}
                       ,@{@"name":@"寒山寺",@"url":@"e46.sutra",@"location":@"120.574907,31.316454"}
                       ,@{@"name":@"西园寺",@"url":@"e47.sutra",@"location":@"120.593631,31.321518"}
                       ,@{@"name":@"大明寺",@"url":@"e48.sutra",@"location":@"119.419311,32.425243"}
                       ,@{@"name":@"金山寺",@"url":@"e49.sutra",@"location":@"119.422267,32.226621"}
                       ,@{@"name":@"龙华寺",@"url":@"e50.sutra",@"location":@"121.458265,31.181637"}
                       ,@{@"name":@"静安寺",@"url":@"e51.sutra",@"location":@"121.451615,31.229837"}
                       ,@{@"name":@"玉佛寺",@"url":@"e52.sutra",@"location":@"121.451536,31.247802"}
                       ,@{@"name":@"麓山寺",@"url":@"e53.sutra",@"location":@"112.941327,28.186379"}
                       ,@{@"name":@"开福寺",@"url":@"e54.sutra",@"location":@"112.984862,28.230044"}
                       ,@{@"name":@"上封寺",@"url":@"e55.sutra",@"location":@"112.705685,27.297732"}
                       ,@{@"name":@"东林寺",@"url":@"e56.sutra",@"location":@"112.642463,27.095643"}
                       ,@{@"name":@"佛教四大名山之普陀山",@"url":@"e57.sutra",@"location":@"122.397894,30.008592"}
                       ,@{@"name":@"普济寺",@"url":@"e58.sutra",@"location":@"122.393451,29.991108"}
                       ,@{@"name":@"法雨寺",@"url":@"e59.sutra",@"location":@"122.399712,30.009029"}
                       ,@{@"name":@"慧济寺",@"url":@"e60.sutra",@"location":@"122.397684,30.017692"}
                       ,@{@"name":@"灵隐寺",@"url":@"e61.sutra",@"location":@"120.10826,30.246569"}
                       ,@{@"name":@"净慈寺",@"url":@"e62.sutra",@"location":@"120.155433,30.23529"}
                       ,@{@"name":@"国清寺",@"url":@"e63.sutra",@"location":@"121.0542927128,29.1758228833"}
                       ,@{@"name":@"阿育王寺",@"url":@"e64.sutra",@"location":@"121.750054,29.852567"}
                       ,@{@"name":@"七塔寺",@"url":@"e65.sutra",@"location":@"121.742504,29.87401"}
                       ,@{@"name":@"开元寺",@"url":@"e66.sutra",@"location":@"118.591965,24.919412"}
                       ,@{@"name":@"南山寺",@"url":@"e67.sutra",@"location":@"117.654893,24.503098"}
                       ,@{@"name":@"南普陀寺",@"url":@"e68.sutra",@"location":@"118.103053,24.447029"}
                       ,@{@"name":@"光孝寺",@"url":@"e69.sutra",@"location":@"113.26318,23.135024"}
                       ,@{@"name":@"南华寺",@"url":@"e70.sutra",@"location":@"113.644349,24.650416"}
                       ,@{@"name":@"云门寺",@"url":@"e71.sutra",@"location":@"113.321038,24.815506"}
                       ,@{@"name":@"洗石庵",@"url":@"e72.sutra",@"location":@"110.054596,23.404230"}
                       ,@{@"name":@"弘法寺",@"url":@"e73.sutra",@"location":@"114.188148,22.583463"}];
    NSLog(@"TuData ==== %@",[DataPrepare convertToJsonData:array]);

    return array;
}

+ (NSString *)convertToJsonData:(id)dict

{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}

@end
