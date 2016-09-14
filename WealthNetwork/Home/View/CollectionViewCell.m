//
//  CollectionViewCell.m
//  WealthNetwork
//
//  Created by ArJun on 16/7/9.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *text;

@end
@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setMyFriend:(Friend *)myFriend
{
    _myFriend=myFriend;
    self.text.text = myFriend.name;
}

@end
