//
//  KeViewController.m
//  Sutra
//
//  Created by medica_mac on 2017/6/28.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "KeViewController.h"

#import "JingDetailCtrl.h"
#import "KeAlbumDetailCtrl.h"

#import "KeTitleCell.h"

#import "KeAlbum.h"

@interface KeViewController (){
    NSArray *_Ke;
    NSArray *_KeAlbum;
    
}

@property (nonatomic , weak) IBOutlet UITableView *tableView;
@property (nonatomic , weak) IBOutlet UIImageView *BG;

@end

@implementation KeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self creatKeData];
    [self setUI];
}

- (void)creatKeData {
    _KeAlbum= [DataPrepare installKeHomeAlbumData];
    _Ke=[DataPrepare installKeHomeSingleData];
}

- (void)setUI {
    self.navigationItem.title = @"功课";//@"阿弥陀经";
    
    self.tableView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.3];
    
    UIImage *image = nil;
    if (SCREENWIDTH == 320) {
        image = [UIImage imageNamed:@"Ke640.jpg"];
    }else if (SCREENWIDTH == 375) {
        image = [UIImage imageNamed:@"Ke750.jpg"];
    }else if (SCREENWIDTH == 414) {
        image = [UIImage imageNamed:@"Ke1242.jpg"];
    }
    
    if (image) {
        self.BG.image = image;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 30)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, SCREENWIDTH, 30)];
    
    switch (section) {
        case KeSectionSingle:
            label.text = @"其他";
            break;
        case KeSectionAlbum:
            label.text = @"早晚课";
            break;
        default:
            break;
    }
    
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:12];
    label.shadowColor = [UIColor whiteColor];
    label.shadowOffset =  CGSizeMake(1, 1);
    
    [view addSubview:label];
    
    return view;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case KeSectionSingle:
            return @"其他";
            break;
        case KeSectionAlbum:
            return @"早晚课";
            break;
        default:
            break;
    }
    
    return @"";
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
            
            NSDictionary *jingDic = [_KeAlbum objectAtIndex:indexPath.row];
            
            KeTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:albumIdentifier];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"KeTitleCell" owner:self options:nil] lastObject];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            [cell configureWith:jingDic[@"name"]];
            
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
    switch (indexPath.section) {
        case KeSectionSingle:
        {
            JingDetailCtrl *vc = [[JingDetailCtrl alloc] init];
            vc.detailItem = _Ke[indexPath.row];
            
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case KeSectionAlbum:
        {
            KeAlbumDetailCtrl *vc = [[KeAlbumDetailCtrl alloc] init];
            vc.detailItem = _KeAlbum[indexPath.row];

            [self.navigationController pushViewController:vc animated:YES];
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
