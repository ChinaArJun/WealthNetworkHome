//
//
//  WealthNetwork
//
//  Created by ArJun on 16/7/9.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "Friend.h"

@implementation Friend

+ (NSArray *)myFriends:(NSArray *)dicArr
{
    NSMutableArray *desArr=[NSMutableArray array];
    for (NSDictionary *dic in dicArr) {
        Friend *f=[Friend friendWithDic:dic];
        [desArr addObject:f];
    }
    return desArr;
}

+ (instancetype) friendWithDic:(NSDictionary *)dic
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
