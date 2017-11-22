//
//  JingListViewController.m
//  Sutra
//
//  Created by medica_mac on 2017/6/15.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "JingListViewController.h"
#import "JingDetailCtrl.h"

#import "JingTitleCell.h"

@interface JingListViewController (){
    
    NSArray *_Jing;
    
}

@property (nonatomic , weak) IBOutlet UITableView *tableView;
@property (nonatomic , weak) IBOutlet UIImageView *BG;

@end

@implementation JingListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"佛经";//@"阿弥陀经";
    
    self.tableView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
    
    UIImage *image = nil;
    if (SCREENWIDTH == 320) {
        image = [UIImage imageNamed:@"Jing640.jpg"];
    }else if (SCREENWIDTH == 375) {
        image = [UIImage imageNamed:@"Jing750.jpg"];
    }else if (SCREENWIDTH == 414) {
        image = [UIImage imageNamed:@"Jing1242.jpg"];
    }
    
    if (image) {
        self.BG.image = image;
    }
    
    [self createJingData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)createJingData{
    _Jing=[DataPrepare installJingData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _Jing.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *articlIdentifier = @"article";
    static NSString *jingIdentifier = @"jing";
    
    if (indexPath.row >= [_Jing count]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:articlIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:articlIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
    
    NSDictionary *jingDic = [_Jing objectAtIndex:indexPath.row];
    
    JingTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:jingIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JingTitleCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell configureWith:jingDic[@"name"]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    JingDetailCtrl *vc = [[JingDetailCtrl alloc] init];
    vc.detailItem = _Jing[indexPath.row];
    
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
