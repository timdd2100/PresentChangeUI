//
//  dataSource.m
//  PresentChangeUI
//
//  Created by timkao on 13/12/25.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "dataSource.h"

static dataSource *PresentCenter;




@implementation dataSource
@synthesize PeopleDataSource,PresentDataSource;

/*
 singleton-class
 
 讓大家共用它的資源
 */

+(id)getDataSource
{
    if(PresentCenter == Nil)
    {
        PresentCenter = [[dataSource alloc] init];
        PresentCenter.PeopleDataSource = [NSMutableArray new];
        PresentCenter.PresentDataSource = [NSMutableArray new];
    }
    return PresentCenter;
}


@end
