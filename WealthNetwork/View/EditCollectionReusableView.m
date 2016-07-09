//
//  EditCollectionReusableView.m
//  WealthNetwork
//
//  Created by ArJun on 16/7/9.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "EditCollectionReusableView.h"

@interface EditCollectionReusableView ()
@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation EditCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnDidCilck)];
    [self addGestureRecognizer:tap];
}

- (void)btnDidCilck{
    self.friendGroup.isExpand=!self.friendGroup.isExpand;
    if ([self.delegate respondsToSelector:@selector(headerViewBtnDidClick:)]) {
        [self.delegate headerViewBtnDidClick:self];
    }
}

- (void)setText:(NSString *)text{
    _text = text;
    self.title.text = text;
}

@end
