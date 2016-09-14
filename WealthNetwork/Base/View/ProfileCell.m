//
//  ProfileCell.m
//  NOW
//
//  Created by ArJun on 16/9/2.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "ProfileCell.h"
#import "ProfileCellArrowModel.h"

@interface ProfileCell ()
@property (nonatomic, weak) UIButton *userIconBtn;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *rightLabel;
@property (nonatomic, weak) UILabel *bottomlabel;
@property (nonatomic, weak) UIView *buttomLineView;
@end

@implementation ProfileCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UILabel *nameLabale = [[UILabel alloc]init];
        self.nameLabel = nameLabale;
        nameLabale.textColor = [UIColor whiteColor];
        nameLabale.font = [UIFont systemFontOfSize:18];
        [self addSubview:nameLabale];
        
        UIButton *btn = [[UIButton alloc]init];
        self.userIconBtn = btn;
        [self addSubview:self.userIconBtn];
        
        UIView *buttomLineView= [[UIView alloc] init];
        self.buttomLineView = buttomLineView;
        buttomLineView.alpha = 0.6;
        buttomLineView.backgroundColor = [UIColor colorWithWhite:0.200 alpha:1.000];
        [self addSubview:buttomLineView];
        
        UILabel *label = [[UILabel alloc]init];
        self.rightLabel = label;
        [label setFont:[UIFont systemFontOfSize:20]];
        [label setTextColor:[UIColor whiteColor]];
        [self addSubview:label];
        
        UILabel *bottomlabel = [[UILabel alloc]init];
        self.bottomlabel = bottomlabel;
        [bottomlabel setFont:[UIFont systemFontOfSize:13]];
        [bottomlabel setTextColor:[UIColor colorWithRed:0.914 green:0.710 blue:0.545 alpha:1.000]];
        [self addSubview:bottomlabel];
    }
    return self;
}

- (void)setCellModel:(ProfileCellModel *)cellModel
{
    _cellModel = cellModel;
    self.nameLabel.text = cellModel.title;
    
    if (cellModel.icon) {
        self.imageView.image = [UIImage imageNamed:cellModel.icon];
    }
    if (cellModel.userIcon) {
        [self.userIconBtn setImage:[UIImage imageNamed:cellModel.userIcon] forState:UIControlStateNormal];
        
    }
    if (cellModel.rightLabel) {
        NSLog(@"cellModel.rightLabel = %@",cellModel.rightLabel);
        self.rightLabel.text = cellModel.rightLabel;
    }
    if (cellModel.bottomLabel) {
        self.bottomlabel.text = cellModel.bottomLabel;
        self.nameLabel.y -=10;
    }
    
    if ([cellModel.title isEqualToString:@"订单管理"]) {
        
    }
    
    if ([self.cellModel isKindOfClass:[ProfileCellArrowModel class]]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
}

#define msgBtnWidth 15
#define labelWidth 200
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.userIconBtn setFrame:CGRectMake(CGRectGetWidth(self.frame)-100, 0, 70, 70)];
    [self.userIconBtn setCenterY:self.frame.size.width * 0.5];
    
    [self.nameLabel setFrame:CGRectMake(50, 0, labelWidth, 20)];
    [self.nameLabel setCenterY:self.height * 0.5];
    
    [self.rightLabel setFrame:CGRectMake(CGRectGetMaxX(self.frame)-155, 0, labelWidth, 50)];
    [self.rightLabel setCenterY:self.height * 0.5];
    
    [self.bottomlabel setFrame:CGRectMake(50, CGRectGetMaxY(self.nameLabel.frame), labelWidth, 15)];
    
    self.buttomLineView.frame = CGRectMake(CGRectGetMinX(self.imageView.frame), CGRectGetHeight(self.frame) - 1,SCREEN_WIDTH, 1);
}

- (void)beautifyCell
{
    self.detailTextLabel.font = [UIFont systemFontOfSize:12.f];
    UIView *selectedView = [[UIView alloc]init];
    selectedView.backgroundColor = [UIColor colorWithWhite:0.200 alpha:1.000];
    self.selectedBackgroundView = selectedView;
    self.nameLabel.textColor = [UIColor darkGrayColor];
}


@end
