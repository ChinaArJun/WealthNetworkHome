//
//
//  WealthNetwork
//
//  Created by ArJun on 16/7/9.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "FriendGroup.h"
#import "Friend.h"

@implementation FriendGroup
+ (NSArray *)friendGroups
{
    //读取plist文件
    NSArray *dicArr=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil]];
    //创建模型数组
    NSMutableArray *desArr=[NSMutableArray array];
    for (NSDictionary *dic in dicArr) {
        FriendGroup *fg=[FriendGroup friendGroupWithDic:dic];
        fg.friends=[Friend myFriends:fg.friends];
        NSLog(@"self.name = %@",fg.name);
        //添加
        [desArr addObject:fg];
    }
    return desArr;
}

+ (instancetype) friendGroupWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

- (instancetype) initWithDic:(NSDictionary *)dic
{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
@end
