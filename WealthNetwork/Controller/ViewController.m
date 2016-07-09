//
//  ViewController.m
//  WealthNetwork
//
//  Created by ArJun on 16/7/9.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "Friend.h"
#import "FriendGroup.h"
#import "ViewController.h"
#import "CollectionViewCell.h"
#import "EditCollectionReusableView.h"

#define SCREENBOUDS [UIScreen mainScreen].bounds
#define celllIdentifier @"cell"
#define sectionIndentifier   @"sectionHeaderIndentifier"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,EditCollectionReusableViewDelegate>

@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) UICollectionView *collectionView;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主页";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    [self initNaviBar];
    [self initUI];
}

- (void)initNaviBar{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"me"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarClick)];
    
    UIBarButtonItem *searchBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(searchBtnClick)];
    
    UIBarButtonItem *editBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"edit"] style:UIBarButtonItemStylePlain target:self action:@selector(editBtnClick)];
    
    NSArray *rightBars = [[NSArray alloc]initWithObjects:editBtn,searchBtn, nil];
    self.navigationItem.rightBarButtonItems = rightBars;
}
- (void)initUI{
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:celllIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"EditCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:sectionIndentifier];
}



#pragma mark - ---| naviBarClick |---

- (void)leftBarClick{
    
}
- (void)searchBtnClick{
    
}
- (void)editBtnClick{
    
}

#pragma mark - ---| UICollectionViewDelegate |---

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataList.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    FriendGroup *fg=self.dataList[section];
    return fg.isExpand?fg.friends.count:0;
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:celllIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    FriendGroup *fg=self.dataList[indexPath.section];
    Friend *frd=fg.friends[indexPath.row];
    cell.myFriend=frd;
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, 50);
}
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        EditCollectionReusableView *headerView =  [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:sectionIndentifier forIndexPath:indexPath];
        headerView.delegate = self;
        FriendGroup *fg=self.dataList[indexPath.section];
        headerView.friendGroup = fg;
        headerView.text = fg.name;
        return headerView;
    }
    return nil;
}

#pragma mark - ---| EditCollectionReusableViewDelegate |---

- (void) headerViewBtnDidClick:(EditCollectionReusableView *)headerView{
    NSIndexSet *set=[NSIndexSet indexSetWithIndex:[self.dataList indexOfObject:headerView.friendGroup]];
    [self.collectionView reloadSections:set];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        CGFloat itemWH = SCREENBOUDS.size.width*0.3;
        layout.itemSize = CGSizeMake(itemWH, itemWH);
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (NSArray *)dataList{
    if (!_dataList ) {
        _dataList=[FriendGroup friendGroups];
    }
    return _dataList;
}

@end
