//
//  KeViewController.m
//  Sutra
//
//  Created by medica_mac on 2017/6/28.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "KeViewController.h"
#import "JingDetailCtrl.h"

#import "KeTitleCell.h"

#import "KeAlbum.h"

@interface KeViewController (){
    NSMutableArray *_Ke;
    NSMutableArray *_KeAlbum;
}

@end

@implementation KeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self creatKeData];
}

- (void)creatKeData {
    _KeAlbum= [[NSMutableArray alloc] init];

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
    [albumSutraList addObject:@{@"name":@"赞观音文",@"url":@"b12zgyw.sutra"}];
    [albumSutraList addObject:@{@"name":@"阿弥陀经",@"url":@"b13amtj.sutra"}];
    [albumSutraList addObject:@{@"name":@"礼佛大忏悔文",@"url":@"b14dchw.sutra"}];
    [albumSutraList addObject:@{@"name":@"蒙山施食",@"url":@"b15msss.sutra"}];
    [albumSutraList addObject:@{@"name":@"往生咒",@"url":@"b16wsz.sutra"}];
    [albumSutraList addObject:@{@"name":@"观闻圣号",@"url":@"b17gwsh.sutra"}];
    [albumSutraList addObject:@{@"name":@"发愿文慈云净土",@"url":@"b18fywj.sutra"}];
    [albumSutraList addObject:@{@"name":@"伽蓝赞",@"url":@"b19qlz.sutra"}];
    [albumSutraList addObject:@{@"name":@"普贤菩萨警众偈",@"url":@"b20jzj.sutra"}];
    [albumSutraList addObject:@{@"name":@"韦天赞",@"url":@"b21wtz.sutra"}];

    KeAlbum *morningSong = [[KeAlbum alloc] initWithName:@"早课" array:albumSutraList];
    KeAlbum *eveningSong = [[KeAlbum alloc] initWithName:@"晚课" array:albumSutraList];
    
    [_KeAlbum addObject:morningSong];
    [_KeAlbum addObject:eveningSong];
    
    _Ke=[[NSMutableArray alloc] init];
    
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case KeSectionSingle:
            return _Ke.count;
            break;
            
        default:
            return _KeAlbum.count;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    static NSString *albumIdentifier = @"album";
    static NSString *singleIdentifier = @"single";
    
    switch (indexPath.section) {
        case KeSectionSingle:
        {
            if (indexPath.row >= [_Ke count]) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                if (cell == nil) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                }
                return cell;
            }
            
            NSDictionary *jingDic = [_Ke objectAtIndex:indexPath.row];
            
            KeTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:singleIdentifier];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"KeTitleCell" owner:self options:nil] lastObject];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            [cell configureWith:jingDic[@"name"]];
            
            return cell;
        }
            break;
        case KeSectionAlbum:
        {
            if (indexPath.row >= [_KeAlbum count]) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                if (cell == nil) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                }
                return cell;
            }
            
            KeAlbum *album = [_KeAlbum objectAtIndex:indexPath.row];
            
            KeTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:albumIdentifier];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"KeTitleCell" owner:self options:nil] lastObject];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            [cell configureWith:album.albumName];
            
            return cell;
        }
            break;
        default:
            return [[UITableViewCell alloc] init];
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
    
    switch (indexPath.section) {
        case KeSectionSingle:
        {
            JingDetailCtrl *vc = [[JingDetailCtrl alloc] init];
            NSLog(@"didSelect Jing%@",_Ke[indexPath.row]);
            vc.detailItem = _Ke[indexPath.row];
            
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case KeSectionAlbum:
        {
            KeAlbum *album = [_KeAlbum objectAtIndex:indexPath.row];
        }
            break;
        default:
            break;
    }
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
