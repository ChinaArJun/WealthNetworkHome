//
//  LeftViewController.h
//  WealthNetwork
//
//  Created by ArJun on 16/9/5.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewController.h"

@interface LeftViewController : BaseTableViewController
- (instancetype)initWithMainVc:(UIViewController *)vc;
- (void)leftViewShow;
- (void)leftDismiss;
@end
