//
//  AllPeopleViewController.m
//  PresentChangeUI
//
//  Created by timkao on 13/12/26.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "AllPeopleViewController.h"
#import "dataSource.h"
#import "People.h"

@interface AllPeopleViewController ()

@end

@implementation AllPeopleViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
  
}


#pragma -mark -- CollectionView

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

   dataSource *data = [dataSource getDataSource];
    
   return [[data PeopleDataSource]count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    collectionView.scrollEnabled = YES;
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    //取得資料來源
    dataSource *data = [dataSource getDataSource];
    
    //修改cell上的物件 名字
   UILabel *label = (UILabel *) [[cell.contentView subviews] objectAtIndex:1];
    
    label.text = [(People *)[data.PeopleDataSource objectAtIndex:indexPath.row] Name];

    cell.backgroundColor =[UIColor whiteColor];
    return cell;
}

@end
