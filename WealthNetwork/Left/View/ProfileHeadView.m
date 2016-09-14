//
//  ProfileHeadView.m
//  WealthNetwork
//
//  Created by ArJun on 16/9/5.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "ProfileHeadView.h"

@interface ProfileHeadView ()
@property (nonatomic, strong) UIButton *iconBtn;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *phoneLabel;
@property (nonatomic, strong) UILabel *rankLabel;
@property (nonatomic, strong) UIButton *arrowsBtn;
@end
@implementation ProfileHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.iconBtn];
        [self addSubview:self.userNameLabel];
        [self addSubview:self.phoneLabel];
        [self addSubview:self.rankLabel];
        [self addSubview:self.arrowsBtn];
        UIView *lines = [[UIView alloc]init];
        lines.backgroundColor = [UIColor colorWithWhite:0.200 alpha:1.000];
        [self addSubview:lines];
        
        
        [self.iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(70);
            make.leading.equalTo(self).offset(15);
            make.centerY.equalTo(self);
        }];
        [self.arrowsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.trailing.equalTo(self).offset(-15);
        }];
        [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.iconBtn.mas_trailing).offset(10);
            make.height.mas_equalTo(20);
            make.top.equalTo(self.iconBtn);
            make.trailing.equalTo(self);
        }];
        [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.userNameLabel);
            make.height.mas_equalTo(20);
            make.top.equalTo(self.userNameLabel.mas_bottom).offset(5);
            make.trailing.equalTo(self);
        }];
        [self.rankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.userNameLabel);
            make.height.mas_equalTo(20);
            make.top.equalTo(self.phoneLabel.mas_bottom).offset(5);
            make.trailing.equalTo(self);
        }];
        [lines mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(1);
            make.leading.equalTo(self.iconBtn);
            make.trailing.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
    }
    return self;
}

- (UIButton *)iconBtn{
    if (!_iconBtn) {
        _iconBtn = [[UIButton alloc]init];
        _iconBtn.layer.cornerRadius = 35;
        _iconBtn.layer.masksToBounds = YES;
        [_iconBtn setBackgroundImage:[UIImage imageNamed:@"default－portrait"] forState:UIControlStateNormal];
    }
    return _iconBtn;
}
- (UIButton *)arrowsBtn{
    if (!_arrowsBtn) {
        _arrowsBtn = [[UIButton alloc]init];
        [_arrowsBtn setImage:[UIImage imageNamed:@"invest_detail_arrow_right_gray"] forState:UIControlStateNormal];
    }
    return _arrowsBtn;
}
- (UILabel *)userNameLabel{
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc]init];
        _userNameLabel.textColor = [UIColor whiteColor];
        _userNameLabel.font = [UIFont systemFontOfSize:18];
        _userNameLabel.text = @"Mr.杨";
        
    }
    return _userNameLabel;
}
- (UILabel *)phoneLabel{
    if (!_phoneLabel) {
        _phoneLabel = [[UILabel alloc]init];
        _phoneLabel.textColor = [UIColor whiteColor];
        _phoneLabel.font = [UIFont systemFontOfSize:14];
        _phoneLabel.text = @"123456789";
    }
    return _phoneLabel;
}
- (UILabel *)rankLabel{
    if (!_rankLabel ) {
        _rankLabel = [[UILabel alloc]init];
        _rankLabel.font = [UIFont systemFontOfSize:14];
        _rankLabel.textColor = [UIColor colorWithRed:0.914 green:0.710 blue:0.545 alpha:1.000];
        _rankLabel.text = @"金卡用户";
    }
    return _rankLabel;
}

@end
