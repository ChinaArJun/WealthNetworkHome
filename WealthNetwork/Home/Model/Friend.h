//
//
//  WealthNetwork
//
//  Created by ArJun on 16/7/9.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *intro;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign,getter=isVip) BOOL vip;

//字典转模型：传递字典数组，返回模型数组
+ (NSArray *)myFriends:(NSArray *)dicArr;

+ (instancetype) friendWithDic:(NSDictionary *)dic;
- (instancetype) initWithDic:(NSDictionary *)dic;
@end
