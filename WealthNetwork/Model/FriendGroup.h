//
//
//  WealthNetwork
//
//  Created by ArJun on 16/7/9.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendGroup : NSObject
@property (nonatomic,assign) NSInteger online;
@property (nonatomic,strong) NSArray *friends;
@property (nonatomic,copy) NSString *name;

//字典转模型,读取plist文件后，将字典数组转模型数组
+ (NSArray *)friendGroups;

+ (instancetype) friendGroupWithDic:(NSDictionary *)dic;
- (instancetype) initWithDic:(NSDictionary *)dic;


//标记当前组是否展开
@property (nonatomic,assign) BOOL isExpand;
@end
