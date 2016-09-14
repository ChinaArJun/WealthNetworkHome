//
//  LeftViewController.m
//  WealthNetwork
//
//  Created by ArJun on 16/9/5.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "LeftViewController.h"
#import "ProfileHeadView.h"
#import "ProfileCellArrowModel.h"
#import "ProfileCellGroupModel.h"

#define leftWidth (SCREEN_WIDTH * 0.75)
@interface LeftViewController ()
// 当前控制器
@property (nonatomic, weak) UIViewController *mainVc;
// 头部视图
@property (nonatomic, strong) ProfileHeadView *headView;
// 蒙版层
@property (nonatomic, strong) UIView *rightShadowView;
@end

@implementation LeftViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.098 alpha:1.000];
    [self setupDateLiset];
}

- (void)setupDateLiset{
    ProfileCellArrowModel *liveRecord = [[ProfileCellArrowModel alloc]initWithTitle:@"尧富钱包" icon:@"invest_detail_comment_gray"];
    liveRecord.rightLabel = @"300元";
    
    ProfileCellArrowModel *profit = [[ProfileCellArrowModel alloc]initWithTitle:@"充值" icon:@"invest_detail_comment_gray"];
    profit.bottomLabel = @"充100送20，多充多送";
    
    ProfileCellArrowModel *money = [[ProfileCellArrowModel alloc]initWithTitle:@"优惠兑换" icon:@"invest_detail_comment_gray"];
    ProfileCellArrowModel *history = [[ProfileCellArrowModel alloc]initWithTitle:@"邀请有礼" icon:@"invest_detail_comment_gray"];
    history.bottomLabel = @"邀请新人，TA得200元，你得50元";
    
    ProfileCellArrowModel *setting = [[ProfileCellArrowModel alloc]initWithTitle:@"订单管理" icon:@"invest_detail_comment_gray"];
    ProfileCellArrowModel *setting2 = [[ProfileCellArrowModel alloc]initWithTitle:@"消息中心" icon:@"invest_detail_comment_gray"];
    ProfileCellArrowModel *setting3 = [[ProfileCellArrowModel alloc]initWithTitle:@"更多" icon:@"invest_detail_comment_gray"];
    
    ProfileCellGroupModel *group = [[ProfileCellGroupModel alloc]initWithCells:@[liveRecord,profit,money,history,setting,setting2,setting3]];
    [self.groups addObject:group];

}

- (instancetype)initWithMainVc:(UIViewController *)vc{
    self.mainVc = vc;
    self = [super initWithStyle:UITableViewStylePlain];
    // 添加tableView
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.frame = SCREEN_BOUNDS;
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, leftWidth, 120)];
    [self.view addSubview:self.headView];
    [[UIApplication sharedApplication].keyWindow insertSubview:self.tableView belowSubview:vc.view];
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self leftDismiss];
}

- (void)leftViewShow{
    __weak typeof(self) WeadSelf = self;
    [self.mainVc.view addSubview:self.rightShadowView];
    self.rightShadowView.alpha = 0;
    [UIView animateWithDuration:0.25 animations:^{
        WeadSelf.rightShadowView.alpha = 1;
        WeadSelf.mainVc.view.transform = CGAffineTransformMakeTranslation(leftWidth , 0);
    } completion:^(BOOL finished) {
        
    }];
}
- (void)leftDismiss{
    
    [UIView animateWithDuration:0.25 animations:^{
        self.mainVc.view.transform = CGAffineTransformMakeTranslation(SCREEN_WIDTH - SCREEN_WIDTH, 0);
        self.rightShadowView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.rightShadowView removeFromSuperview];
    }];
}

- (void)didTapRightShowView:(UITapGestureRecognizer *)tap{
    [self leftDismiss];
}

#pragma mark --- 懒加载 ---
- (ProfileHeadView *)headView{
    if (!_headView) {
        _headView = [[ProfileHeadView alloc]initWithFrame:CGRectMake(0, 0, leftWidth, 120)];
        _headView.backgroundColor = [UIColor colorWithWhite:0.098 alpha:1.000];
    }
    return _headView;
}

- (UIView *)rightShadowView{
    if (!_rightShadowView) {
        _rightShadowView = [[UIView alloc]initWithFrame:SCREEN_BOUNDS];
        _rightShadowView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapRightShowView:)];
        [_rightShadowView addGestureRecognizer:tap];
    }
    return _rightShadowView;
}
@end
