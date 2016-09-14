//
//  EditCollectionReusableView.h
//  WealthNetwork
//
//  Created by ArJun on 16/7/9.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendGroup.h"
@class EditCollectionReusableView;

@protocol EditCollectionReusableViewDelegate <NSObject>

@optional
- (void) headerViewBtnDidClick:(EditCollectionReusableView *)headerView;

@end
@interface EditCollectionReusableView : UICollectionReusableView
@property (nonatomic, weak) id<EditCollectionReusableViewDelegate> delegate;
@property (nonatomic, copy) NSString *text;
@property (nonatomic,strong) FriendGroup *friendGroup;
@end
